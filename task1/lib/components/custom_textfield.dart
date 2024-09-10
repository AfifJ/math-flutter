import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.onSaved,
      required this.label,
      this.icon,
      this.validator,
      this.obsecure = false,
      this.keyboardType});

  final void Function(String?) onSaved;
  final String label;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final bool obsecure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obsecure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.red[900]!)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.red[900]!)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.black26)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}