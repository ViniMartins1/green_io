import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/widgets/green_io_field.dart';
import 'package:green_io/src/pages/auth/register_page.dart';
import 'package:green_io/src/pages/base/base_page.dart';
import 'package:green_io/src/config/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          TextSpan(
                            text: 'green',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'io',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const GreenIOField(
                      label: 'Email',
                      icon: Icons.email_rounded,
                    ),
                    const GreenIOField(
                      label: 'Password',
                      icon: Icons.lock_rounded,
                      password: true,
                    ),
                    GreenIOButton(
                      label: 'Enter',
                      onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const BasePage(),
                      )),
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
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
