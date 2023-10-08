import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class SearchDetailsSliverAppBar extends StatelessWidget {
  const SearchDetailsSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> assets = [
      'assets/images/featured_1.JPG',
      'assets/images/featured_2.JPG',
      'assets/images/featured_3.JPG',
      'assets/images/featured_4.JPG'
    ];
    return SliverAppBar(
      snap: false,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: TextWidget('STK -San Fransisco', style: TextStyles.title16,), //Text
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
                ],
              );
            },
          ),
        ),
      ), //FlexibleSpaceBar
      expandedHeight: 300,
      backgroundColor: whiteColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_outlined, color: redColor,),
        tooltip: 'Menu',
        onPressed: () {},
      ), //IconButton
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: const Icon(Icons.bookmark_outline_outlined, color: redColor,),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
        ), //IconButton
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            icon: const Icon(Icons.share_outlined, color: redColor,),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ),
        ), //IconButton
      ],//<Widget>[]
    );
  }
}
