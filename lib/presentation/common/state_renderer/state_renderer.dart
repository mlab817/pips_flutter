import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pips_flutter/data/mapper/mapper.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/font_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

enum StateRendererType {
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  fullScreenLoadingState,
  fullScreenErrorState,
  contentScreenState,
  emptyScreenState
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final Failure failure;
  final String message;
  final String title;
  final Function? retryActionFunction;

  StateRenderer({
    Key? key,
    required this.stateRendererType,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
  })  : message = message ?? AppStrings.loading,
        title = title ?? EMPTY,
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);

      case StateRendererType.popupSuccessState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.success)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context)
        ]);

      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMessage(message),
        ]);

      case StateRendererType.fullScreenErrorState:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(failure.message),
          _getRetryButton(AppStrings.retryButtonLabelText, context)
        ]);

      case StateRendererType.contentScreenState:
        return Container();

      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(message)]);

      default:
        return Container();
    }
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,

      child: Lottie.asset(animationName), // json image
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Text(
      message,
      style: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
            height: AppSize.s180,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType ==
                      StateRendererType.fullScreenErrorState) {
                    retryActionFunction?.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppSize.s12,
              offset: Offset(AppSize.s0, AppSize.s12),
            ),
          ],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
