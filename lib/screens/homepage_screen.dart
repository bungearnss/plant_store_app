import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/plant_item.dart';
import '../constants/data.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final double _iamgeSize = 250;
  final double _pickHight = 450;
  final List<String> _menuList = ["All", "Indoor", "Outdoor", "Garden"];
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: _pickHight,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryColor, secondaryColor],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Discover\nthe joy of garden.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.search,
                                  color: Colors.white, size: 25),
                              const SizedBox(width: 20),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(.3)),
                                child: const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 40,
                      child: Text(
                        "Top\nPicks",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: -25,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: _iamgeSize,
                        width: _iamgeSize,
                        child: Image.asset("assets/images/plant_header.png"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _menuList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMenu = index;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              _menuList[index],
                              style: TextStyle(
                                color: _selectedMenu == index
                                    ? secondaryColor
                                    : Colors.white,
                                fontSize: _selectedMenu == index ? 18 : 16,
                                fontWeight: _selectedMenu == index
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
                    return PlantItem(
                      plant: plantData[index],
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
