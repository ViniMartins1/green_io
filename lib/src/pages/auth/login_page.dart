import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/pages/auth/auth_controller.dart';
import 'package:green_io/src/routes/app_pages.dart';
import 'package:green_io/src/widgets/app_name_widget.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/widgets/green_io_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.appSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppNameWidget(fontSize: 40),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('fruits'),
                            RotateAnimatedText('vegetables'),
                            RotateAnimatedText('meat'),
                            RotateAnimatedText('cereals'),
                            RotateAnimatedText('dairy'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GreenIOField(
                        label: 'Email',
                        icon: Icons.email_rounded,
                        controller: emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) return 'Invalid email.';

                          if (!email.isEmail) return 'Type a valid email.';

                          return null;
                        },
                      ),
                      GreenIOField(
                        label: 'Password',
                        icon: Icons.lock_rounded,
                        password: true,
                        controller: passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) return 'Type your password.';

                          return null;
                        },
                      ),
                      GetX<AuthController>(
                        init: AuthController(),
                        initState: (_) {},
                        builder: (authController) {
                          return GreenIOButton(
                            label: 'Enter',
                            isLoading: authController.isLoading.value,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                await authController.signIn(emailController.text, passwordController.text);
                                Get.offNamed(PageRoutes.baseRoute);
                              }
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(color: AppColors.contrastColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 2,
                              color: Colors.grey.withAlpha(90),
                            )),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text('Or'),
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 2,
                              color: Colors.grey.withAlpha(90),
                            )),
                          ],
                        ),
                      ),
                      GreenIOOutlinedButton(
                        label: 'Sign up',
                        onPressed: () => Get.toNamed(PageRoutes.registerRoute),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
