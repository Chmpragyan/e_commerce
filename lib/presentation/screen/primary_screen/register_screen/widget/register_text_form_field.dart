import 'dart:convert';

import 'package:e_commerce/data/api_client.dart';
import 'package:e_commerce/presentation/screen/primary_screen/login_screen/body.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomRegisterTextField extends StatefulWidget {
  CustomRegisterTextField({super.key});

  @override
  State<CustomRegisterTextField> createState() =>
      _CustomRegisterTextFieldState();
}

class _CustomRegisterTextFieldState extends State<CustomRegisterTextField> {
  final registerUrl = "${ApiUrls.baseUrls}/api/authaccount/registration";

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController(text: "John");

  final TextEditingController emailController = TextEditingController(text: "john567@gmail.com");

  final TextEditingController passwordController = TextEditingController(text: "123456");

  final TextEditingController repasswordController = TextEditingController(text: "123456");

  Future<void> postData() async {
    Map<String, dynamic> requestData = {
      "email": emailController.text.toString(),
      "name": nameController.text.toString(),
      "password": passwordController.text.toString(),
    };
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {'Content-Type': "application/json"},
      body: json.encode(requestData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("------------------------------");
      final snackBar = SnackBar(
        content: Text(json.decode(response.body)['message']),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else{
      print("==========================");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: inputDecoration(
              textHint: "Full Name",
              prefixIcon: Icon(Icons.person_2_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter you full name";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration(
              textHint: "Your Email",
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter you email";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: inputDecoration(
              textHint: "Password",
              prefixIcon: Icon(Icons.lock_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          TextFormField(
            controller: repasswordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: inputDecoration(
              textHint: "Password Again",
              prefixIcon: Icon(Icons.lock_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              } else {
                return null;
              }
            },
          ),
          SizedBoxHeight(),
          InkWell(
            onTap: () async {
              postData();
              if (formKey.currentState!.validate()) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              }
            },
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
      ),
    );
  }
}
