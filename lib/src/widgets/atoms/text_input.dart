import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../config/themes/colors.dart';

class TextInput extends StatefulWidget {
  final String name;
  final ValueChanged<String?>? onChanged;
  final String? labelText;
  final String? hintText;
  final bool? required;
  final int? maxLength;
  final bool? showCounter;
  final bool obscureText;
  final TextStyle? style;
  final FormFieldValidator<String>? validator;

  const TextInput({
    Key? key,
    required this.name,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.required,
    this.maxLength,
    this.showCounter,
    this.validator,
    this.obscureText = false,
    this.style,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            if (widget.labelText != null)
              Text(widget.labelText!,
                  style: Theme.of(context).textTheme.subtitle1),
            if (widget.required == true)
              Text(
                "*",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Theme.of(context).primaryColor),
              )
          ],
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          key: widget.key,
          name: widget.name,
          style: widget.style ?? Theme.of(context).textTheme.subtitle2,
          obscureText: _secureText,
          onChanged: widget.onChanged,
          validator: widget.validator,
          maxLength: widget.maxLength,
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
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyDark,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
