import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/consts.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/dont_have_an_account.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/social_signin_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
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
                    email = value!;
                  },
                  hintText: "البريد الالكتروني",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "نسيت كلمة المرور",
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                CustomButton(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signIn(email, password);
                    // Call the sign-in method from the SigninCubit
                    // context.read<SigninCubit>().signin(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }, text: "تسجيل الدخول"),
                SizedBox(height: 32),
                DontHaveAnAccount(),
                SizedBox(height: 32),
                OrDivider(),
                SizedBox(height: 16),
                SocialSigninButton(
                  image: Assets.imagesGoogleIcon,
                  title: "تسجيل بواسطه جوجل",
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                SocialSigninButton(
                  image: Assets.imagesFacebookIcon,
                  title: "تسجيل بواسطه فيسبوك",
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                SocialSigninButton(
                  image: Assets.imagesApplIcon,
                  title: "تسجيل بواسطه أبل",
                  onPressed: () {},
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
