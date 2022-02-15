import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController? controller;

  final String? label;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final FormFieldValidator? validator;

  final Function? onSaved;

  final FocusNode? focusNode;

  final FocusNode? nextNode;

  final String? hint;

  final TextCapitalization? textCapitalization;

  final TextInputType? textInputType;

  final bool isPassword;
  final bool autoFocus;
  final bool readOnly;
  final int? maxLines;
  final Key? validationKey;

  const InputField(
      this.context, {
        Key? key,
        required this.controller,
        this.label,
        this.prefixIcon,
        this.suffixIcon,
        this.validator,
        this.onSaved,
        this.focusNode,
        this.nextNode,
        this.hint,
        this.textCapitalization,
        this.textInputType,
        this.isPassword = false,
        this.autoFocus = false,
        this.readOnly = false,
        this.maxLines,
        this.validationKey,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: validationKey,
      focusNode: focusNode,
      onFieldSubmitted: nextNode != null ? (value) => FocusScope.of(context).requestFocus(nextNode) : null,
      textInputAction: nextNode != null ? TextInputAction.next : TextInputAction.done,
      keyboardType: textInputType ?? TextInputType.text,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      toolbarOptions: const ToolbarOptions(paste: true, selectAll: true, copy: true),
      validator: validator,
      readOnly: readOnly,
      onSaved: (newValue) => onSaved != null ? onSaved!() : () {},
      obscureText: isPassword,
      maxLines: isPassword ? 1 : maxLines,
      autofocus: autoFocus,
      style: const TextStyle(fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
