abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract mixin class BaseViewModelInputs {
  void start();
  void dispose();
}

abstract mixin class BaseViewModelOutputs {}
