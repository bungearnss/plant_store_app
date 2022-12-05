import 'package:flutter/material.dart';
import 'package:plant_store_app/constants/colors.dart';

class Button extends StatelessWidget {
  String title;
  IconData? icon;
  Button({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .72,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: accentColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(width: icon == null ? 0 : 15),
          icon == null
              ? Container()
              : Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
        ],
      ),
    );
  }
}
