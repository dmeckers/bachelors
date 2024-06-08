import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ReadLicenseWidget extends HookConsumerWidget {
  const ReadLicenseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final licenseScrollController = useScrollController();
    final licenseRead = useState<bool>(false);

    licenseScrollController.addListener(() {
      licenseRead.value = licenseScrollController.position.extentAfter < 60;
    });

    final agreedWithLicenses = ref.watch(registerModelStateNotifierProvider
        .select((value) => value.agreeWithTerms));

    toggleReadLicense(bool? value) {
      ref
          .read(registerModelStateNotifierProvider.notifier)
          .updateAgreeWithTerms(value!);
    }

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          child: CustomScrollView(
            controller: licenseScrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 50,
                automaticallyImplyLeading: false,
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'License',
                    style: context.jText.headlineLarge,
                  ),
                ),
                backgroundColor: context.jTheme.cardColor,
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(color: context.jTheme.cardColor),
                  child: Text(
                    LICENSE,
                    style: context.jText.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.all(licenseRead.value
                  ? const Color.fromARGB(255, 78, 146, 75)
                  : Colors.grey),
              splashRadius: 200,
              value: agreedWithLicenses,
              onChanged: toggleReadLicense,
            ),
            Text(
              'Read and Agreeeee with all the licenses!',
              style: context.jText.bodySmall,
            )
          ],
        ),
      ],
    );
  }
}
