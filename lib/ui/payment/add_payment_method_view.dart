import 'package:ejara_assignment/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodView extends StatefulWidget {
  const AddPaymentMethodView({super.key});

  @override
  State<AddPaymentMethodView> createState() => _AddPaymentMethodViewState();
}

class _AddPaymentMethodViewState extends State<AddPaymentMethodView> {
  bool shouldSave = false;
  String? operator;

  @override
  Widget build(BuildContext context) {
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
                Icons.close,
                color: Theme.of(context).colorScheme.tertiary,
                size: 15,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'New mobile money',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () async {
              final res = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
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
                                'Choose the mobile operator',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.close_rounded))
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 25),
                          ListTile(
                            onTap: () => Navigator.of(context).pop('MTN'),
                            title: Text(
                              'MTN',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () => Navigator.of(context).pop('Orange'),
                            title: Text(
                              'Orange',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () => Navigator.of(context).pop('Vodafone'),
                            title: Text(
                              'Vodafone',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
              if (res == null) return;
              setState(() {
                operator = res;
              });
            },
            child: IgnorePointer(
              ignoring: true,
              child: EjaraTextField(
                placeholderText: operator ?? 'Select operator',
                label: 'Choose the mobile operator',
                suffixIcons: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const EjaraTextField(
            placeholderText: '6 96 6 000 654',
            label: 'Phone number',
          ),
          const SizedBox(
            height: 15,
          ),
          const EjaraTextField(
            placeholderText: 'King',
            label: 'Full name',
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: shouldSave,
                  onChanged: (v) => setState(() => shouldSave = v)),
              const SizedBox(width: 10),
              Text(
                'Save as payment method',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 50,
            child: TextButton(
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
