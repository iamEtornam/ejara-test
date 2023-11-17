import 'package:ejara_assignment/features/models/payment/payment_type.dart';
import 'package:ejara_assignment/features/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentMethodView extends StatelessWidget {
  PaymentMethodView({super.key});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: CircleAvatar(
            radius: 20,
            backgroundColor:
                Theme.of(context).colorScheme.tertiary.withOpacity(.1),
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.tertiary,
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
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(.4),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.folder_outlined,
                            color: Colors.white,
                            size: 40,
                          )),
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
                            text: '20,000',
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
                            text: 'CFA',
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
                                '10,000CFA',
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
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(.1),
                            child: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          title: Text(
                            'Cash payment',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          subtitle: Text(
                            'Fees: Offer',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                          ),
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
}
