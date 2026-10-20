import 'package:flutter/material.dart';
import 'animated_illustration.dart';
import 'constant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  bool get isLastPage => _currentIndex == _pages.length - 1;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      highlightedText: 'Take Control',
      normalText: ' of your finances\nlike never before!',
      subTitle:
          'Track expenses, make payments, and manage your money in one place.',
      image: 'assets/images/board_bg.png',
    ),
    _OnboardingPageData(
      highlightedText: 'Spend smarter',
      normalText: 'everyday with smarter tools in one app!',
      subTitle: 'Monitor spending, pay securely',
      image: 'assets/images/board.png',
    ),

    _OnboardingPageData(
      highlightedText: 'Pay for Everything',
      normalText: 'with ease and confidence',
      subTitle:
          'Handle all your payments easily, anytime, from one secure app.',
      image: 'assets/images/board_bg.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFBFDFB), Color(0xFFF5F9F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBrown,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),

                        SizedBox(width: 8),
                        Text(
                          'LUV',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    if (isLastPage)
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: AppColors.border.withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSpacing.md),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                                color: AppColors.textPrimary,
                              ),
                              children: [
                                TextSpan(
                                  text: page.highlightedText,
                                  style: TextStyle(
                                    color: AppColors.primaryBrown,
                                  ),
                                ),
                                TextSpan(text: page.normalText),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSpacing.md),
                          Text(
                            page.subTitle,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),

                          Spacer(),
                          Center(
                            child: AnimatedIllustration(
                              child: _buildAnimatedIllustration(_currentIndex,page.image, 300.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildAnimatedIllustration(
    int index,
    String imagePath,
    double maxHeight,
    ) => SizedBox(
  height: maxHeight,
  child: Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    ],
  ),
);


class _OnboardingPageData {
  final String highlightedText;
  final String normalText;
  final String subTitle;
  final String image;

  _OnboardingPageData({
    required this.highlightedText,
    required this.normalText,
    required this.subTitle,
    required this.image,
  });
}
