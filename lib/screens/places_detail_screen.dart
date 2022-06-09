import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/models/comment.dart';
import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/models/user.dart';
import 'package:gezi_uygulamasi/services/places_service.dart';
import 'package:gezi_uygulamasi/services/user_service.dart';
import 'package:gezi_uygulamasi/services/comment_service.dart';

class PlacesDetailScreen extends StatefulWidget {
  final Places places;
  final Future Function(int value)? onChangeAvarage;
  const PlacesDetailScreen({Key? key, required this.places, this.onChangeAvarage}) : super(key: key);

  @override
  State<PlacesDetailScreen> createState() => _PlacesDetailScreenState();
}

class _PlacesDetailScreenState extends State<PlacesDetailScreen> {
  final UserService _userService = UserService.instance;
  final CommentService _commentService = CommentService();
  final PlaceService _placeService = PlaceService();
  TextEditingController controllerComment = TextEditingController();

  int point = 0;
  bool isComment = false;

  List<Comment> commentList = [];

  @override
  void initState() {
    super.initState();
    getComments();
  }

  Future<void> makeComment() async {
    if (controllerComment.text != "") {
      Comment newComment = Comment(
        placeId: widget.places.id,
        point: point,
        comment: controllerComment.text,
        userId: _userService.currentUser!.id,
        userDetail: _userService.currentUser!,
      );
      final response = await _commentService.setComment(newComment);
      if (response != null) {
        widget.places.avarage = await _placeService.getPlaceAveragePoint(widget.places.id!);
        widget.onChangeAvarage!(1);
        setState(() {
          isComment = true;
          commentList.add(newComment);
        });
      }
    } else {
      const snackBar = SnackBar(content: Text("Lütfen Yorumunuzu Yazınız"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void setPoint(pointValue) {
    setState(() {
      point = pointValue;
    });
  }

  Future<void> getComments() async {
    List respose = await _commentService.getPlacesComment(widget.places.id!);

    print(respose);
    commentList.clear();
    if (respose.isNotEmpty) {
      for (var element in respose) {
        if (element["userId"] == _userService.currentUser?.id) {
          isComment = true;
        }
        User elementUser = await _userService.getUserById(element["userId"]);
        Comment comment = Comment(
          id: element["id"],
          placeId: element["placeId"],
          userId: element["userId"],
          point: element["point"],
          comment: element["comment"],
          userDetail: elementUser,
        );
        commentList.add(comment);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.places.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  widget.places.image ?? "",
                  fit: BoxFit.cover,
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      _placesInfo(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _placesDescription(),
                  const SizedBox(height: 20),
                  _placesPrice(),
                  const Text(
                    "Yorumlar",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  _placeMakeComment(),
                  const SizedBox(height: 20),
                  _placeComments(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _placesInfo() {
    return Row(
      children: [
        //KATEGORİ
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kategori",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              widget.places.category ?? "",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Spacer(),
        //ÇALIŞMA SAATLERİ
        Column(
          children: [
            const Text(
              "Çalışma Saatleri",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.places.openHours ?? "-",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        //PUAN
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Puan",
              style: TextStyle(fontSize: 12),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
                Text(
                  widget.places.avarage! == 0 ? "-" : widget.places.avarage!.toStringAsFixed(1).toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Text _placesDescription() {
    return Text(
      widget.places.info ?? "",
      style: const TextStyle(fontSize: 18),
    );
  }

  Widget _placesPrice() {
    if (widget.places.price != null) {
      return Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              const Text(
                "Ücret",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                widget.places.price ?? "-",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }

  Widget _placeMakeComment() {
    if (!isComment) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setPoint(1);
                  },
                  icon: Icon(
                    Icons.star,
                    color: point >= 1 ? Colors.yellow.shade700 : Colors.black54,
                  )),
              IconButton(
                  onPressed: () {
                    setPoint(2);
                  },
                  icon: Icon(
                    Icons.star,
                    color: point >= 2 ? Colors.yellow.shade700 : Colors.black54,
                  )),
              IconButton(
                  onPressed: () {
                    setPoint(3);
                  },
                  icon: Icon(
                    Icons.star,
                    color: point >= 3 ? Colors.yellow.shade700 : Colors.black54,
                  )),
              IconButton(
                  onPressed: () {
                    setPoint(4);
                  },
                  icon: Icon(
                    Icons.star,
                    color: point >= 4 ? Colors.yellow.shade700 : Colors.black54,
                  )),
              IconButton(
                  onPressed: () {
                    setPoint(5);
                  },
                  icon: Icon(
                    Icons.star,
                    color: point >= 5 ? Colors.yellow.shade700 : Colors.black54,
                  )),
            ],
          ),
          TextField(
            controller: controllerComment,
            maxLines: 2,
            decoration: const InputDecoration(label: Text("Yorum Yap")),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                await makeComment();
              },
              child: const Text("Yorum Yap")),
        ],
      );
    }

    return Container();
  }

  Widget _placeComments() {
    return ListView.builder(
      itemCount: commentList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          commentList[index].userDetail?.nameSurname ?? "",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        Text(
                          commentList[index].userDetail?.userName ?? "",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black87),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        Text(
                          commentList[index].point == 0 ? "-" : commentList[index].point.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [Text(commentList[index].comment ?? "")],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
