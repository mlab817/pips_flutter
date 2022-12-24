import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import '../../app/dependency_injection.dart';
import '../../domain/model/model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final PageController _pageController = PageController();

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    // set onboardingScreenViewed on _bind
    _appPreferences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapShot) {
        return _getContentWidget(snapShot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: _buildAppBar(),
        body: _buildBody(sliderViewObject),
        bottomSheet: _buildBottomSheet(sliderViewObject),
      );
    }
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

  PageView _buildBody(SliderViewObject sliderViewObject) {
    return PageView.builder(
        controller: _pageController,
        itemCount: sliderViewObject.numberOfSlides,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          // return OnboardingPage
          return OnboardingPage(sliderViewObject.sliderObject);
        });
  }

  Container _buildBottomSheet(SliderViewObject sliderViewObject) {
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
          _getBottomSheetWidget(sliderViewObject),
        ],
      ),
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
                  _viewModel.goPrevious(),
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
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goNext(),
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

  Widget _getProperCircle(int index, int _currentIndex) {
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

  const OnboardingPage(this._sliderObject, {Key? key});

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
