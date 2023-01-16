import 'dart:async';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecase/offices_usecase.dart';

class OfficesViewModel extends BaseViewModel
    with OfficesViewModelInputs, OfficesViewModelOutputs {
  final StreamController _streamController = BehaviorSubject<OfficesObject>();

  final OfficesUseCase _officesUseCase;

  OfficesViewModel(this._officesUseCase);

  int _currentPage = 1;

  final OfficesObject _officesObject =
  OfficesObject(<Office>[], 0, 1, 1, 10);

  void _getOffices() async {
    (await _officesUseCase.execute(OfficesUseCaseInput(_currentPage))).fold(
            (failure) =>
            inputState.add(ErrorState(
                StateRendererType.fullScreenErrorState, failure.message)),
            (data) =>
        {
          inputState.add(ContentState()),
          _updateDataWithResponse(data)
        });
  }

  @override
  void start() {
    _getOffices();
  }

  @override
  void dispose() {
    super.dispose();

    _streamController.close();
  }

  @override
  Sink get inputOffices => _streamController.sink;

  @override
  Stream get outputOffices => _streamController.stream.map((data) => data);

  @override
  void getNextPage() {
    _currentPage++;
  }

  _updateDataWithResponse(Offices data) {
    // manipulate the data
    _officesObject.data = data.data;
    _officesObject.pageSize = data.pageSize;
    _officesObject.last = data.last;
    _officesObject.current = data.current;
    _officesObject.total = data.total;

    inputOffices.add(_officesObject);
  }
}

abstract class OfficesViewModelInputs {
  void getNextPage();

  Sink get inputOffices;
}

abstract class OfficesViewModelOutputs {
  //
  Stream get outputOffices;
}

class OfficesObject {
  List<Office> data;

  int total;

  int current;

  int last;

  int pageSize;

  OfficesObject(this.data,
      this.total,
      this.current,
      this.last,
      this.pageSize,);
}
