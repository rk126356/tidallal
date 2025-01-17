import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/models/contract_model.dart';
import 'package:flutter_application_1/screens/contract/widgets/contract_card.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Contract',
          style: AppTextStyles.screenTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: ListView.builder(
          itemCount: contracts.length,
          itemBuilder: (context, index) {
            final contract = contracts[index];
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
                child: ContractCard(
                  contract: contract,
                  showDueDate: false,
                  canTap: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
