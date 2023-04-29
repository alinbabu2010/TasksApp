import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../generated/l10n.dart';
import '../utils/dimens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocale = S.of(context);
    return FlutterLogin(
      onLogin: (data) {},
      onSignup: (data) {},
      onRecoverPassword: (data) {},
      onSubmitAnimationCompleted: () {},
      messages: LoginMessages(
        loginButton: appLocale.labelLogin,
        signupButton: appLocale.labelCreateAccount,
        userHint: appLocale.labelEmail,
        passwordHint: appLocale.labelPassword,
        confirmPasswordHint: appLocale.labelConfirmPassword,
        forgotPasswordButton: appLocale.labelForgotPassword,
        recoverPasswordButton: appLocale.labelReset,
        recoverPasswordIntro: appLocale.recoverPasswordIntro,
        recoverPasswordDescription: appLocale.recoverPasswordDescription,
        confirmPasswordError: appLocale.confirmPasswordError,
        flushbarTitleSuccess: appLocale.labelSuccess,
        flushbarTitleError: appLocale.labelError,
        goBackButton: appLocale.labelBack,
      ),
      theme: LoginTheme(
        primaryColor: Theme.of(context).colorScheme.primary,
        accentColor: Theme.of(context).colorScheme.secondary,
        authButtonPadding:
            const EdgeInsets.symmetric(vertical: Dimens.authButtonVPadding),
      ),
      scrollable: true,
    );
  }
}
