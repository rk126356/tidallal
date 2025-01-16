import 'package:flutter/material.dart';

import '../../../widgets/heading_widget.dart';
import '../../../widgets/stats_box_widget.dart';

class HomeStats extends StatelessWidget {
  const HomeStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeadingWidget(title: 'Overall statistics'),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: StatsBoxWidget(
                imagePath: 'assets/images/image1.png',
                text: 'Active contracts',
                value: '100',
                backgroundColor: Color(0xFFFFDB99),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: StatsBoxWidget(
                imagePath: 'assets/images/image2.png',
                text: 'Active projects',
                value: '50',
                backgroundColor: Color(0xFFC7DBF8),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: StatsBoxWidget(
                imagePath: 'assets/images/image3.png',
                text: 'Paid invoices',
                value: '30',
                backgroundColor: Color(0xFFD8FEAA),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: StatsBoxWidget(
                imagePath: 'assets/images/image4.png',
                text: 'Due invoices',
                value: '08',
                backgroundColor: Color(0xFFFFDDDD),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
