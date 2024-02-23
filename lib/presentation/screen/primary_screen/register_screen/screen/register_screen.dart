import 'package:e_commerce/core/Constants/image_constant.dart';
import 'package:e_commerce/presentation/screen/primary_screen/register_screen/widget/register_text_form_field.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/primary_text.dart';
import 'package:e_commerce/presentation/screen/primary_screen/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
        CustomHeading(heading: "Let's Get Started",),
        SizedBoxHeight(),
        CustomSubHeading(subHeading: "Create a new account",),
        SizedBoxHeight(),
        CustomRegisterTextField(),
        SizedBoxHeight(),
      ],
    );
  }
}
