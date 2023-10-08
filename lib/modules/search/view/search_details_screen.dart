import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class SearchScreenDetails extends StatefulWidget {
  const SearchScreenDetails({Key? key}) : super(key: key);

  @override
  State<SearchScreenDetails> createState() => _SearchScreenDetailsState();
}

class _SearchScreenDetailsState extends State<SearchScreenDetails> {
  List<String> assets = [
    'assets/images/featured_1.JPG',
    'assets/images/featured_2.JPG',
    'assets/images/featured_3.JPG',
    'assets/images/featured_4.JPG'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                title: TextWidget('Flexible Spacebar', style: TextStyles.title22,), //Text
                background: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    itemCount: assets.length,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    controller:
                    PageController(initialPage: 3),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Stack(
                            children: [
                                Image.asset(
                                assets[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: size.width / 3,
                                right: size.width / 3,
                                bottom: 20,
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black54
                                  ),
                                  child: TextWidget('See all 405 photos', style: TextStyles.regular12.copyWith(color: whiteColor),),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            left: 10,
                              bottom: 10,
                              child: Container(
                                height: 100,
                                width: size.width,
                                color: Colors.red,
                              ),
                          )
                        ],
                      );
                    },
                  ),
                ),
            ), //FlexibleSpaceBar
            expandedHeight: 450,
            backgroundColor: whiteColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              tooltip: 'Menu',
              onPressed: () {},
            ), //IconButton
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  icon: const Icon(Icons.bookmark_outline_outlined),
                  tooltip: 'Comment Icon',
                  onPressed: () {},
                ),
              ), //IconButton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  icon: const Icon(Icons.share_outlined),
                  tooltip: 'Setting Icon',
                  onPressed: () {},
                ),
              ), //IconButton
            ],//<Widget>[]
          ), //SliverAppBar
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                title: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          color: Colors.greenAccent[400]) //TextStyle
                  ), //Text
                ), //Center
              ), //ListTile
              childCount: 51,
            ), //SliverChildBuildDelegate
          ) //SliverList
        ], //<Widget>[]
      )
    );
  }
}
