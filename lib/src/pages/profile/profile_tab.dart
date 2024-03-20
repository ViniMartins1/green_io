import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/config/app_data.dart';
import 'package:green_io/src/model/user.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/widgets/green_io_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  User get user => AppData.user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User account'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          GreenIOField(
            label: 'Email',
            icon: Icons.email_rounded,
            initialValue: user.email,
            readOnly: true,
          ),
          GreenIOField(
            label: 'Name',
            icon: Icons.person_rounded,
            initialValue: user.name,
            readOnly: true,
          ),
          GreenIOField(
            label: 'Phone',
            icon: Icons.phone_rounded,
            formatter: Formatter.phone,
            initialValue: user.phone,
            readOnly: true,
          ),
          GreenIOField(
            label: 'CPF',
            icon: Icons.file_copy_rounded,
            formatter: Formatter.cpf,
            initialValue: user.cpf,
            readOnly: true,
          ),
          GreenIOOutlinedButton(
            label: 'Change password',
            onPressed: () {
              changePassword();
            },
          ),
        ],
      ),
    );
  }

  Future<bool?> changePassword() async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        surfaceTintColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.appSwatchColor),
              ),
              const SizedBox(height: 12),
              const GreenIOField(
                label: 'Actual password',
                icon: Icons.lock_rounded,
                password: true,
              ),
              const GreenIOField(
                label: 'New password',
                icon: Icons.lock_outline_rounded,
                password: true,
              ),
              const GreenIOField(
                label: 'Confirm password',
                icon: Icons.lock_outline_rounded,
                password: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: GreenIOOutlinedButton(
                      label: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GreenIOButton(
                      label: 'Confirm',
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
