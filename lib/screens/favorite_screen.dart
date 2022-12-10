import 'package:flutter/material.dart';

import '../constants/data.dart';

import '../widgets/plant_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Your favorite products",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: height * 1.15,
                padding: const EdgeInsets.only(left: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 0.65,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: plantData.length,
                  itemBuilder: (context, index) {
                    final plantItem = plantData[index];
                    return PlantItem(
                      plant: plantItem,
                      isFavScreen: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
