import 'package:flutter/material.dart';

import 'package:plant_store_app/constants/colors.dart';
import '../models/plant.dart';

class PlantItem extends StatelessWidget {
  Plant plant;

  PlantItem({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              width: 180,
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plant.title,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(plant.plantType,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          width: 50,
                          height: 18,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: ((context, index) {
                              return Icon(
                                Icons.star,
                                color: Colors.grey.shade300,
                                size: 10,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "฿${plant.price}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 1,
              child: Container(
                width: 178,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: mainThemeColor,
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: SizedBox(
                width: 188,
                height: 170,
                child: Image.asset(plant.imgUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
