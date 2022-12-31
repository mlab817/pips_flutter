import 'package:flutter/material.dart';
import 'package:pips_flutter/data/mapper/mapper.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';

import 'state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({
    required this.stateRendererType,
    String? message,
  }) : message = message ?? AppStrings.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(
    this.stateRendererType,
    this.message,
  );

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => emptyString;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupSuccessState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_LOADING_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case SuccessState:
        {
          dismissDialog(context);
          showPopUp(context, StateRendererType.popupSuccessState, getMessage(),
              title: AppStrings.success);
          return contentScreenWidget;
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_ERROR_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = emptyString}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              retryActionFunction: () {},
            )));
  }

  void dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
}
