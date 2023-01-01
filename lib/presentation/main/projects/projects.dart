import 'package:flutter/material.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/app/extensions.dart';
import 'package:pips_flutter/data/mapper/mapper.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/project/project.dart';
import 'package:pips_flutter/presentation/main/projects/projects_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final ProjectsViewModel _viewModel = instance<ProjectsViewModel>();

  late ScrollController _scrollController;

  bool _loading = false;

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      //
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > nextPageTrigger &&
          _loading == false) {
        setState(() {
          _loading = true;
        });

        _viewModel.getNextPage();

        Future<void>.delayed(const Duration(seconds: 1)).then((_) => {
              setState(() {
                _loading = false;
              })
            });
      }
    });

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
        if (snapshot.data != null) {
          return Column(children: [
            const SizedBox(
              height: AppSize.s12,
            ),
            Expanded(child: _getListViewBuilder(snapshot.data?.data))
          ]);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _getListViewBuilder(List<Project> projects) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            projects[index].office?.acronym ?? emptyString,
            style: getMediumStyle(color: ColorManager.grey),
          ),
          title: Text(projects[index].title),
          subtitle: Text(projects[index].totalCost?.toMoney() ?? 0.toString()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigator.pushNamed(context, Routes.projectRoute, arguments: {
            //   "uuid": projects[index].uuid,
            // });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProjectView(
                      uuid: projects[index].uuid,
                      title: projects[index].title,
                    )));
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
