import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:pokebike/app/config/colors.dart';
import 'package:pokebike/app/modules/login_register/views/mbutton.dart';
import 'package:pokebike/app/routes/app_pages.dart';
import 'package:pokebike/app/shared/widgets/back_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: MBackButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, Routes.LOGIN_REGISTER),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/login_bg.png'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _mainBody(context),
          ),
        ));
  }

  Widget _mainBody(BuildContext context) {
    const TextStyle formTextStyle = TextStyle(
        color: MColors.primary, fontSize: 14, fontWeight: FontWeight.w400);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "Bentornato",
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: MColors.primary),
        ),
        SizedBox(
          height: context.height * 0.25,
          child: Form(
              child: DefaultTextStyle(
            style: formTextStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("E-mail"),
                TextFormField(
                    minLines: 1,
                    maxLines: 1,
                    style: formTextStyle,
                    decoration: _inputDecoration("E-mail")),
                const Text("Password"),
                Obx(() => TextFormField(
                    obscureText: controller.obscurePassword,
                    style: formTextStyle,
                    minLines: 1,
                    maxLines: 1,
                    decoration:
                        _inputDecoration("Password", isPassword: true))),
                const SizedBox(
                  width: double.infinity,
                  child: Text("Password dimenticata?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
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
            const SizedBox(
              width: double.infinity,
              child: Text("Non hai un account? Registrati",
                  textAlign: TextAlign.center),
            ),
          ],
        )
      ],
    );
  }

  _login(BuildContext context) {}

  _inputDecoration(String hintText, {bool isPassword = false}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            color: MColors.primary.withOpacity(0.4),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: MColors.secondaryDark, width: 2),
        ),
        suffix: isPassword
            ? InkWell(
                onTap: controller.toggleObscurePassword,
                child: Image.asset("assets/icons/password_obscure.png",
                    height: 18, width: 18, fit: BoxFit.contain),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: MColors.secondaryDark, width: 2),
        ));
  }
}
