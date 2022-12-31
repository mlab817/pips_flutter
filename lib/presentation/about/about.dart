import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/font_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..repeat(reverse: true);
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        elevation: 0.0,
      ),
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s12),
            child: Image.asset(ImageAssets.splashLogo),
          ),
          const SizedBox(height: AppSize.s40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.appLongName,
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s14,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            'By ${AppStrings.appAuthor}',
            style: getSemiBoldStyle(
              color: ColorManager.grey,
            ),
          ),
          const SizedBox(height: AppSize.s40),
          const Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: SizedBox(
              height: AppSize.s200,
              child:
                  SingleChildScrollView(child: Text(AppStrings.appDescription)),
            ),
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          AlignTransition(
            alignment: _animation,
            heightFactor: 1.4,
            child: SizedBox(
              child: Icon(
                Icons.expand_more,
                size: AppSize.s36,
                color: ColorManager.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
