import 'package:splitwise_clone/res/app_images.dart';
import 'package:splitwise_clone/res/app_imports.dart';

class OnBoardingData {
  String image;
  String title;
  String description;

  OnBoardingData(this.image, this.title, this.description);

  static List<OnBoardingData> onBoardingDataList = [
    OnBoardingData(AppImages.onBoarding1, AppStrings.onBoardingTitle1, AppStrings.onBoardingDescr1),
    OnBoardingData(AppImages.onBoarding2, AppStrings.onBoardingTitle2, AppStrings.onBoardingDescr2),
    OnBoardingData(AppImages.onBoarding3, AppStrings.onBoardingTitle3, AppStrings.onBoardingDescr3),
  ];
}
