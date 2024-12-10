import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/routes/app_pages.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/widgets/green_io_field.dart';
import 'package:green_io/src/widgets/return_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.appSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
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
                        const GreenIOField(
                          label: 'Name',
                          icon: Icons.person_rounded,
                        ),
                        const GreenIOField(
                          label: 'Phone',
                          icon: Icons.phone_rounded,
                          formatter: Formatter.phone,
                        ),
                        const GreenIOField(
                          label: 'CPF',
                          icon: Icons.file_copy_rounded,
                          formatter: Formatter.cpf,
                        ),
                        GreenIOButton(
                          label: 'Create account',
                          onPressed: () {
                            Get.offNamed(PageRoutes.loginRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ReturnButton(),
            ],
          ),
        ),
      ),
    );
  }
}
