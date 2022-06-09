import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/screens/category_show_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriler'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            categoryCards("Parklar"),
            categoryCards("Kütüphaneler"),
            categoryCards("Tarihi Yerler"),
            categoryCards("Oteller"),
            categoryCards("Market / AVM"),
            categoryCards("İbadet Yerleri"),
            categoryCards("Otoparklar"),
          ],
        ),
      ),
    );
  }

  Widget categoryCards(String category) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryShowScreen(
                  category: category,
                )));
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
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
              ),
              child: Row(
                children: [
                  Text(category),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
