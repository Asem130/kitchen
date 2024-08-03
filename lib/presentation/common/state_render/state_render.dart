import 'package:flutter/material.dart';
import 'package:kitchen/presentation/resources/assets_manger.dart';
import 'package:kitchen/presentation/resources/color_manger.dart';
import 'package:kitchen/presentation/resources/strings_manger.dart';
import 'package:kitchen/presentation/resources/styles_manger.dart';
import 'package:kitchen/presentation/resources/values_manger.dart';
import 'package:lottie/lottie.dart';

enum StateRenderType {
  popUpErrorState,
  popUpLoadingState,

  fullSreenLoadingState,
  fullSreenEmptyState,
  fullSreenErrorState,

  contentState
}

class StateRender extends StatelessWidget {
  const StateRender({
    super.key,
    required this.stateRenderType,
    required this.reTryActionFunction,
    this.message = AppStrings.loading,
    this.title = " ",
  });

  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final Function reTryActionFunction;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.popUpErrorState:
        return _getPoUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context)
        ]);
      case StateRenderType.popUpLoadingState:
        return _getPoUpDialog(context, [
          _getAnimatedImage(JsonAssets.loading),
        ]);
      case StateRenderType.fullSreenLoadingState:
        return _getColumnItem(
          [
            _getAnimatedImage(JsonAssets.loading),
            _getMessage(message),
          ],
        );
      case StateRenderType.fullSreenEmptyState:
        return _getColumnItem(
          [
            _getAnimatedImage(JsonAssets.empty),
            _getMessage(message),
          ],
        );
      case StateRenderType.fullSreenErrorState:
        return _getColumnItem(
          [
            _getAnimatedImage(JsonAssets.error),
            _getMessage(message),
            _getRetryButton(AppStrings.tryAgainLater, context),
          ],
        );
      case StateRenderType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPoUpDialog(
    BuildContext context,
    List<Widget> children,
  ) {
    return Dialog(
      backgroundColor: ColorManger.white,
      elevation: AppSize.s1_5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Container(
        decoration: BoxDecoration(color: ColorManger.white, boxShadow: [
          BoxShadow(
            color: Colors.black26,
          ),
        ]),
        child: _getDoalogContent(context, children),
      ),
    );
  }

  Widget _getDoalogContent(
    BuildContext context,
    List<Widget> children,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getColumnItem(
    List<Widget> children,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String  animationName) {
    return Lottie.asset(animationName);
  }

  Widget _getMessage(String message) {
    return Text(
      message,
      style: getRegularStyle(color: ColorManger.black, fontSize: AppSize.s18),
    );
  }

  Widget _getRetryButton(String bottonTitle, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (stateRenderType == StateRenderType.fullSreenErrorState) {
            reTryActionFunction();
          }
          {
            Navigator.of(context).pop();
          }
        },
        child: Text(bottonTitle));
  }
}
