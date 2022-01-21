
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/feed.dart';
import 'package:exercise_example/models/news.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/widgets/feed_item.dart';
import 'package:exercise_example/widgets/friends_online.dart';
import 'package:exercise_example/widgets/what_news_item.dart';
import 'package:flutter/material.dart';

class NewFeedPage extends StatefulWidget {
  final List<News> whatNews = <News>[];
  final List<User> friendsOnline = <User>[];
  final List<Feed> feeds = <Feed>[];

  @override
  State<StatefulWidget> createState() {
    whatNews.clear();
    friendsOnline.clear();
    feeds.clear();
    whatNews.add(News(ImagesResource.bg_profile_header, 'description', User.fake()));
    whatNews.add(News(ImagesResource.bg_payment_card, 'description', User.fake()));
    whatNews.add(News(ImagesResource.bg_profile_header, 'description', User.fake()));
    whatNews.add(News(ImagesResource.bg_payment_card, 'description', User.fake()));
    whatNews.add(News(ImagesResource.bg_profile_header, 'description', User.fake()));

    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());
    friendsOnline.add(User.fake());

    feeds.add(Feed.fake(1, 10, 5, 8, false));
    feeds.add(Feed.fake(2, 3, 5, 8, true));
    feeds.add(Feed.fake(3, 4, 2, 6, false));
    feeds.add(Feed.fake(4, 1, 5, 8, false));
    feeds.add(Feed.fake(5, 5, 7, 9, true));
    return _NewFeedPageState();
  }
}

class _NewFeedPageState extends BaseState<NewFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 16, left: 12, right: 12),
                  child: Row(
                    children: [
                      Text('What\'s new', style: TextStyle(color: Colors.black, fontFamily: Fonts.BalsamiqSans, fontSize: 28, fontWeight: FontWeight.w600)),
                      Text('Show all >', style: TextStyle(color: Colors.black, fontFamily: Fonts.BalsamiqSans, fontSize: 12, fontWeight: FontWeight.w300))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 155,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.whatNews.length,
                  itemBuilder: (context, index) => WhatNewItem(widget.whatNews[index], index == widget.whatNews.length - 1),
                )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 12, right: 12),
                  child: Row(
                    children: [
                      Text('30 Friends online', style: TextStyle(color: Colors.blueGrey, fontFamily: Fonts.BalsamiqSans, fontSize: 16, fontWeight: FontWeight.w400)),
                      Text('Show all >', style: TextStyle(color: Colors.black, fontFamily: Fonts.BalsamiqSans, fontSize: 12, fontWeight: FontWeight.w300))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.friendsOnline.length,
                  itemBuilder: (context, index) => FriendOnline(widget.friendsOnline[index], index == widget.friendsOnline.length - 1),
                )
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.feeds.length,
                itemBuilder: (context, index) => FeedItem(widget.feeds[index]),
              )
            ],
          )
        )
    );
  }
}