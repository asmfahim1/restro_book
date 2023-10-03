import 'package:flutter/material.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleWidget(),
            _titleDescriptionWidget(),
            const SizedBoxHeight20(),
            Row(
              children: [
                SizedBox(
                  height: size.height / 12,
                  width: size.width / 3,
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 30,
                        color: greenColor,
                      ),
                      SizedBox(width: 10,),
                      TextWidget('(+852)', style: TextStyles.regular16,),
                      SizedBox(width: 2,),
                      Icon(Icons.arrow_drop_down, size: 30, color: strokeColor,)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: size.height / 12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(
                        color: strokeColor,
                        width: 1.2
                      )
                        ),
                    child: Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle:
                            TextStyles.regular16.copyWith(color: Colors.grey.shade600, fontSize: 17),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBoxHeight20(),
            TextWidget('You will receive a text message to verify your account. Message & data rates may apply.'),
            const SizedBoxHeight20(),
            Container(
              height: size.height / 12,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(6),
              ),
              child: TextWidget('Continue', style: TextStyles.title16.copyWith(color: darkGrayColor),),
            ),
            const SizedBoxHeight20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget('Use email instead', style: TextStyles.regular14.copyWith(color: primaryColor),),
              ],
            )

          ],
        ),
      ),
    );
  }

  Widget _titleWidget(){
    return TextWidget('Enter your phpone number', style: TextStyles.title20,);
  }

  Widget _titleDescriptionWidget(){
    return TextWidget('We\'ll need to verify it\'s you to continue', style: TextStyles.regular14,);
  }
}
