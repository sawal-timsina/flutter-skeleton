import 'package:flutter/material.dart'
    show
        BoxConstraints,
        BuildContext,
        EdgeInsets,
        FormFieldValidator,
        Icon,
        IconButton,
        Icons,
        InputDecoration,
        Key,
        State,
        StatefulWidget,
        TextAlignVertical,
        TextInputType,
        TextStyle,
        Theme,
        ValueChanged,
        Widget;
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
  final int? maxLines;
  final bool? showCounter;
  final bool obscureText;
  final TextStyle? style;
  final Widget? suffix;
  final BoxConstraints? suffixIconConstraints;

  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;

  final TextStyle? labelStyle;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;

  const TextInput({
    Key? key,
    required this.name,
    this.onChanged,
    this.label,
    this.hintText,
    this.required,
    this.maxLength,
    this.maxLines,
    this.showCounter,
    this.validator,
    this.obscureText = false,
    this.style,
    this.enabled = true,
    this.labelStyle,
    this.keyboardType,
    this.suffix,
    this.textAlignVertical,
    this.suffixIconConstraints,
    this.prefix,
    this.prefixIconConstraints,
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
        textAlignVertical: widget.textAlignVertical,
        name: widget.name,
        keyboardType: widget.keyboardType,
        style: widget.style ?? Theme.of(context).textTheme.subtitle2,
        obscureText: _secureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        maxLength: widget.maxLength,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        enabled: widget.enabled ?? true,
        decoration: InputDecoration(
          counterText: widget.showCounter == false ? "" : null,
          contentPadding: const EdgeInsets.all(16),
          hintText: widget.hintText,
          prefixIcon: widget.prefix,
          prefixIconConstraints: widget.prefixIconConstraints,
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
              : widget.suffix,
          suffixIconConstraints: widget.suffixIconConstraints,
        ),
      ),
    );
  }
}
