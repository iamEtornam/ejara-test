import 'package:ejara_assignment/features/models/payment/payment_type.dart';
import 'package:ejara_assignment/features/models/user/user.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:ejara_assignment/resources/resources.dart';
import 'package:ejara_assignment/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum PaymentMethodOption { add, select }

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key, required this.user});

  final User? user;

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  final scrollController = ScrollController();
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    final totalBalance = (widget.user?.data?.wallets ?? []).fold(
        0, (previousValue, element) => (element.balance ?? 0) + previousValue);
    final amountInWallet =
        NumberFormat("#,##0.00", "en_US").format(totalBalance / 100);
    final dailyLimitValue = (widget.user?.data?.dailyLimit ?? 0) / 100;
    final currency = widget.user?.data?.fiatCurrencyCode;
    final dailyLimit =
        NumberFormat.simpleCurrency(decimalDigits: 2, name: currency)
            .format(dailyLimitValue);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(90),
            child: CircleAvatar(
              radius: 20,
              backgroundColor:
                  Theme.of(context).colorScheme.tertiary.withOpacity(.1),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).colorScheme.tertiary,
                size: 15,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<PaymentType>(
          future: paymentProvider.getPaymentMethods(),
          builder: (context, snapshot) {
            final isLoading =
                snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data == null;

            final paymentMethod = snapshot.data?.data ?? [];
            return Skeletonizer(
              enabled: isLoading,
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'Choose a payment \nmethod',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    shadowColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(.4),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                              child: Image.asset(Images.icFolder,
                                  color: Colors.white, width: 35, height: 35)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ejara Flex',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: amountInWallet,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          TextSpan(
                            text: currency ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )
                        ])),
                        const SizedBox(height: 15),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Earnings per day',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                              ),
                              Text(
                                dailyLimit,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Select a payment methods',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 15),
                  ListView.separated(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final method = paymentMethod[index];
                        return PaymentMethodListTile(
                          onPressed: () async {
                            final res = await displayBottomSheet(context,
                                method: method);
                            if (res == null) return;
                            if (res == PaymentMethodOption.add && mounted) {
                              context.pushNamed(RoutesName.addMethodRoute.name);
                            }
                          },
                          title: method.titleEn ?? method.titleFr ?? '',
                          description: method.descriptionEn ??
                              method.descriptionFr ??
                              '',
                          iconImage: method.iconImage ?? '',
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.grey.shade300,
                          ),
                      itemCount: paymentMethod.length)
                ],
              ),
            );
          }),
    );
  }

  Future<PaymentMethodOption?> displayBottomSheet(BuildContext context,
      {required Data method}) async {
    return showModalBottomSheet<PaymentMethodOption?>(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, innerState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Text(
                        'Select the ${method.titleEn} method',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded))
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 25),
                  MethodListTile(
                      groupValue: groupValue,
                      number: '9 96 000 000',
                      title: 'Orange Money',
                      onChanged: (p0) => innerState(() => groupValue = p0)),
                  const SizedBox(height: 15),
                  MethodListTile(
                      groupValue: groupValue,
                      number: '9 96 000 043',
                      title: 'Orange Money',
                      onChanged: (p0) => innerState(() => groupValue = p0)),
                  const SizedBox(height: 15),
                  MethodListTile(
                      groupValue: groupValue,
                      number: '9 96 000 654',
                      title: 'MTN Mobile Money',
                      onChanged: (p0) => innerState(() => groupValue = p0)),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Or',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1)),
                      onPressed: () =>
                          Navigator.of(context).pop(PaymentMethodOption.add),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Another mobile money method',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      )),
                  const SizedBox(height: 35),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Continue',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          });
        });
  }
}

class MethodListTile extends StatelessWidget {
  const MethodListTile(
      {super.key,
      required this.groupValue,
      this.onChanged,
      required this.title,
      required this.number});

  final String? groupValue;
  final void Function(String?)? onChanged;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RadioListTile.adaptive(
            enableFeedback: true,
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text(
              number,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            value: number,
            groupValue: groupValue,
            onChanged: onChanged),
      ),
    );
  }
}

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({
    super.key,
    required this.onPressed,
    required this.title,
    required this.description,
    required this.iconImage,
  });

  final VoidCallback onPressed;
  final String title;
  final String description;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(.1),
        child: Center(
            child: iconImage.isEmpty
                ? Image.asset(
                    Images.icBank,
                    width: 20,
                    height: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                : Image.network(iconImage)),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
      ),
    );
  }
}
