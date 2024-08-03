import 'package:flutter/material.dart';
import 'package:kitchen/app/constants.dart';
import 'package:kitchen/presentation/common/state_render/state_render.dart';
import 'package:kitchen/presentation/resources/strings_manger.dart';

abstract class FlowState {
  StateRenderType getstateRenderType();
  String getMessage();
}

class LoadingState extends FlowState {
  LoadingState({
    required this.stateRenderType,
    this.message = AppStrings.loading,
  });

  StateRenderType stateRenderType;
  String? message;
  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRenderType getstateRenderType() => stateRenderType;
}

class ErrorState extends FlowState {
  ErrorState(
    this.stateRenderType,
    this.message,
  );

  StateRenderType stateRenderType;
  String message;
  @override
  String getMessage() => message;

  @override
  StateRenderType getstateRenderType() => stateRenderType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRenderType getstateRenderType() => StateRenderType.contentState;
}

class EmptyState extends FlowState {
  EmptyState(this.message);
  String message;
  @override
  String getMessage() => Constants.empty;
  @override
  StateRenderType getstateRenderType() => StateRenderType.fullSreenEmptyState;
}

extension FlowStateExtention on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function reTryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getstateRenderType() == StateRenderType.popUpLoadingState) {
            showPopup(context, getstateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
                message: getMessage(),
                stateRenderType: getstateRenderType(),
                reTryActionFunction: reTryActionFunction);
          }
        }
      case EmptyState:
        {
          return StateRender(
            message: getMessage(),
            reTryActionFunction: () {},
            stateRenderType: getstateRenderType(),
          );
        }
      case ErrorState:
        { 
          dissmisDialog(context);
          if (getstateRenderType() == StateRenderType.popUpErrorState) {
            showPopup(context, getstateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
                message: getMessage(),
                stateRenderType: getstateRenderType(),
                reTryActionFunction: reTryActionFunction);
          }
        }
      case ContentState:
        {
          dissmisDialog(context);
          return contentScreenWidget;
        }
      default:
        dissmisDialog(context);
        return contentScreenWidget;
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != null;
  dissmisDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(
        context,
        rootNavigator: true,
      ).pop(true);
    }
  }

  showPopup(
      BuildContext context, StateRenderType stateRenderType, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRender(
            stateRenderType: stateRenderType, reTryActionFunction: () {})));
  }
}
