import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../common/misc/safe_scaffold.dart';
import '../../common/rounded_button.dart';
import '../../gen/assets.gen.dart';
import '../../theme/colors.dart';

class ErrorPage extends StatelessWidget {
  final GoRouterState? state;
  const ErrorPage({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return SafeScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Animation
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Assets.animations.animationError.lottie(
                fit: BoxFit.contain,
                repeat: false,
              ),
            ),

            // Message
            Text(
              "ERROR_PAGE.ERROR".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            // Padding
            const SizedBox(height: 10),

            // Message if error is not null
            if (state?.error != null) ...[
              Text(
                "ERROR_PAGE.ERROR_MESSAGE".tr(
                  namedArgs: {
                    "error": state?.error?.toString() ?? "GENERAL.UNKNOWN".tr(),
                  },
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              // Padding
              const SizedBox(height: 20),
            ],

            // Button
            RoundedButton(
              text: "ERROR_PAGE.GO_HOME".tr(),
              backgroundColor: lightPurple,
              onPressed: () => context.goNamed(StartPageProvider.routeName),
            )
          ],
        ),
      ),
    );
  }
}
