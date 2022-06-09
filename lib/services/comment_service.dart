import 'package:gezi_uygulamasi/models/comment.dart';

import '../repositories/repostory.dart';

class CommentService {
  Repository? _repository;
  CommentService() {
    _repository = Repository();
  }

  setComment(Comment comment) async {
    return await _repository?.insertData('comments', comment.commentMap());
  }

  getPlacesComment(int placeId) async {
    return await _repository?.readDataByProperty('comments', "placeId", placeId);
  }

}
