import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/notification_model.dart';
import 'package:flutter_application_1/screens/notifications/widgets/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> _notifications = notifications;

  List<NotificationModel> _getTodayNotifications() {
    final now = DateTime.now();
    return _notifications.where((notification) {
      return DateUtils.isSameDay(notification.date, now);
    }).toList();
  }

  List<NotificationModel> _getYesterdayNotifications() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return _notifications.where((notification) {
      return DateUtils.isSameDay(notification.date, yesterday);
    }).toList();
  }

  List<NotificationModel> _getAllNotifications() {
    return _notifications.where((notification) {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      return notification.date.isBefore(yesterday);
    }).toList();
  }

  Widget _buildNotificationList(
      String title, List<NotificationModel> notifications) {
    if (notifications.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Animate(
              effects: [
                FadeEffect(delay: 100.ms * index, duration: 300.ms),
                SlideEffect(
                  delay: 100.ms * index,
                  duration: 300.ms,
                  begin: const Offset(0.1, 0),
                  end: const Offset(0, 0),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: NotificationCard(
                  notification: notification,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final todayNotifications = _getTodayNotifications();
    final yesterdayNotifications = _getYesterdayNotifications();
    final allNotifications = _getAllNotifications();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificationList('Today', todayNotifications),
              const SizedBox(height: 10),
              _buildNotificationList('Yesterday', yesterdayNotifications),
              const SizedBox(height: 10),
              _buildNotificationList('Older', allNotifications),
            ],
          ),
        ),
      ),
    );
  }
}
