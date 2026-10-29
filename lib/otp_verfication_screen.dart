import 'package:flutter/material.dart';
import 'constant.dart';

class OtpVerficationScreen extends StatefulWidget {
  const OtpVerficationScreen({super.key});

  @override
  State<OtpVerficationScreen> createState() => _OtpVerficationScreenState();
}

class _OtpVerficationScreenState extends State<OtpVerficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBrown.withValues(alpha:0.12),
                        shape: BoxShape.circle,

                      ),
                    )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
