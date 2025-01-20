import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/data.dart';
import 'package:flutter_application_1/screens/home/client_home.dart';
import 'package:flutter_application_1/screens/home/staff_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return isClient ? const ClientHome() : const StaffHome();
  }
}
