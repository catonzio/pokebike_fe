import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/decoration_image.dart';

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
          image: getDarkDecorationImage('assets/images/splash.png', 0.2)),
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
              // const OppureRow(),
              // _googleAccessButton(context)
            ],
          ),
        ),
      ),
    ));
  }

  // MButton _googleAccessButton(BuildContext context) {
  //   return MButton(
  //     onPressed: () => _googleRegister(context),
  //     backgroundColor: Colors.white,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Image.asset(
  //           "assets/icons/google.png",
  //           height: context.height * 0.04,
  //           fit: BoxFit.contain,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 8.0),
  //           child: Text(
  //             'registerGoogle'.tr,
  //             style: context.textTheme.bodySmall
  //                 ?.copyWith(color: MColors.primaryDark),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
    context.navigator.pushNamed(Routes.LOGIN);
  }

  _register(BuildContext context) {
    context.navigator.pushNamed(Routes.REGISTER);
  }

  _googleRegister(BuildContext context) {}
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
