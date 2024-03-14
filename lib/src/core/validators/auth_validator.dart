import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

mixin AuthValidator {
  final FormFieldValidator<String> fullNameValidator =
      FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "full name is required"),
  ]);
  final FormFieldValidator<String> emailValidator =
      FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "email is required"),
  ]);
  final FormFieldValidator<String> passwordValidator =
      FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "password is required"),
  ]);
}
