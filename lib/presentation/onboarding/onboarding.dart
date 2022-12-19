import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubtitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubtitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubtitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubtitle4, ImageAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.white,
      elevation: AppSize.s0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  PageView _buildBody(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          // return OnboardingPage
          return OnboardingPage(_list[index]);
        });
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      color: ColorManager.white,
      height: AppSize.s100,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          _getBottomSheetWidget(),
        ],
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.chevron_left,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.chevron_right,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--;

    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }

    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;

    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }

    return _currentIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return Icon(
        Icons.circle,
        size: AppSize.s12,
        color: ColorManager.white,
      );
    } else {
      return Icon(
        Icons.circle_outlined,
        size: AppSize.s12,
        color: ColorManager.white,
      );
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnboardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(
          _sliderObject.image,
          width: screenSize.width * 0.65,
        ),
      ],
    );
  }
}

// model for slider object
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
