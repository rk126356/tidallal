class NotificationModel {
  final String title;
  final String description;
  final DateTime date;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isRead': isRead,
    };
  }

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, date: $date, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationModel &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        isRead.hashCode;
  }
}

List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Notification title',
    description: 'This is a sample notification',
    date: DateTime.now().add(const Duration(hours: 1)),
  ),
  NotificationModel(
    title: 'Notification title',
    description: 'This is a sample notification',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Notification title',
    description: 'This is a sample notification',
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
