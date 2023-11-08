import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import '../../../../core/utils/exports.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: Dimensions.height45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
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
          SizedBox(
            width: Dimensions.width225,
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: "Search San Fransisco",
                  hintStyle:
                  TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              searchLocationImagePath,
              height: Dimensions.height30,
              width: Dimensions.width10 * 2,
            ),
          )
        ],
      ),
    );
  }
}
