
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/notification.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/resource/strings.dart';
import 'package:flutter/material.dart';

class NoticeView extends StatefulWidget {
  final AppNotification _notice;

  NoticeView(this._notice);

  @override
  State<StatefulWidget> createState() {
    return _NoticeViewState();
  }
}

class _NoticeViewState extends BaseState<NoticeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('tap to ${widget._notice.fromUser.userName}'),
      child: Card(
          color: widget._notice.isRead ? Colors.white : Color.fromRGBO(182, 227, 255, 0.8),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.only(left: 12, top: 20, right: 12),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              child: Column(
                  children: [
                    Row(
                      children: [
                        Text('From', style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 16, fontWeight: FontWeight.w800)),
                        Image(image: AssetImage(ImagesResource.icon_options), width: 20, height: 20)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget._notice.description, style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 13, fontWeight: FontWeight.w600, color: Colors.blueGrey))
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(Strings.created_by, style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 11, fontWeight: FontWeight.w400, color: Colors.blueGrey))
                        )
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              child: ClipOval(
                                  child: Image(image: AssetImage(ImagesResource.bg_payment_card), fit: BoxFit.cover, width: 36, height: 36)
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(widget._notice.fromUser.userName, style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 16, fontWeight: FontWeight.w800))
                            ),
                          ],
                        ),
                        Text(widget._notice.createdAt, style: TextStyle(fontFamily: Fonts.BalsamiqSans, fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blueGrey))
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ]
              )
          )
      )
    );
  }
}