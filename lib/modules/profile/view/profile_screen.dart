import 'package:flutter/material.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/profile/view/widget/profile_body_section_widget.dart';
import 'package:restro_book/modules/profile/view/widget/profile_top_section_widget.dart';

import '../../../core/utils/exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppbar(
        centerTitle: true,
        title: 'Your profile',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _profilePictureWithTitleWidget(),
          _yourStatsWidget(),
        ],
      ),
    );
  }

  Widget _profilePictureWithTitleWidget() {
    return const ProfileTopSectionWidget();
  }

  Widget _yourStatsWidget() {
    return const ProfileBodySectionWidget();
  }
}
