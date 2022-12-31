import 'dart:async';
import 'dart:developer';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/search_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';

class SearchViewModel extends BaseViewModel
    with SearchViewModelInputs, SearchViewModelOutputs {
  final StreamController _searchResultStreamController =
      StreamController<Projects>.broadcast();

  final StreamController _searchInputStreamController =
      StreamController<String>.broadcast();

  final StreamController _pageInputStreamController =
      StreamController<int>.broadcast();

  final StreamController _lastPageStreamController =
      StreamController<int>.broadcast();

  final SearchUseCase _searchUseCase;

  SearchViewModel(this._searchUseCase);

  int _currentPage = 1;

  int _lastPage = 1;

  String _search = "";

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _searchResultStreamController.close();
    _searchInputStreamController.close();
    _pageInputStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputSearchResults => _searchResultStreamController.sink;

  @override
  Stream<Projects> get outputSearchResults =>
      _searchResultStreamController.stream.map((data) => data);

  @override
  Sink get inputSearchInput => _searchInputStreamController.sink;

  @override
  Stream<String> get outputSearchInput =>
      _searchInputStreamController.stream.map((data) => data);

  @override
  void goNextPage() {
    if (_currentPage < _lastPage) {
      _currentPage++;
      _searchProjects();
    }
  }

  @override
  Sink get inputPage => _pageInputStreamController.sink;

  @override
  Stream<int> get outputPage =>
      _pageInputStreamController.stream.map((data) => data);

  @override
  void setSearch(String search) {
    _search = search;
    log(search);
  }

  @override
  void handleSearch() {
    if (_search.isNotEmpty) {
      _searchProjects();
    }
  }

  void _searchProjects() async {
    (await _searchUseCase.execute(SearchUseCaseInput(_search, _currentPage)))
        .fold(
            (failure) => null,
            (projects) => {
                  inputState.add(ContentState()),
                  inputSearchResults.add(projects),
                  _lastPage = projects.last,
                  inputLastPage.add(projects.last),
                });
  }

  @override
  Sink get inputLastPage => _lastPageStreamController.sink;

  @override
  Stream<int> get outputLastPage =>
      _lastPageStreamController.stream.map((data) => data);
}

abstract class SearchViewModelInputs {
  Sink get inputSearchResults;

  Sink get inputSearchInput;

  Sink get inputPage;

  Sink get inputLastPage;

  void goNextPage();

  void setSearch(String search);

  // handle when search button is triggered
  void handleSearch();
}

abstract class SearchViewModelOutputs {
  Stream<Projects> get outputSearchResults;

  Stream<String> get outputSearchInput;

  Stream<int> get outputPage;

  Stream<int> get outputLastPage;
}

class SearchViewObject {
  Projects data;

  SearchViewObject(this.data);
}
