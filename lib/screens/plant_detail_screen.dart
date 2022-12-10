import 'package:flutter/material.dart';
import 'package:plant_store_app/constants/colors.dart';

import '../models/plant.dart';
import '../widgets/reviewer_item.dart';
import '../widgets/button.dart';

class PlantDetailScreen extends StatefulWidget {
  Plant plantItem;
  PlantDetailScreen({super.key, required this.plantItem});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  bool isFav = false;
  int itemCount = 1;

  void _isBack() {
    Navigator.pop(context);
  }

  void _isFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  void _countItem(String type) {
    if (type == "add") {
      setState(() {
        itemCount = itemCount + 1;
      });
    } else if (type == "delete") {
      setState(() {
        itemCount = itemCount - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        appBar: detailAppBar(_isFav, _isBack),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  widget.plantItem.imgUrl,
                  width: width * .75,
                ),
              ),
            ),
            Positioned(
              top: height * .35,
              left: width * .1,
              child: Container(
                width: width * .8,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.white.withOpacity(.85),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      detailIcon(Icons.wb_sunny_outlined,
                          widget.plantItem.light.toString()),
                      detailIcon(Icons.water_drop_outlined,
                          widget.plantItem.light.toString()),
                      detailIcon(Icons.thermostat_auto_outlined,
                          widget.plantItem.light.toString()),
                      detailIcon(Icons.water_rounded,
                          widget.plantItem.water.toString())
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * .53,
                width: width,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 2,
                      offset: const Offset(2, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plantItem.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.plantItem.plantType,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.plantItem.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              "Select Size:",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            const SizedBox(width: 10),
                            selectSizeWidget(),
                            const SizedBox(width: 20),
                            const Text(
                              "Colours:",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 59,
                              height: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  selectColorWidget(greenColor),
                                  selectColorWidget(purpleColor),
                                  selectColorWidget(pinkColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: width,
                          height: 30,
                          child: Row(
                            children: [
                              const ReviewerItem(),
                              const Text(
                                "Ratings & Reviews",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.arrow_right_alt,
                                  color: accentColor, size: 18)
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () => _countItem("add"),
                                    child: const Text(
                                      "+",
                                    ),
                                  ),
                                  Text(
                                    "$itemCount",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _countItem("delete"),
                                    child: const Text("-"),
                                  ),
                                ],
                              ),
                            ),
                            Button(
                              title: "BUY NOW",
                              icon: Icons.arrow_right_alt_rounded,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 2,
                      child: Text(
                        "฿${widget.plantItem.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: accentColor, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailIcon(IconData? icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: accentColor.withOpacity(.5),
          size: 20,
        ),
        const SizedBox(width: 4),
        Text("$value%")
      ],
    );
  }

  Widget selectSizeWidget() {
    return Container(
      width: 100,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: txtColor.withOpacity(.3),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("S", style: TextStyle(fontSize: 14)),
          Text("l", style: TextStyle(color: txtColor.withOpacity(.3))),
          const Text("M", style: TextStyle(fontSize: 14)),
          Text("l", style: TextStyle(color: txtColor.withOpacity(.3))),
          const Text("L", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget selectColorWidget(Color color) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: color,
      ),
    );
  }

  PreferredSize? detailAppBar(
      void Function()? isFavorite, void Function()? isBack) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: backColor,
              size: 20,
            ),
            onPressed: isBack,
          ),
          actions: [
            GestureDetector(
              onTap: isFavorite,
              child: Stack(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(top: 12, right: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: isFav == true ? Colors.red : Colors.grey.shade300,
                      size: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
