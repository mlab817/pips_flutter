import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import '../resources/routes_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    final String name = _nameController.text;
    final String contactNumber = _contactNumberController.text;
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    // validate
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p28,
            right: AppPadding.p28,
            top: AppPadding.p28,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.s128,
                  height: AppSize.s128,
                ),
                Text(
                  'Create a New Account',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: _contactNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Contact No.',
                    labelText: 'Contact No.',
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                ElevatedButton(
                  onPressed: _register,
                  child: const Text('Register'),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.loginRoute,
                    );
                  },
                  child: Text(
                    'Go back to Login',
                    style: TextStyle(
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
