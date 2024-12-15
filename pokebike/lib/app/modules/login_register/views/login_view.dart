import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/data/api_response.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/controllers/storage.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/api_utils.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
            onBackPressed: () =>
                context.navigator.popAndPushNamed(Routes.LOGIN_REGISTER)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image:
                  getLightDecorationImage('assets/images/login_bg.png', 0.1)),
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
        ShimmerTitle.dark(text: 'welcomeBack'.tr),
        SizedBox(
          height: context.height * 0.25,
          child: Form(
              key: controller.formKey,
              child: DefaultTextStyle(
                style: Themes.darkFormTextStyle,
                child: _formBody(context),
              )),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: MButton(
                onPressed: controller.isPerformingLogin.value
                    ? null
                    : () => _login(context),
                backgroundColor: MColors.secondaryDark,
                child: Text('access'.tr),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: controller.isPerformingLogin.value
                    ? null
                    : () => _onRegister(context),
                child: Text('noAccount'.tr, textAlign: TextAlign.center),
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
        Text('email'.tr),
        TextFormField(
            key: controller.emailFormKey,
            controller: controller.emailController,
            minLines: 1,
            maxLines: 1,
            style: Themes.darkFormTextStyle,
            validator: controller.emailValidator,
            keyboardType: TextInputType.emailAddress,
            decoration: lightInputDecoration('email'.tr)),
        Text('password'.tr),
        Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword,
            minLines: 1,
            maxLines: 1,
            style: Themes.darkFormTextStyle,
            validator: controller.passwordValidator,
            decoration: lightInputDecoration('password'.tr,
                isPassword: true,
                toggleObscurePassword: controller.toggleObscurePassword))),
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: controller.isPerformingLogin.value
                ? null
                : () => _passwordForgotten(context),
            child: Text('pwdForgot'.tr,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }

  _login(BuildContext context) async {
    if (controller.formKey.currentState?.validate() ?? false) {
      controller.login().then((ApiResponse response) {
        if (context.mounted) {
          handleApiResponse(context, response, onSuccess: (dynamic data) {
            Storage.to.apiToken = data;
            controller.checkToken().then((bool value) => !context.mounted
                ? null
                : value
                    ? context.navigator
                        .pushNamedAndRemoveUntil(Routes.HOME, (_) => false)
                    : context.navigator.pushNamedAndRemoveUntil(Routes.CONFIRM_REGISTER,
                        (r) => r.settings.name == Routes.LOGIN_REGISTER));
            // context.pushNamedAndRemoveUntil(Routes.HOME, (_) => false);
          });
        }
      });
    }
  }

  _passwordForgotten(BuildContext context) {
    if (controller.emailFormKey.currentState?.validate() ?? false) {
      controller.passwordForgot().then((ApiResponse value) {
        if (context.mounted) {
          handleApiResponse(context, value,
              successMessage: 'resetEmailSent'.trParams({
                'status': value.message.contains('throttled')
                    ? '${'already'.tr} '
                    : ''
              }));
        }
      });
    }
  }

  _onRegister(BuildContext context) {
    context.navigator.popAndPushNamed(Routes.REGISTER);
  }
}
