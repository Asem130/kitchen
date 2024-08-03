import 'dart:async';

import 'package:kitchen/domain/usecase/login_usecase.dart';
import 'package:kitchen/presentation/base/base_view_model.dart';
import 'package:kitchen/presentation/common/freezed_data_classes.dart';
import 'package:kitchen/presentation/common/state_render/state_render.dart';
import 'package:kitchen/presentation/common/state_render/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  StreamController _allDataValidController = StreamController<void>.broadcast();
  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);
  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _userNameStreamController.close();
    _allDataValidController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  // inputs
  @override
  setPassword(String password) {
    inputpassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAllDataValid.add(null);
  }

  @override
  setUsername(String name) {
    inputUserName.add(name);
    loginObject = loginObject.copyWith(userName: name);
    inputAllDataValid.add(null);
  }

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputpassword => _passwordStreamController.sink;
  Sink get inputAllDataValid => _allDataValidController.sink;

  @override
  login() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popUpLoadingState,
        message: "loading..."));
    (await _loginUseCase.excute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold((failure) => {
          inputState.add(ErrorState(StateRenderType.popUpErrorState,failure.message))
        
          },
            (data) => {
             inputState.add(ContentState())
              
              });
  }

  // outputs
  @override
  Stream<bool> get outPasswordValid => _passwordStreamController.stream.map(
        (passwrd) => _isPasswordValid(passwrd),
      );

  @override
  Stream<bool> get outUserNameValid => _userNameStreamController.stream.map(
        (userName) => _isUserNameValid(userName),
      );
  Stream<bool> get outputAllDataValid =>
      _userNameStreamController.stream.map((_) => _areAllDataValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAllDataValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

abstract mixin class LoginViewModelInput {
  setUsername(String name);
  setPassword(String password);

  login();
  Sink get inputUserName;
  Sink get inputpassword;
  Sink get inputAllDataValid;
}

abstract mixin class LoginViewModelOutput {
  Stream<bool> get outUserNameValid;
  Stream<bool> get outPasswordValid;
  Stream<bool> get outputAllDataValid;
}
