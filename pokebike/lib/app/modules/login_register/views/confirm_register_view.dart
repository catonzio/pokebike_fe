import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/config/themes.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/extensions/context_utils.dart';
import 'package:pokebike/app/shared/utils/decoration_image.dart';
import 'package:pokebike/app/shared/utils/input_decoration.dart';
import 'package:pokebike/app/shared/widgets/base_app_bar.dart';
import 'package:pokebike/app/shared/widgets/loading_stack.dart';

import '../controllers/confirm_register_controller.dart';

class ConfirmRegisterView extends GetView<ConfirmRegisterController> {
  const ConfirmRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(onBackPressed: () => context.navigator.pop()),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: getDecorationImage('assets/images/register_bg.png', 0.3)),
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingStack(
                  isLoading: controller.isPerformingRegisterCheck,
                  child: _mainBody(context))),
        ));
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conferma",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: MColors.primaryDark),
            ),
            Text(
              "Registrazione",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: MColors.primaryDark),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.15,
          child: Form(key: controller.formKey, child: _formBody(context)),
        ),
        MButton(
          onPressed: () => _confirm(context),
          backgroundColor: MColors.secondaryDark,
          child: const Text("Registrati"),
        )
      ],
    );
  }

  Widget _formBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Inserisci il codice ricevuto via email"),
        TextFormField(
            controller: controller.codeController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            minLines: 1,
            maxLines: 1,
            style: Themes.formTextStyle,
            validator: controller.codeValidator,
            decoration: inputDecoration("Inserisci il codice")),
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () => _askAnotherCode(context),
            child: const Text("Richiedi un altro codice",
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

  void _confirm(BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      bool result = await controller.confirmRegister();
      if (context.mounted) {
        if (result) {
          context.navigator.pushReplacementNamed(Routes.HOME);
        } else {
          context.scaffold.showSnackBar(SnackBar(
            content: const Text("Errore in fase di registrazione"),
            action: SnackBarAction(
              label: "Ok",
              onPressed: () => context.scaffold.clearSnackBars,
            ),
          ));
        }
      }
    }
  }

  _askAnotherCode(BuildContext context) {}
}