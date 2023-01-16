import 'package:flutter/material.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/offices/offices_viewmodel.dart';

class OfficesView extends StatefulWidget {
  const OfficesView({Key? key}) : super(key: key);

  @override
  State<OfficesView> createState() => _OfficesViewState();
}

class _OfficesViewState extends State<OfficesView> {
  final OfficesViewModel _viewModel = instance<OfficesViewModel>();

  @override
  void initState() {
    super.initState();

    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  const Center();
            },
          ),
        ),
      ],
    );
  }

  Widget _getContentWidget() {
    return Text('center');
  }
}
