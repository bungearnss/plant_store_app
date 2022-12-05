import 'package:flutter/material.dart';

import '../../constants/colors.dart';

PreferredSize? detailAppBar(
    void Function()? isFavorite, void Function()? isBack) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
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
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.grey.shade300,
                size: 13,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
