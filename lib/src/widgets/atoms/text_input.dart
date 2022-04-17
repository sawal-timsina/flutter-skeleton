import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show FormBuilderTextField;

import '../../config/themes/colors.dart';
import 'input_field.dart';

class TextInput extends StatefulWidget {
  final String name;
  final ValueChanged<String?>? onChanged;
  final String? label;
  final String? hintText;
  final bool? required;
  final bool? enabled;
  final int? maxLength;
  final bool? showCounter;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;

  const TextInput({
    Key? key,
    required this.name,
    this.onChanged,
    this.label,
    this.hintText,
    this.required,
    this.maxLength,
    this.showCounter,
    this.validator,
    this.obscureText = false,
    this.style,
    this.enabled = true,
    this.labelStyle,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _secureText = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _secureText = widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: widget.label,
      required: widget.required,
      enabled: widget.enabled,
      labelStyle: widget.labelStyle,
      child: FormBuilderTextField(
        key: widget.key,
        name: widget.name,
        keyboardType: widget.keyboardType,
        style: widget.style ?? Theme.of(context).textTheme.subtitle2,
        obscureText: _secureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        maxLength: widget.maxLength,
        enabled: widget.enabled ?? true,
        decoration: InputDecoration(
          counterText: widget.showCounter == false ? "" : null,
          contentPadding: const EdgeInsets.all(16),
          hintText: widget.hintText,
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _secureText = !_secureText;
                    });
                  },
                  icon: Icon(
                    _secureText == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.greyDark,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
