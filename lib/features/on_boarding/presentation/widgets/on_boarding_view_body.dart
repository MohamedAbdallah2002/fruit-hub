import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/shared_preferences_singlton.dart';
import 'package:fruit_hub/core/constant/consts.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
      const AssetImage("assets/images/page_view_item_1.png"),
      context,
    );
    precacheImage(
      const AssetImage("assets/images/page_view_item_2.png"),
      context,
    );
  }

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),

        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: const Color(0xFF1B5E37),
            color:currentPage==1? const Color(0xFF1B5E37): const Color(0xFFBDBDBD),
            size: const Size(10, 10),
            activeSize: const Size(20, 10),
            spacing: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ),
        SizedBox(height: 32),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomButton(onPressed: () {
              Prefs.setBool(kIsOnBoardingViewSeen, true);
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SigninView()),
      );
            }, text: "ابدأ الان"),
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
