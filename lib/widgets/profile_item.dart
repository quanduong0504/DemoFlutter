
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/profile_menu_item.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  final ProfileMenuItem menuItem;

  ProfileItem(this.menuItem);

  @override
  State<StatefulWidget> createState() {
    return _ProfileItemState();
  }
}

class _ProfileItemState extends BaseState<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.menuItem.title);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          Image(image: AssetImage(widget.menuItem.image), width: 18, height: 18, color: Colors.black87),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(widget.menuItem.title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Colors.black87))
              )
          ),
          Image(image: AssetImage(ImagesResource.ic_navigate_next), width: 14, height: 18, color: Colors.black87)
        ],
      )
    );
  }
}