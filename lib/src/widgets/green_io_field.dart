import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GreenIOField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool password;
  final Formatter? formatter;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const GreenIOField({
    super.key,
    required this.label,
    this.icon,
    this.password = false,
    this.formatter,
    this.initialValue,
    this.validator,
    this.readOnly = false,
    this.controller,
  });

  @override
  State<GreenIOField> createState() => _GreenIOFieldState();
}

class _GreenIOFieldState extends State<GreenIOField> {
  bool showPassword = true;

  @override
  void initState() {
    super.initState();

    showPassword = !widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        inputFormatters: widget.formatter == null ? const [] : _getFormatter(widget.formatter),
        obscureText: !showPassword,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.password
              ? IconButton(
                  icon: showPassword ? const Icon(Icons.visibility_rounded) : const Icon(Icons.visibility_off_rounded),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : null,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

enum Formatter { cpf, phone }

List<TextInputFormatter> _getFormatter(Formatter? formatter) {
  final RegExp numbersOnly = RegExp(r'[0-9]');
  return switch (formatter) {
    Formatter.cpf => [
        MaskTextInputFormatter(
          mask: '###.###.###-##',
          filter: {'#': numbersOnly},
        )
      ],
    Formatter.phone => [
        MaskTextInputFormatter(
          mask: '(##) # ####-####',
          filter: {'#': numbersOnly},
        )
      ],
    null => [],
  };
}
