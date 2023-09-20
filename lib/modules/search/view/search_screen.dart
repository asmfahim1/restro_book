import 'package:flutter/material.dart';
import 'package:restro_book/modules/search/view/widgets/search_screen_appbar_widget.dart';

import '../../../core/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const SearchScreenAppBarWidget(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          decoration: BoxDecoration(color: Colors.white, boxShadow: const [
            BoxShadow(offset: Offset(0, 0), blurRadius: 5, color: strokeColor)
          ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_sharp,
                size: 20,
                color: Colors.grey.shade600,
              ),
              SizedBox(
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
            ],
          ),
        )
      ],
    );
  }
}
