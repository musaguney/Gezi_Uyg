import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/services/places_service.dart';
import 'package:gezi_uygulamasi/widgets/places_card.dart';

class CategoryShowScreen extends StatefulWidget {
  final String? category;
  const CategoryShowScreen({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryShowScreen> createState() => _CategoryShowScreenState();
}

class _CategoryShowScreenState extends State<CategoryShowScreen> {
  final PlaceService _placeService = PlaceService();

  List<Places> filterPlaceList = [];
  List<Places> favoriteList = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    filterPlaces();
  }

  void filterPlaces() async {
    setState(() {
      isLoading = true;
    });
    for (var i = 0; i < _placeService.placeList.length; i++) {
      if (_placeService.placeList[i].category == widget.category) {
        double avarage = await _placeService.getPlaceAveragePoint(_placeService.placeList[i].id!);
        Places places = _placeService.placeList[i];
        places.avarage = avarage;
        if (avarage >= 4) {
          favoriteList.add(places);
        } else {
          filterPlaceList.add(places);
        }
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? "Gezi Uygulaması"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  favoriteList.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                'Favoriler',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                            PlacesCard(list: favoriteList),
                            const Divider(),
                          ],
                        )
                      : Container(),
                  filterPlaceList.isNotEmpty
                      ? Column(
                          children: [
                            favoriteList.isNotEmpty
                                ? Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: const Text(
                                      'İlgili Yerler',
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                                    ),
                                  )
                                : Container(),
                            PlacesCard(list: filterPlaceList),
                          ],
                        )
                      : Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
                          child: const Center(
                            child: Text("Henüz Yer Eklenmedi"),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
