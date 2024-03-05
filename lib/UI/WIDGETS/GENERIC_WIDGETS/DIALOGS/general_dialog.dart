import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_colors.dart';
import 'package:flutter_template_mobile/ui/WIDGETS/generic_widgets/BUTTONS/default_button.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CustomDialog {
  CustomDialog._();

  //mostra un messaggio in un toast
  static void showToastMessage({
    required String message,
    required BuildContext context,
    required Color color,
    IconData? icon,
    Color? iconColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        elevation: (Platform.isIOS) ? 0 : 2,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            (icon != null)
                ? Icon(
                    icon,
                    size: 25,
                    color: (iconColor != null) ? iconColor : null,
                  )
                : Container(),
            const Gap(10),
            Flexible(child: SizedBox(child: Text(message))),
          ],
        ),
      ),
    );
  }

  // mostra un messaggio in un popup
  static void showPopUpMessage({
    required String message,
    required BuildContext context,
    String? title,
    String? animation,
    VoidCallback? function,
    String? buttonText,
  }) {
    List<Widget> actionsList = (function != null)
        ? [
            DefaultButton.secondary(
              buttonText: 'Annulla',
              onPress: () => Navigator.pop(context),
            ),
            DefaultButton.primary(
              buttonText: (buttonText != null) ? buttonText : 'Conferma',
              onPress: () {
                Navigator.pop(context);
                function();
              },
            ),
          ]
        : [
            DefaultButton.secondary(
              buttonText: 'OK',
              onPress: () {
                Navigator.pop(context);
              },
              height: 42,
              width: 75,
            ),
          ];

    showGeneralDialog(
      barrierColor: Colors.black38,
      context: context,
      barrierLabel: 'Dialog barrier',
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => (Platform.isIOS)
          ? CupertinoAlertDialog(
              title: (animation != null)
                  ? Lottie.asset(animation, height: 150)
                  : Text(title ?? ''),
              content: Text(message, style: const TextStyle(fontSize: 15)),
              actions: actionsList,
            )
          : AlertDialog(
              backgroundColor: CustomColors.white,
              title: (animation != null)
                  ? Lottie.asset(animation, height: 150)
                  : Text(title ?? ''),
              content: Text(message, style: const TextStyle(fontSize: 15)),
              actions: actionsList,
            ),
    );
  }
}
