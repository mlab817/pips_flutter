import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/login/login_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';

import '../common/state_renderer/state_renderer_implementation.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final LoginViewModel _viewModel =
      instance<LoginViewModel>(); // pass in use case later

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // bind the view to the viewModel
  _bind() {
    _viewModel.start();
    _usernameController
        .addListener(() => _viewModel.setUsername(_usernameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessfullyLoggedIn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset(
                ImageAssets.onBoardingLogo1,
                width: AppSize.s128,
                height: AppSize.s128,
              ),
              const SizedBox(
                height: AppSize.s60,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: StreamBuilder(
                  stream: _viewModel.outputIsUsernameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.usernameLabelText,
                        labelText: AppStrings.usernameLabelText,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.usernameErrorText,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: StreamBuilder(
                  stream: _viewModel.outputIsPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: AppStrings.passwordLabelText,
                        labelText: AppStrings.passwordLabelText,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordErrorText,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          // style: Theme.of(context).elevatedButtonTheme,
                          child: const Text(
                            AppStrings.loginButtonText,
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.forgotPasswordRoute);
                      },
                      child: Text(AppStrings.forgotPasswordLabelText,
                          style: Theme.of(context).textTheme.subtitle2),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: Text(AppStrings.registerLabelText,
                          style: Theme.of(context).textTheme.subtitle2),
                    )
                  ],
                ),
              ),
            ],
          ),
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
