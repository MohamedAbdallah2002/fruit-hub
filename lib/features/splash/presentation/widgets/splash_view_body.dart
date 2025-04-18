import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/shared_preferences_singlton.dart';
import 'package:fruit_hub/core/constant/consts.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
@override
  void initState() {
    excuteNavigation();
    super.initState();
    // Add any initialization logic here if needed
  }
  @override
   
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }
  
  void excuteNavigation() {
    bool isOnBoardingViewSeen=Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginView()),
  );
}else{
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const OnBoardingView()),
  );
}
    });
  }
}
