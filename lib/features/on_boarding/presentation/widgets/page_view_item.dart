import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundColor,
    required this.subtitle,
    required this.title, required this.isVisable,
  });
  final String image, backgroundColor;
  final String subtitle;
  final Widget title;
  final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundColor, fit: BoxFit.fill),
              ),
              Positioned.fill(
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.scale(
                    scale: 0.9,
                    child: SvgPicture.asset(image),
                  ),
                ),
              ),
              Visibility(
                visible: isVisable,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("تخط", style: TextStyles.regular13.copyWith(
                    color: Color(0xff949D9E),
                  )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        title,
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(subtitle, textAlign: TextAlign.center,style: TextStyles.semiBold13.copyWith(
            color: Color(0xff4E5456),
          ),),
        ),
      ],
    );
  }
}
