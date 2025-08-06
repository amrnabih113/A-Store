import 'package:a_store/features/onboarding/models/onboardingmodel.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/images.dart';

class MyOnBoardingRepo {
  List<MyOnBoardingModel> onBoardingList = [
    MyOnBoardingModel(
        image: MyImages.onBoardingImage1,
        title: S.current.onBoardingTitle1,
        subtitle: S.current.onBoardingSubTitle1),
    MyOnBoardingModel(
        image: MyImages.onBoardingImage2,
        title: S.current.onBoardingTitle2,
        subtitle: S.current.onBoardingSubTitle2),
    MyOnBoardingModel(
        image: MyImages.onBoardingImage3,
        title: S.current.onBoardingTitle3,
        subtitle: S.current.onBoardingSubTitle3),
  ];
  List<MyOnBoardingModel> getOnBoardingList() {
    return onBoardingList;
  }
}
