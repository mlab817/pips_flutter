import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/main/home/home_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/font_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import '../../../domain/model/model.dart';
import '../../resources/strings_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   child: StreamBuilder<FlowState>(
    //     stream: _viewModel.outputState,
    //     builder: (context, snapshot) {
    //       return snapshot.data?.getScreenWidget(context, _getContentWidgets(),
    //               () {
    //             _viewModel.start();
    //           }) ??
    //           Container();
    //     },
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        color: ColorManager.blueGrey,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: ColorManager.white,
            ),
            child: Column(
              children: [
                _getSection('Status of Submission'),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        Text(
                          'DRAFT',
                          style: TextStyle(
                            fontSize: FontSize.s10,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        Text(
                          'FINALIZED',
                          style: TextStyle(
                            fontSize: FontSize.s10,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        Text(
                          'ENDORSED',
                          style: TextStyle(
                            fontSize: FontSize.s10,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        Text(
                          'DROPPED',
                          style: TextStyle(
                            fontSize: FontSize.s10,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s12),
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: ColorManager.white,
            ),
            child: Column(
              children: [
                _getSection('Latest Projects'),
                SizedBox(
                  height: AppSize.s180,
                  child: ListView(
                    children: const <Widget>[
                      ListTile(
                        title: Text('Item 1'),
                        trailing: Text('PHP 1,000,000'),
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        trailing: Text('PHP 1,000,000'),
                      ),
                      ListTile(
                        title: Text('Item 3'),
                        trailing: Text('PHP 1,000,000'),
                      ),
                      ListTile(
                        title: Text('Item 4'),
                        trailing: Text('PHP 1,000,000'),
                      ),
                      ListTile(
                        title: Text('Item 5'),
                        trailing: Text('PHP 1,000,000'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // color: ColorManager.blueGrey,
    // padding: const EdgeInsets.all(AppPadding.p12),
    // child: Container(
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(AppSize.s20),
    // color: ColorManager.white,
    // ),
    // child: Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: Flex(
    // direction: Axis.horizontal,
    // children: [
    // Expanded(
    // child: Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    // children: [
    // Text(
    // 'Latest Projects',
    // style: getBoldStyle(
    // color: ColorManager.black,
    // fontSize: FontSize.s16,
    // ),
    // ),
    // const TextButton(
    // onPressed: null,
    // child: Text('See All'),
    // )
    // ],
    // ),
    // ),
    // ListView(
    // children: const <Widget>[
    // ListTile(
    // title: Text('First item'),
    // ),
    // ],
    // ),
    // ],
    // ),
    // ),
    // ),
  }

  Widget _getContentWidgets() {
    return StreamBuilder<Dashboard>(
        stream: _viewModel.outputDashboard,
        builder: (context, snapshot) {
          //
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getSection(AppStrings.statusOfSubmission),
              _getStatuses(snapshot.data?.pipsStatuses),
            ],
          );
        });
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Widget _getStatuses(List<PipsStatus>? pipsStatuses) {
    if (pipsStatuses != null) {
      double screenWidth = MediaQuery.of(context).size.width;

      return Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
        ),
        child: Container(
          height: AppSize.s80,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: pipsStatuses
                .map((status) => Card(
                      color: HexColor.fromColorName(status.color),
                      elevation: AppSize.s1_5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        side: BorderSide(
                          color: ColorManager.white,
                          width: AppSize.s1_5,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth - 24, // subtract padding
                            height: AppSize.s40,
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(AppSize.s12),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p8),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                status.name,
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('Statuses is null'),
      );
    }
  }

  Widget _getSlider(List<PipsStatus>? pipsStatuses) {
    if (pipsStatuses != null) {
      return CarouselSlider(
        items: pipsStatuses
            .map((status) => Card(
                  color: HexColor.fromColorName(status.color),
                  elevation: AppSize.s1_5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    side: BorderSide(
                      color: ColorManager.white,
                      width: AppSize.s1_5,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: AppSize.s100,
                        height: AppSize.s40,
                      ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(AppSize.s12),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            status.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: AppSize.s80,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return const Center(
        child: Text('Statuses is null'),
      );
    }
  }
}
