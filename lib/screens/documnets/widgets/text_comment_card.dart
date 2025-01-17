import 'package:flutter/material.dart';

import '../../../tools/utils/date_tools.dart';

class TextCommentCard extends StatelessWidget {
  final String date;
  final String text;
  final bool isAdmin;

  const TextCommentCard({
    super.key,
    required this.date,
    required this.text,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isAdmin ? 60 : 0, right: isAdmin ? 0 : 60),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFFE9E9E9)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formatDateComment(date),
                    style: const TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF808080),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
