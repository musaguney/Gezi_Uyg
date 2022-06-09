import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/services/places_service.dart';
import 'package:gezi_uygulamasi/widgets/places_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final PlaceService _placeService = PlaceService();
  List<Places> favoriteList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getFavoritePlaces();
  }

  Future<void> getFavoritePlaces() async {
    setState(() {
      isLoading = true;
    });
    for (var i = 0; i < _placeService.placeList.length; i++) {
      double avarage = await _placeService.getPlaceAveragePoint(_placeService.placeList[i].id!);
      Places places = _placeService.placeList[i];
      places.avarage = avarage;
      print(avarage);
      if (avarage >= 4) {
        favoriteList.add(places);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(favoriteList);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoriler"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoriteList.isNotEmpty
              ? SingleChildScrollView(
                  child: PlacesCard(list: favoriteList),
                )
              : const Center(child: Text("Favori Yerler Henüz Belirlenmedi")),
    );
  }
}
