import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/consts.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/terms_and_condition.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: "الاسم كامل",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "البريد الالكتروني",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
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
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            name,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "انشاء حساب جديد",
                ),
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
