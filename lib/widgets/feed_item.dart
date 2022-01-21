import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/feed.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/resource/strings.dart';
import 'package:exercise_example/widgets/feed_images.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  final Feed _feed;

  FeedItem(this._feed);

  @override
  State<StatefulWidget> createState() {
    return FeedItemState();
  }
}

class FeedItemState extends BaseState<FeedItem> {
  final GlobalKey _optionKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget._feed.owner.avatar ?? ''),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget._feed.owner.userName,
                                style: TextStyle(
                                    fontFamily: Fonts.BalsamiqSans,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 5),
                            Text('Last 10m ago',
                                style: TextStyle(
                                    fontFamily: Fonts.BalsamiqSans,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey))
                          ],
                        ))),
                GestureDetector(
                  key: _optionKey,
                  child: Image(
                      image: AssetImage(ImagesResource.icon_options),
                      width: 24,
                      height: 24),
                  onTap: () => showPopupMenu([
                    // PopupMenuButton(itemBuilder: itemBuilder)
                  ], _optionKey, (result) {
                    
                  }),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget._feed.content,
                    style: TextStyle(
                        fontFamily: Fonts.Merienda,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)))),
        FeedImages(images: widget._feed.images ?? List.empty()),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                        image: AssetImage(ImagesResource.ic_like),
                        width: 16,
                        height: 16),
                    SizedBox(width: 6),
                    Text(widget._feed.like.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: Fonts.BalsamiqSans)),
                  ],
                ),
                Row(
                  children: [
                    Text(widget._feed.comment.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: Fonts.BalsamiqSans)),
                    SizedBox(width: 4),
                    Text(Strings.comment,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            fontFamily: Fonts.BalsamiqSans))
                  ],
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: 8),
            child: Divider(
              height: 1,
              thickness: 0.3,
              color: Colors.black,
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                            image: AssetImage(ImagesResource.ic_like),
                            width: 16,
                            height: 16,
                            color: widget._feed.isLike
                                ? Colors.blue
                                : Colors.black),
                        SizedBox(width: 6),
                        Text(Strings.like,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: Fonts.BalsamiqSans,
                                color: widget._feed.isLike
                                    ? Colors.blue
                                    : Colors.black)),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                  ),
                  onTap: () {
                    setState(() {
                      widget._feed.updateLiked();
                    });
                  },
                ),
                GestureDetector(
                    child: Container(
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage(ImagesResource.ic_comment),
                                width: 18,
                                height: 18),
                            SizedBox(width: 6),
                            Text(Strings.comment,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: Fonts.BalsamiqSans)),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 14))),
                GestureDetector(
                    child: Container(
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage(ImagesResource.ic_share),
                                width: 16,
                                height: 16),
                            SizedBox(width: 6),
                            Text(Strings.share,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: Fonts.BalsamiqSans)),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 14)))
              ],
            )),
        Padding(
            padding: EdgeInsets.only(top: 4),
            child: Divider(
              height: 1,
              color: Colors.grey,
              thickness: 3,
            ))
      ],
    );
  }
}
