import 'package:flutter/material.dart';

import '../../../core/widgets/text_widget.dart';

class ExperiencesBarScreen extends StatelessWidget {
  const ExperiencesBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget('Experiences'),
      ),
    );
  }
}
