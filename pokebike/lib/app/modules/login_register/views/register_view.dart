import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/config/themes.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/modules/login_register/register_form_field.dart';
import 'package:moto_hunters/app/modules/login_register/views/checkbox_form_field.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/modules/login_register/views/photo_picker.dart';
import 'package:moto_hunters/app/modules/login_register/views/register_form_field.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/api_utils.dart';
import 'package:moto_hunters/app/shared/utils/decoration_image.dart';
import 'package:moto_hunters/app/shared/widgets/base_app_bar.dart';
import 'package:moto_hunters/app/shared/widgets/utils/loading_stack.dart';
import 'package:moto_hunters/app/shared/widgets/shimmer_title.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
              image: getLightDecorationImage(
                  'assets/images/register_bg.png', 0.15)),
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
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: ShimmerTitle.dark(text: 'welcome'.tr),
          ),
        ),
        Expanded(
          // height: context.height * 0.35,
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.keyboardHeight / 1.5),
            child: Form(
                key: controller.formKey,
                child: DefaultTextStyle(
                  style: Themes.darkFormTextStyle,
                  child: _formBody(context),
                )),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: MButton(
                  onPressed: () => _register(context),
                  backgroundColor: MColors.secondaryDark,
                  child: Text('frwd'.tr),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () => _onAlreadyAccount(context),
                  child: Text('alreadyAccount'.tr, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _formBody(BuildContext context) {
    List<RegisterFormFieldModel> fields = [
      RegisterFormFieldModel(
          label: 'email'.tr,
          validator: controller.emailValidator,
          controller: controller.emailController,
          isPassword: false),
      RegisterFormFieldModel(
          label: 'name'.tr,
          validator: controller.nomeValidator,
          controller: controller.nomeController,
          isPassword: false),
      RegisterFormFieldModel(
          label: 'surname'.tr,
          validator: controller.cognomeValidator,
          controller: controller.cognomeController,
          isPassword: false),
      RegisterFormFieldModel(
          label: 'username'.tr,
          validator: controller.usernameValidator,
          controller: controller.usernameController,
          isPassword: false),
      RegisterFormFieldModel(
          label: 'password'.tr,
          validator: controller.passwordValidator,
          controller: controller.passwordController,
          isPassword: true),
      RegisterFormFieldModel(
          label: 'passwordConfirm'.tr,
          validator: controller.confirmPasswordValidator,
          controller: controller.confirmPasswordController,
          isPassword: true),
      RegisterFormFieldModel(
          label: 'birthday'.tr,
          validator: controller.birthdateValidator,
          controller: controller.birthdateController,
          isPassword: false,
          onTap: () => _askBirthdate(context))
    ];
    return SingleChildScrollView(
      child: Column(children: [
        ...fields.map((RegisterFormFieldModel e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RegisterFormField(
              model: e,
              toggleObscurePassword: controller.toggleObscurePassword,
              obscurePassword: controller.obscurePassword,
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Obx(() => PhotoPicker(
                text: controller.avatar.value?.name ?? 'selectAvatar'.tr,
                validator: controller.avatarValidator,
                onSuccess: controller.setAvatar,
              )),
        ),
        CheckboxFormField(
          value: controller.isPrivacyAccepted,
          onChanged: controller.togglePrivacy,
          title: Text('privacy'.tr),
          validator: (value) => value == false ? 'acceptPrivacy'.tr : null,
        ),
      ]),
    );
  }

  _register(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      ApiResponse response = await controller.register();
      if (context.mounted) {
        if (!response.success) {
          controller.formKey.currentState?.validate();
        }
        handleApiResponse(context, response, onSuccess: (dynamic data) {
          Storage.to.apiToken = data;
          context.navigator
              .pushNamedAndRemoveUntil(Routes.CONFIRM_REGISTER, (_) => false);
        });
      }
    }
  }

  _onAlreadyAccount(BuildContext context) {
    context.navigator.popAndPushNamed(Routes.LOGIN);
  }

  _askBirthdate(BuildContext context) async {
    DateTime? time = await showDatePicker(
        context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
    if (time != null) {
      controller.birthdateController.text =
          "${time.day}-${time.month}-${time.year}";
    }
  }
}
