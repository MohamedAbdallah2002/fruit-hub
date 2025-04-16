import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: [
        PageViewItem(
          isVisable: (pageController.hasClients? pageController.page!.round():0)==0,
          image: Assets.imagesPageViewItem1Image,
          backgroundColor: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: '''
اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.''',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبًا بك في',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const Text(
                " HUB",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
              ),
              const Text(
                'Fruit',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisable: (pageController.hasClients? pageController.page!.round():0)==0,
          image: Assets.imagesPageViewItem2Image,
          backgroundColor: Assets.imagesPageViewItem2BackgroundImage,
          subtitle: ''' 
نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية''',
          title: Text(
            'ابحث وتسوق',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
