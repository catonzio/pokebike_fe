import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/decoration_image.dart';
import 'package:pokebike/app/shared/utils/input_decoration.dart';
import 'package:pokebike/app/shared/widgets/base_app_bar.dart';
import 'package:pokebike/app/shared/widgets/utils/loading_stack.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(
            onBackPressed: () =>
                context.navigator.popAndPushNamed(Routes.LOGIN_REGISTER)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: getDecorationImage('assets/images/login_bg.png', 0.3)),
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingStack(
                  isLoading: controller.isPerformingLogin,
                  child: _mainBody(context))),
        ));
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShimmerTitle.dark(text: "Bentornato!"),
        SizedBox(
          height: context.height * 0.25,
          child: Form(
              key: controller.formKey,
              child: DefaultTextStyle(
                style: Themes.formTextStyle,
                child: _formBody(context),
              )),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: MButton(
                onPressed: () => _login(context),
                backgroundColor: MColors.secondaryDark,
                child: const Text("Accedi"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () => _onRegister(context),
                child: const Text("Non hai un account? Registrati",
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _formBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("E-mail"),
        TextFormField(
            controller: controller.emailController,
            minLines: 1,
            maxLines: 1,
            style: Themes.formTextStyle,
            validator: controller.emailValidator,
            decoration: lightInputDecoration("E-mail")),
        const Text("Password"),
        Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword,
            minLines: 1,
            maxLines: 1,
            style: Themes.formTextStyle,
            validator: controller.passwordValidator,
            decoration: lightInputDecoration("Password",
                isPassword: true,
                toggleObscurePassword: controller.toggleObscurePassword))),
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () => _passwordForgotten(context),
            child: const Text("Password dimenticata?",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }

  _login(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      bool result = await controller.login();
      if (context.mounted) {
        if (result) {
          context.navigator.popAndPushNamed(Routes.HOME);
        } else {
          context.scaffold.showSnackBar(SnackBar(
            content: const Text("Errore durante il login"),
            action: SnackBarAction(
              label: "Ok",
              onPressed: () => context.scaffold.clearSnackBars(),
            ),
          ));
        }
      }
    }
  }

  _passwordForgotten(BuildContext context) {}

  _onRegister(BuildContext context) {
    context.navigator.popAndPushNamed(Routes.REGISTER);
  }
}
