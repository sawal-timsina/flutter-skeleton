import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show FormBuilderDropdown;

import 'input_field.dart';

class DropDown<T> extends StatelessWidget {
  final String name;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final String? hintText;
  final bool? required;
  final bool? enabled;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final FormFieldValidator<T>? validator;
  final List<DropdownMenuItem<T>> items;

  const DropDown({
    Key? key,
    required this.name,
    required this.items,
    this.onChanged,
    this.label,
    this.hintText,
    this.required,
    this.validator,
    this.style,
    this.enabled = true,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: label,
      required: required,
      enabled: enabled,
      labelStyle: labelStyle,
      child: FormBuilderDropdown<T>(
        name: name,
        items: items,
        style: style,
        onChanged: onChanged,
        enabled: enabled!,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
        ),
      ),
    );
  }
}
