import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/projects/projects_viewmodel.dart';

import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import '../../../data/mapper/mapper.dart';
import '../../../domain/model/model.dart';
import '../../resources/strings_manager.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final ProjectsViewModel _viewModel = instance<ProjectsViewModel>();

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
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _viewModel.start();
            }) ??
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                  const SizedBox(height: AppSize.s8),
                  Text(
                    AppStrings.loading,
                    style: TextStyle(color: ColorManager.primary),
                  ),
                ],
              ),
            );
      },
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<dynamic>(
      stream: _viewModel.outputProjects,
      builder: (context, snapshot) {
        return Column(children: [
          const SizedBox(
            height: AppSize.s12,
          ),
          Expanded(child: _getListViewBuilder(snapshot.data?.projects))
        ]);
      },
    );
  }

  Widget _getListViewBuilder(Projects projects) {
    List<Project> items = projects.data;

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            items[index].office?.acronym ?? EMPTY,
            style: getMediumStyle(color: ColorManager.grey),
          ),
          title: Text(items[index].title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print("tapped");
          },
          onLongPress: () {
            print("long pressed");
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
