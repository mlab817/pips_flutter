import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/search/search_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import 'package:pips_flutter/app/dependency_injection.dart';

import '../project/project.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchViewModel _viewModel = instance<SearchViewModel>();

  final TextEditingController _searchInput = TextEditingController();

  void _bind() {
    _viewModel.start();
    _searchInput.addListener(() => _viewModel.setSearch(_searchInput.text));
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: TextFormField(
              controller: _searchInput,
              onFieldSubmitted: (val) {
                if (val.isNotEmpty) {
                  _viewModel.handleSearch();
                }
              },
              decoration: InputDecoration(
                labelText: AppStrings.searchLabelText,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ColorManager.primary,
                  ),
                  onPressed: () {
                    _viewModel.handleSearch();
                  },
                ),
                suffixIconColor: ColorManager.primary,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getSearchResultsList(), () {
                    _viewModel.start();
                  }) ??
                  Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _getSearchResultsList() {
    return StreamBuilder<Projects>(
        stream: _viewModel.outputSearchResults,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return _buildList(snapshot.data?.data);
          } else {
            return Container();
          }
        });
  }

  Widget _buildList(List<Project>? projects) {
    if (projects != null) {
      return projects.isNotEmpty
          ? Column(
              children: [
                SizedBox(
                  height: AppSize.s200,
                  child: ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return ListTile(
                        title: Text(project.title),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProjectView(
                                uuid: project.uuid,
                                title: project.title,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: SizedBox(
                    width: double.infinity,
                    height: AppSize.s40,
                    child: ElevatedButton(
                      onPressed: () {
                        _viewModel.loadMore();
                      },
                      child: const Text('Load More'),
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Lottie.asset(JsonAssets.noResult),
            );
    } else {
      return Center(
        child: Lottie.asset(JsonAssets.noResult),
      );
    }
  }
}
