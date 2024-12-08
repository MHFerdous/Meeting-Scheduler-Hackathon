import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewAndConfirmPasswordTextField extends StatefulWidget {
  NewAndConfirmPasswordTextField({
    super.key,
    required TextEditingController passwordTEController,
    required TextEditingController confirmPasswordTEController,
    required this.isObscure,
    required this.password,
    required this.confirmPassword,
  })  : _passwordTEController = passwordTEController,
        _confirmPasswordTEController = confirmPasswordTEController;

  final TextEditingController _passwordTEController;
  final TextEditingController _confirmPasswordTEController;
  final String password;
  final String confirmPassword;
  bool isObscure;
  @override
  State<NewAndConfirmPasswordTextField> createState() =>
      _NewAndConfirmPasswordTextFieldState();
}

class _NewAndConfirmPasswordTextFieldState
    extends State<NewAndConfirmPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 323.w,
          child: TextFormField(
            controller: widget._passwordTEController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: widget.isObscure,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: widget.password,
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
        ),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          width: 323.w,
          child: TextFormField(
            controller: widget._confirmPasswordTEController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: widget.isObscure,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: widget.confirmPassword,
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
              if (value != widget._passwordTEController.text) {
                return "Password didn't match";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
