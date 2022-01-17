
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/profile_menu_item.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/resource/strings.dart';
import 'package:exercise_example/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileViewState();
  }
}

class _ProfileViewState extends BaseState<ProfileView> {
  final List<ProfileMenuItem> _menuItems = Strings.menuItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 6,
          margin: EdgeInsets.only(top: 50, left: 16, right: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.settings)),
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.edit))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ),
              Text('Quandq', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('Bio', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
              ),
              Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 0.36,
                  )
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 12),
                scrollDirection: Axis.vertical,
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  return ProfileItem(_menuItems[index]);
                },
              )
            ],
          )
        ),
        Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                      image: AssetImage(ImagesResource.bg_payment_card),
                      fit: BoxFit.fill
                  )
              ),
            )
        )
      ],
    );
  }
}