import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:flutter/material.dart';

class FeedImages extends StatefulWidget {
  final List<String> images;

  FeedImages({required this.images});

  @override
  State<StatefulWidget> createState() {
    return _FeedImages();
  }
}

class _FeedImages extends BaseState<FeedImages> {
  int _imageSize = 0;

  @override
  void initState() {
    super.initState();
    _imageSize = widget.images.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image(
                      image: AssetImage(ImagesResource.bg_profile_header)),
                )),
            SizedBox(width: _imageSize > 1 ? 3 : 0),
            Visibility(
              visible: _imageSize > 1,
              child: Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                        image: AssetImage(ImagesResource.bg_profile_header)),
                  )),
            )
          ],
        ),
        Visibility(
            visible: _imageSize > 2,
            child: SizedBox(
              height: 3,
            )),
        Visibility(
            visible: _imageSize > 2,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                          image: AssetImage(ImagesResource.bg_profile_header)),
                    )),
                SizedBox(width: _imageSize > 3 ? 3 : 0),
                Visibility(
                    visible: _imageSize > 3,
                    child: Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image(
                              image:
                                  AssetImage(ImagesResource.bg_profile_header)),
                        ))),
                SizedBox(width: widget.images.length > 4 ? 3 : 0),
                Visibility(
                    visible: widget.images.length > 4,
                    child: Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image(
                              image:
                                  AssetImage(ImagesResource.bg_profile_header)),
                        )))
              ],
            ))
      ],
    );
  }
}
