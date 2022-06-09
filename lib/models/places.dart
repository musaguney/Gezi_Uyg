import 'package:gezi_uygulamasi/models/comment.dart';

class Places {
  int? id;
  String? title;
  String? subTitle;
  String? category;
  String? info;
  String? openHours;
  String? image;
  String? price;
  double? avarage;
  List<Comment>? comments;

  Places({
    this.id,
    this.title,
    this.subTitle,
    this.category,
    this.info,
    this.openHours,
    this.image,
    this.price,
    this.avarage,
  });

  placeMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['subTitle'] = subTitle;
    mapping['category'] = category;
    mapping['info'] = info;
    mapping['openHours'] = openHours;
    mapping['image'] = image;
    mapping['price'] = price;
    return mapping;
  }

  @override
  String toString() {
    return 'Places(id: $id, title: $title, subTitle: $subTitle, category: $category, info: $info, openHours: $openHours, image: $image, price: $price,avarage:$avarage)';
  }
}
