import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';

import '../../../../../core/utils/exports.dart';

class SearchReviewWidget extends StatelessWidget {
  const SearchReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: Dimensions.height45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 0), blurRadius: 3, color: strokeColor)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search_sharp,
            size: Dimensions.iconSize20,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SizedBox(
              width: Dimensions.width225,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Search all reviews",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
