

import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/notification.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/widgets/notice_view.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final List<AppNotification> items = <AppNotification>[];

  @override
  State<StatefulWidget> createState() {
    _fakeData();
    return _NotificationPageState();
  }

  void _fakeData() {
    items.clear();
    items.add(AppNotification(User.fake(), 'title', 'Description', 'now', false));
    items.add(AppNotification(User.fake(), 'title', 'Description', 'now', false));
    items.add(AppNotification(User.fake(), 'title', 'Description', 'Last 15 minute', false));
    items.add(AppNotification(User.fake(), 'title', 'Description', 'Last 56 minute', true));
    items.add(AppNotification(User.fake(), 'title', 'Description', 'Last 2 days ago', true));
  }
}

class _NotificationPageState extends BaseState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: MediaQuery.of(context).viewPadding.top + 12, bottom: 0),
                child: Row(
                  children: [
                    Text('Notifications', style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 26, fontWeight: FontWeight.w800)),
                    Icon(Icons.search, size: 30)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return NoticeView(widget.items[index]);
                  },
                  padding: EdgeInsets.only(bottom: 24)
              )
            ],
          )
        )
    );
  }
}