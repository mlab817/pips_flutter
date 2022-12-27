import 'package:flutter/material.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications_viewmodel.dart';

import '../../../app/dependency_injection.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationsViewModel _viewModel = instance<NotificationsViewModel>();

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
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(),
                  () {
                _viewModel.start();
              }) ??
              Container();
        });
  }

  Widget _getContentWidgets() {
    return StreamBuilder<List<NotificationItem>>(
        stream: _viewModel.outputNotifications,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView(
              children: snapshot.data
                  ?.map((notification) => ListTile(
                        title: Text(notification.data?.message),
                      ))
                  .toList(),
            );
          } else {
            return Container();
          }
        });
  }
}
