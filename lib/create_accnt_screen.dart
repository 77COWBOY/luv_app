import 'package:flutter/material.dart';
import 'constant.dart';

class CreateAccountScreen extends StatefulWidget{
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text('Create Account', style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: AppColors.textPrimary,
          ),
        ),


          const SizedBox(height: AppSpacing.sm),
          const Text('Create a new account',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: AppColors.textSecondary,
            ),
            ),


        const SizedBox(height: AppSpacing.xl),
        _label('Full Name'),
            Container(
              height: AppInput.height,
                padding:const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(AppInput.radius),
                  boxShadow: const [AppShadow.soft]
                ),
            )
      ],
    ),
    ),
    ),
    );
  }
}

Padding _label(String text) {
  Padding(padding: EdgeInsets.only(bottom: 6),
    child:Text(
      "Full Name",
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: AppColors.textPrimary,
      ),
    ),
  );
}