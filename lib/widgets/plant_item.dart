import 'package:flutter/material.dart';

import 'package:plant_store_app/constants/colors.dart';
import '../models/plant.dart';

class PlantItem extends StatefulWidget {
  Plant plant;

  PlantItem({super.key, required this.plant});

  @override
  State<PlantItem> createState() => _PlantItemState();
}

class _PlantItemState extends State<PlantItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
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
                        Text(widget.plant.title,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(widget.plant.plantType,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(
                          width: 50,
                          height: 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < widget.plant.rate; i++)
                                Icon(
                                  Icons.star,
                                  color: secondaryColor,
                                  size: 10,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "฿${widget.plant.price}",
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
                child: Image.asset(widget.plant.imgUrl),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 28,
              child: SizedBox(
                width: 24,
                height: 24,
                child: Container(
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite == true
                            ? Colors.red
                            : Colors.grey.shade300,
                        size: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
