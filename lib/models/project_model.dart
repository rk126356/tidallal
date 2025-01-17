import 'package:flutter/material.dart';

enum ProjectStatus { active, completed }

class ProjectModel {
  final String id;
  final String projectName;
  final String startDate;
  final String endDate;
  final ProjectStatus status;

  ProjectModel({
    required this.id,
    required this.projectName,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      projectName: json['projectName'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString() == 'ProjectStatus.${json['status']}',
        orElse: () => ProjectStatus.active,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectName': projectName,
      'startDate': startDate,
      'endDate': endDate,
      'status': status.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'ProjectModel(id: $id, projectName: $projectName, startDate: $startDate, endDate: $endDate, status: $status)';
  }

  static ProjectStatus parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return ProjectStatus.active;

      case 'completed':
        return ProjectStatus.completed;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  static String statusToString(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
        return 'active';
      case ProjectStatus.completed:
        return 'completed';
    }
  }

  Color getStatusColor() {
    switch (status) {
      case ProjectStatus.active:
        return Colors.orange;
      case ProjectStatus.completed:
        return Colors.green;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectModel &&
        other.id == id &&
        other.projectName == projectName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        projectName.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        status.hashCode;
  }
}

List<ProjectModel> projects = [
  ProjectModel(
    id: '0190',
    projectName: 'Villa  house construction',
    startDate: '23-10-2023',
    endDate: '23-10-2023',
    status: ProjectStatus.active,
  ),
  ProjectModel(
    id: '0190',
    projectName: 'Villa  house construction',
    startDate: '23-10-2023',
    endDate: '23-10-2023',
    status: ProjectStatus.active,
  ),
  ProjectModel(
    id: '0190',
    projectName: 'Villa  house construction',
    startDate: '23-10-2023',
    endDate: '23-10-2023',
    status: ProjectStatus.active,
  ),
  ProjectModel(
    id: '0190',
    projectName: 'Villa  house construction',
    startDate: '23-10-2023',
    endDate: '23-10-2023',
    status: ProjectStatus.active,
  ),
];
