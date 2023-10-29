import 'package:flutter/material.dart';
import '../../../../core/utils/exports.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height / 15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(offset: Offset(0, 0), blurRadius: 4, color: strokeColor)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search_sharp,
            size: 20,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: "Search Dhanmondi",
                  hintStyle:
                  TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              searchLocationImagePath,
              height: size.height / 26,
              width: size.width / 16,
            ),
          )
        ],
      ),
    );
  }
}
