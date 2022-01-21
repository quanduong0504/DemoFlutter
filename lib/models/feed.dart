
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/resource/images.dart';

class Feed {
  User owner;
  List<String>? images;
  String createdAt;
  int like;
  int comment;
  int share;
  bool isLike;
  String content;

  Feed(this.owner, this.images, this.createdAt, this.like, this.comment,
      this.share, this.content, this.isLike);

  void updateLiked() {
    isLike ? --like : ++like;

    isLike = !isLike;
  }

  factory Feed.fake(int count, int like, int comment, int share, bool isLike) {
    final List<String> images = <String>[];

    for(int i = 0; i < count; i++) {
      images.add(ImagesResource.bg_payment_card);
    }

    return Feed(User.fake(), images, "12m ago", like, comment, share, 'Về hạ tầng, điểm sáng có ý nghĩa quan trọng nhất với TP Thủ Đức trong năm 2021 là việc hợp long cầu Thủ Thiêm 2, nối hai bờ sông giữa quận 1 và TP Thủ Đức. Công trình dự kiến được đưa vào sử dụng vào quý II/2022, giúp rút ngắn đáng kể thời gian đi từ TP Thủ Đức đến trung tâm TP.HCM.', isLike);
  }
}