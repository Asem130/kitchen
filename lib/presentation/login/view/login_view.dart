import 'package:flutter/material.dart';
import 'package:kitchen/app/di.dart';
import 'package:kitchen/presentation/common/state_render/state_renderer_impl.dart';
import 'package:kitchen/presentation/login/viewmodel/login_viewmode.dart';
import 'package:kitchen/presentation/resources/assets_manger.dart';
import 'package:kitchen/presentation/resources/color_manger.dart';
import 'package:kitchen/presentation/resources/strings_manger.dart';
import 'package:kitchen/presentation/resources/values_manger.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUsername(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_userNameController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapShot) {
          return snapShot.data?.getScreenWidget(
                  context, _getContentWidget(), _viewModel.login()) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
      color: ColorManger.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(child: Image.asset(ImageAssets.splashLogo)),
            SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outUserNameValid,
                builder: (context, snapShot) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: AppStrings.userName,
                      labelText: AppStrings.userName,
                      errorText: (snapShot.data ?? true)
                          ? null
                          : AppStrings.userNameError,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outPasswordValid,
                builder: (context, snapShot) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: AppStrings.password,
                      labelText: AppStrings.password,
                      errorText: (snapShot.data ?? true)
                          ? null
                          : AppStrings.passwordError,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputAllDataValid,
                builder: (context, snapShot) {
                  return ElevatedButton(
                      onPressed: (snapShot.data ?? false)
                          ? () {
                              _viewModel.login();
                            }
                          : null,
                      child: Text(AppStrings.login));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
