import 'package:e_commerce/presentation/screen/primary_screen/login_screen/body.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRegisterTextField extends StatelessWidget {
  const CustomRegisterTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          decoration: inputDecoration(
            textHint: "Full Name",
            prefixIcon: Icon(Icons.person_2_outlined),
          ),
        ),
        SizedBoxHeight(),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: inputDecoration(
            textHint: "Your Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        SizedBoxHeight(),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: inputDecoration(
            textHint: "Password",
            prefixIcon: Icon(Icons.lock_outlined),
          ),
        ),
        SizedBoxHeight(),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: inputDecoration(
            textHint: "Password Again",
            prefixIcon: Icon(Icons.lock_outlined),
          ),
        ),
        SizedBoxHeight(),
        InkWell(
          onTap: () {},
          child: CustomButton(
            buttonText: "Sign Up",
            buttonColor: Colors.blue[400],
            textColor: Colors.white,
          ),
        ),
        SizedBoxHeight(),
        RichText(
          text: TextSpan(
            text: "Have an account? ",
            style: TextStyle(
              color: Colors.blueGrey[500],
              fontSize: 12.0,
            ),
            children: [
              TextSpan(
                text: "Sign In",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                style: TextStyle(
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
