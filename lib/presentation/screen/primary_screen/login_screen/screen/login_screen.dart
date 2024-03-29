import 'package:e_commerce/core/Constants/image_constant.dart';
import 'package:e_commerce/presentation/screen/primary_screen/login_screen/widgets/login_text_form_field.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/primary_text.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(AddImages.appLogo),
          width: 150,
          height: 150,
        ),
        SizedBoxHeight(),
        CustomHeading(heading: "Welcome to F-Shop",),
        SizedBoxHeight(),
        CustomSubHeading(subHeading: "Sign in to continue",),
        SizedBoxHeight(),
        CustomLoginTextField(),
        SizedBoxHeight(),
      ],
    );
  }
}
