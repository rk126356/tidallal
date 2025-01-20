import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/projects/active_projects_screen.dart';
import 'package:flutter_application_1/tools/utils/const_tools.dart';

import '../../../widgets/heading_widget.dart';
import '../../../widgets/stats_box_widget.dart';

class ClientHomeStats extends StatelessWidget {
  const ClientHomeStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingWidget(title: 'Overall statistics'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: StatsBoxWidget(
                imagePath: 'assets/images/image1.png',
                text: 'Active contracts',
                value: '100',
                backgroundColor: Color(0xFFFFDB99),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () {
                  push(context, const ActiveProjectsScreen());
                },
                child: const StatsBoxWidget(
                  imagePath: 'assets/images/image2.png',
                  text: 'Active projects',
                  value: '50',
                  backgroundColor: Color(0xFFC7DBF8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
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
