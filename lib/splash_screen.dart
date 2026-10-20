import 'package:flutter/material.dart';
import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBrown.withValues(alpha: 0.2),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width:200,
              height:200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.indicatorActive.withValues(alpha:0.03),
              ),
            ),
          ),
        ],
      ),
    );
  }
}