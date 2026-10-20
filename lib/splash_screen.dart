import 'package:flutter/material.dart';
import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset>_slideAnimation;

  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );//AnimationController


    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0,0.6, curve: Curves.elasticOut),
      ),//CurvedAnimation
    );

     _fadeAnimation = Tween<double>(
         begin: 0.0,
          end: 1.0,
     ).animate(CurvedAnimation(parent: _controller,curve: Interval(0.0,0.4)));

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5,1.0,curve: Curves.easeOutCubic),
          ),//CurvedAnimation
    );//Tween

    _controller.forward();

    super.initState();
  }

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

          Center (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,// MainAxisAlignment, center logo
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child){
                      return Opacity(
                          opacity: _fadeAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(padding: EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBrown,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.indicatorActive.withValues(
                                        alpha:0.15,
                                    ),
                                    blurRadius: 40,
                                    spreadRadius  : 10,
                                  ),
                                ],
                              ),
                              child: Image.asset('assets/icons/logo.png',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                      );
                    }
                ),

                SizedBox(height: 24),
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        Text(
                          'luv',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Your Smart Financial Partner",
                          style: TextStyle(fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            color: AppColors.textSecondary.withValues(
                                alpha: 0.7),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
              child : Center(
            child: Center(
              child: FadeTransition(opacity: _fadeAnimation, child: SizedBox(width:40 ,height:2))
            )
          ))
        ],
      ),
    );
  }
}