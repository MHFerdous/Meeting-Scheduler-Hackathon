import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required TextEditingController passwordTEController,
    required this.isObscure,
    required this.hintText,
  }) : _passwordTEController = passwordTEController;

  final TextEditingController _passwordTEController;
  final String hintText;
  bool isObscure;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.w,
      child: TextFormField(
        controller: widget._passwordTEController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: widget.isObscure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: () {
              widget.isObscure = !widget.isObscure;
              setState(() {});
            },
            icon: Icon(widget.isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        validator: (String? value) {
          if (value!.length < 6) {
            return 'Password too short';
          }
          return null;
        },
      ),
    );
  }
}
