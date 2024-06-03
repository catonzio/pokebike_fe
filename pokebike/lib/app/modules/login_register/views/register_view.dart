import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/modules/login_register/views/checkbox_form_field.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/decoration_image.dart';
import 'package:pokebike/app/shared/utils/input_decoration.dart';
import 'package:pokebike/app/shared/widgets/base_app_bar.dart';
import 'package:pokebike/app/shared/widgets/utils/loading_stack.dart';
import 'package:pokebike/app/shared/widgets/shimmer_title.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
              image: getDecorationImage('assets/images/register_bg.png', 0.3)),
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingStack(
                  isLoading: controller.isPerformingRegister,
                  child: _mainBody(context))),
        ));
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const ShimmerTitle(text: "Benvenuto!"),
        SizedBox(
          height: context.height * 0.35,
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
                onPressed: () => _register(context),
                backgroundColor: MColors.secondaryDark,
                child: const Text("Avanti"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () => _onAlreadyAccount(context),
                child: const Text("Hai già un account? Accedi",
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
            decoration: inputDecoration("E-mail")),
        const Text("Password"),
        Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword,
            minLines: 1,
            maxLines: 1,
            style: Themes.formTextStyle,
            validator: controller.passwordValidator,
            decoration: inputDecoration("Password",
                isPassword: true,
                toggleObscurePassword: controller.toggleObscurePassword))),
        const Text("Conferma Password"),
        Obx(() => TextFormField(
            controller: controller.confirmPasswordController,
            obscureText: controller.obscurePassword,
            minLines: 1,
            maxLines: 1,
            style: Themes.formTextStyle,
            validator: controller.confirmPasswordValidator,
            decoration: inputDecoration("Password",
                isPassword: true,
                toggleObscurePassword: controller.toggleObscurePassword))),
        InkWell(
          child: CheckboxFormField(
            value: controller.isPrivacyAccepted,
            onChanged: controller.togglePrivacy,
            title: const Text("Privacy"),
            validator: (value) =>
                value == false ? "Devi accettare la privacy" : null,
          ),
        ),
      ],
    );
  }

  _register(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      bool result = await controller.register();
      if (context.mounted) {
        if (result) {
          context.navigator.pushNamed(Routes.CONFIRM_REGISTER);
        } else {
          context.scaffold.showSnackBar(SnackBar(
            content: const Text("Errore durante la registrazione"),
            action: SnackBarAction(
              label: "Ok",
              onPressed: () => context.scaffold.clearSnackBars(),
            ),
          ));
        }
      }
    }
  }

  _onAlreadyAccount(BuildContext context) {
    context.navigator.popAndPushNamed(Routes.LOGIN);
  }
}
