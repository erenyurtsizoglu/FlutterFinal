import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labeltext;
  final Icon icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // Change this line
  final bool obsecureText;
  final List<TextInputFormatter>? formatters;

  const CustomTextField({
    Key? key,
    required this.labeltext,
    required this.icon,
    this.controller,
    this.validator,
    required this.obsecureText,
    this.formatters,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 10,
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: TextFormField(
          inputFormatters: widget.formatters,
          obscureText: widget.obsecureText,
          controller: widget.controller,
          validator: widget.validator, // This will now match the expected type
          decoration: InputDecoration(
              border: InputBorder.none, hintText: widget.labeltext, contentPadding: const EdgeInsets.only(left: 20)),
        ),
      ),
    );
  }
}

