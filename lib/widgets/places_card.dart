import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/screens/places_detail_screen.dart';
import 'package:gezi_uygulamasi/services/places_service.dart';

class PlacesCard extends StatefulWidget {
  const PlacesCard({Key? key, required this.list}) : super(key: key);

  final List<Places> list;

  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  final PlaceService _placeService = PlaceService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlacesDetailScreen(
                      places: widget.list[index],
                      onChangeAvarage: (int value) async {
                        widget.list[index].avarage = await _placeService.getPlaceAveragePoint(widget.list[index].id!);
                        WidgetsBinding.instance!.addPostFrameCallback((value) {
                          setState(() {});
                        });
                      },
                    )));
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                ],
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.network(
                      widget.list[index].image ?? "",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      widget.list[index].title ?? "",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        Text(
                          widget.list[index].avarage == 0 ? "-" : widget.list[index].avarage!.toStringAsFixed(1).toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.list[index].info ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.list[index].category ?? "",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
