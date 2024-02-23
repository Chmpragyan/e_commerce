import 'package:e_commerce/presentation/screen/primary_screen/register_screen/body.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomLoginTextField extends StatelessWidget {
  const CustomLoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        InkWell(
          onTap: () {},
          child: CustomButton(
            buttonText: "Sign In",
            buttonColor: Colors.blue[400],
            textColor: Colors.white,
          ),
        ),
        SizedBoxHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Divider(),
            ),
            Text("OR"),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        SizedBoxHeight(),
        InkWell(
          onTap: () {},
          child: CustomButton(
            buttonText: "Login with Google",
            buttonColor: Colors.white,
            textColor: Colors.blueGrey[500],
          ),
        ),
        SizedBoxHeight(),
        InkWell(
          onTap: () {},
          child: CustomButton(
            buttonText: "Login with Facebook",
            buttonColor: Colors.white,
            textColor: Colors.blueGrey[500],
          ),
        ),
        SizedBoxHeight(),
        InkWell(
          onTap: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.blue[400],
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        SizedBoxHeight(),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: Colors.blueGrey[500],
              fontSize: 12.0,
            ),
            children: [
              TextSpan(
                text: "Register",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
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
