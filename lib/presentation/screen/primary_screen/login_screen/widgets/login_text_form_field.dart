import 'dart:convert';

import 'package:e_commerce/data/api_client.dart';
import 'package:e_commerce/presentation/screen/primary_screen/register_screen/body.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:e_commerce/presentation/screen/secondary_screen/home_screen/body.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomLoginTextField extends StatefulWidget {
  const CustomLoginTextField({super.key});

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  final loginUrl = "${ApiUrls.baseUrls}/api/authaccount/login";
  final TextEditingController eController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> loginUser() async {
    Map<String, dynamic> requestLogin = {
      "email": "john567@gmail.com",
      "password": 123456,
    };
    final response = await http.post(Uri.parse(loginUrl),
        headers: {'Content-Type': "application/json"},
        body: json.encode(requestLogin));
    if (response.statusCode == 200) {
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        dialogType: DialogType.success,
        showCloseIcon: true,
        headerAnimationLoop: false,
        // body: Center(
        //   child: Text(
        //     'Hello world',
        //     style: TextStyle(fontStyle: FontStyle.italic),
        //   ),
        // ),
        title: 'Success',
        desc: json.decode(response.body)['message'],
        btnOkOnPress: () {
          debugPrint('OnClicked');
        },
        btnOkIcon: Icons.check_circle,
        onDismissCallback: (type) {
          debugPrint('Dialog dismiss form callback $type');
        },
        
      ).show();
      print(json.decode(response.body)['message']);
    } else {
      print("---------------------------");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: eController,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration(
              textHint: "Your Email",
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          TextFormField(
            controller: passController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: inputDecoration(
              textHint: "Password",
              prefixIcon: Icon(Icons.lock_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          InkWell(
            onTap: () {
              loginUser();
              if (formKey.currentState!.validate()) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              }
            },
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
      ),
    );
  }
}
