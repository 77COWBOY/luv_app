import 'package:flutter/material.dart';
import 'constant.dart';

class CreateAccountScreen extends StatefulWidget{
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  bool _obscurePassword = true;
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
        MyInputField(hint: 'Full Name',),
        const SizedBox(height: AppSpacing.md),
        _label("Password"),
        MyInputField(hint: 'Enter Password', obscureText: _obscurePassword,
        ),
      ],
    ),
    ),
    ),
    );
  }
}

Padding _label(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 6),
    child:Text(
      "Password",
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

class MyInputField extends StatelessWidget{
  const MyInputField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.suffix,
  });
  final String hint;
  final bool obscureText;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppInput.height,
      padding:const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(AppInput.radius),
          boxShadow: const [AppShadow.soft]
      ),
      child: Center(
          child: TextField(
            obscureText: obscureText,
            decoration:InputDecoration(hintText: hint, border: InputBorder.none,hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: AppColors.textSecondary,
            ),
              suffixIcon: suffix,
            ),
            ))
    );
  }
}