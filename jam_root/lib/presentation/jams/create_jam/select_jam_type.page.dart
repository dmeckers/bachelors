import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

//todo decompose logic
class JamTypeSelectPage extends ConsumerWidget {
  const JamTypeSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Text(
            S.of(context).jamType,
            textAlign: TextAlign.right,
            style:
                context.jText.displayMedium?.copyWith(fontFamily: rubickFamily),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(ImagePathConstants.JAM_NOW_IMAGE_PATH),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(S.of(context).instantJam),
                      ),
                      Text(
                        S.of(context).startJammingNow2People,
                        style: context.jText.headlineMedium,
                      ),
                      Text(
                        S.of(context).unavailableInThisVersion,
                        style: context.jText.headlineSmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * 0.24,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(ImagePathConstants.CALL_JAM_IMAGE_PATH),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(S.of(context).calloutForJam),
                      ),
                      Text(
                        S.of(context).letPeopleKnowYouAreLookingForJam,
                        style: context.jText.headlineMedium,
                      ),
                      Text(
                        S.of(context).unavailableInThisVersion,
                        style: context.jText.headlineSmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ref
                  .read(pageListControllerProvider.notifier)
                  .addPage(const PlanJamFormPage());
              ref.read(pageControllerProvider).animateToPage(
                    2,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
            },
            child: Ink(
              color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(ImagePathConstants.PLAN_JAM_IMAGE_PATH),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(S.of(context).planAJam),
                      ),
                      Text(
                        S.of(context).scheduleJamForFutureDateTime,
                        style: context.jText.headlineMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
