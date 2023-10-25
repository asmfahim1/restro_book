import 'package:flutter/material.dart';

import '../../../core/widgets/text_widget.dart';

class TakeoutBarScreen extends StatelessWidget {
  const TakeoutBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Reservation screen build');
    return Scaffold(
      body: Center(
        child: TextWidget('Coming soon...'),
      ),
    );
  }
}
