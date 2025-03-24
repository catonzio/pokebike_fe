import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moto_hunters/app/config/colors.dart';
import 'package:moto_hunters/app/data/api_response.dart';
import 'package:moto_hunters/app/modules/login_register/views/mbutton.dart';
import 'package:moto_hunters/app/routes/app_pages.dart';
import 'package:moto_hunters/app/shared/controllers/storage.dart';
import 'package:moto_hunters/app/shared/extensions/context_utils.dart';
import 'package:moto_hunters/app/shared/utils/decoration_image.dart';

import '../controllers/login_register_controller.dart';

class LoginRegisterView extends GetView<LoginRegisterController> {
  const LoginRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: getDarkDecorationImage('assets/images/splash_old.png', 0.2)),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: context.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _accessRegisterColumn(context),
              const OppureRow(),
              _googleAccessButton(context)
            ],
          ),
        ),
      ),
    ));
  }

  MButton _googleAccessButton(BuildContext context) {
    return MButton(
      onPressed: () => _googleRegister(context),
      backgroundColor: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/google.png",
            height: context.height * 0.03,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'registerGoogle'.tr,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: MColors.primaryDark),
            ),
          )
        ],
      ),
    );
  }

  Column _accessRegisterColumn(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: MButton(
            onPressed: () => _access(context),
            backgroundColor: MColors.secondary,
            child: Text('access'.tr, style: context.textTheme.bodySmall),
          ),
        ),
        MButton(
          onPressed: () => _register(context),
          backgroundColor: Colors.white,
          child: Text(
            'registerYou'.tr,
            style: context.textTheme.bodySmall!
                .copyWith(color: MColors.primaryDark),
          ),
        ),
      ],
    );
  }

  _access(BuildContext context) {
    context.pushNamed(Routes.LOGIN);
  }

  _register(BuildContext context) {
    context.pushNamed(Routes.REGISTER);
  }

  _googleRegister(BuildContext context) async {
    ApiResponse response = await controller.googleRegister();
    if (!response.success && response.status == 410) {
      if (context.mounted) {
        context.pushNamed(Routes.REGISTER, arguments: response.data);
      }
    }
    if (response.success) {
      Storage.to.apiToken = response.data;
      controller.checkToken().then((bool value) => !context.mounted
          ? null
          : value
              ? context.navigator
                  .pushNamedAndRemoveUntil(Routes.HOME, (_) => false)
              : context.navigator.pushNamedAndRemoveUntil(
                  Routes.CONFIRM_REGISTER,
                  (r) => r.settings.name == Routes.LOGIN_REGISTER));
      // if (context.mounted) {
      //   context.pushNamedAndRemoveUntil(Routes.HOME, (_) => false);
      // }
    }
  }
}

class OppureRow extends StatelessWidget {
  const OppureRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
              flex: 2,
              child: Divider(
                thickness: 1,
                color: Colors.white,
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'or'.tr,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          const Expanded(
              flex: 2,
              child: Divider(
                thickness: 1,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
