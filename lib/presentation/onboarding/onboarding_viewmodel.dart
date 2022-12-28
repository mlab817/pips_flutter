import 'dart:async';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';

import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers is used to communicate with view
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;

  int _currentIndex = 0;

  @override
  void dispose() {
    // close stream when view is disposed
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    // TODO: implement goNext
    int nextIndex = _currentIndex++;

    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    // TODO: implement goPrevious
    int previousIndex = _currentIndex--;

    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
    _currentIndex = index;
    // send data to view
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);

  // private functions
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

  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// inputs mean the orders that view model will receive from view
abstract class OnBoardingViewModelInputs {
  // method: _getPreviousIndex()
  void goNext(); // when user swipes right or taps right arrow

  // method: _getNextIndex()
  void goPrevious(); // when user swipes left or taps left arrow

  void onPageChanged(int index); // when page changes

  Sink
      get inputSliderViewObject; // this is the way to add data to stream, i.e. stream inputs
}

// outputs mean data or results will be sent to view
abstract class OnBoardingViewModelOutputs {
  // will be implemented later
  Stream<SliderViewObject> get outputSliderViewObject;
}

//
class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}
