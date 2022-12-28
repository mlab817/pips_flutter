import 'package:flutter/material.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications_viewmodel.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/app/extensions.dart';
import 'package:pips_flutter/presentation/resources/styles_manager.dart';

import '../../../app/dependency_injection.dart';
import '../../resources/values_manager.dart';

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
    return StreamBuilder<NotificationObject>(
        stream: _viewModel.outputNotificationsObject,
        builder: (_, snapshot) => _buildListView(snapshot.data));
  }

  Widget _buildListView(NotificationObject? notificationObject) {
    if (notificationObject != null) {
      List<NotificationItem> notifications = notificationObject.notifications;

      return ListView.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          NotificationItem item = notifications[index];

          // if sender is more than 2 characters, trim to 2
          final sender = item.data.sender.length > 2
              ? item.data.sender.substring(0, 2).toUpperCase()
              : item.data.sender.toUpperCase();

          return Container(
            padding: const EdgeInsets.only(
              top: AppPadding.p8,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  sender,
                  style: getBoldStyle(
                    color: ColorManager.white,
                  ),
                ),
              ),
              title: Text(
                item.data.message,
                style: getLightStyle(
                  color: ColorManager.black,
                ),
              ),
              trailing: Text(
                item.createdAt.toString(),
                style: TextStyle(
                  fontSize: 8.0,
                  color: ColorManager.lightGrey,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
    } else {
      return Container();
    }
  }
}
