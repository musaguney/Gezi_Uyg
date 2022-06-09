import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/authentication/login_page.dart';
import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/services/places_service.dart';
import 'package:gezi_uygulamasi/widgets/places_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlaceService _placeService = PlaceService();

  List<Places> placeList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getPlaceAvarage();
  }

  Future<void> getPlaceAvarage() async {
    setState(() {
      isLoading = true;
    });
    for (var i = 0; i < _placeService.placeList.length; i++) {
      double avarage = await _placeService.getPlaceAveragePoint(_placeService.placeList[i].id!);
      Places places = _placeService.placeList[i];
      places.avarage = avarage;
      placeList.add(places);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gezi Uygulaması'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Çıkış Yap",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(child: PlacesCard(list: placeList)));
  }
}
