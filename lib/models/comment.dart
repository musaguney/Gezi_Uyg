import 'package:gezi_uygulamasi/models/user.dart';

class Comment {
  int? id;
  int? placeId;
  int? userId;
  int? point;
  String? comment;
  User? userDetail;

  Comment({
    this.id,
    this.placeId,
    this.userId,
    this.point,
    this.comment,
    this.userDetail,
  });

  commentMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['placeId'] = placeId;
    mapping['point'] = point;
    mapping['userId'] = userId;
    mapping['comment'] = comment;
    return mapping;
  }

  @override
  String toString() {
    return 'Comment(id: $id, placeId: $placeId, point: $point, userId: $userId, comment: $comment, userDetail:$userDetail)';
  }
}
