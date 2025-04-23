import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/consts.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/terms_and_condition.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
 final GlobalKey fromKey=GlobalKey();
 AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: fromKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  hintText: "الاسم كامل",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: "البريد الالكتروني",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: "كلمة المرور",
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffC9CECF),
                  ),
                ),
                SizedBox(height: 16),
                TermsAndCondition(),
                SizedBox(height: 30),
                CustomButton(onPressed: () {
                  
                }, text: "انشاء حساب جديد"),
                SizedBox(height: 26),
                HaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
