import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/notification_model.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';

import 'components/notification_detail_body.dart';

class NotificationDetailScreen extends StatelessWidget {
  static const routeName = "/notification_detail_screen";
  NotificationModel _notificationModel;
  NotificationDetailScreen(this._notificationModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationBody(_notificationModel),
    );
  }
}
