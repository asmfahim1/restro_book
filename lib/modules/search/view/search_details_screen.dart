import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/asset_path.dart';
import 'package:restro_book/core/utils/colors.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class SearchScreenDetails extends StatelessWidget {
  const SearchScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            stretch: true,
            leading: Icon(Icons.arrow_back_outlined, color: primaryColor,),
            actions: const [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.bookmark_outline_outlined, color: primaryColor,),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.share, color: primaryColor),),
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(loginBackgroundImage, fit: BoxFit.cover,),
              title: TextWidget('STK - San Fransisco', style: TextStyles.title16.copyWith(color: blackColor),),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Text('Text$index');
              },
            ),
          ),
        ],
      ),
    );
  }
}
