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
    // onboarding page 1
    _OnboardingPageData(
      highlightedText: 'Take Control',
      normalText: ' of your finances\nlike never before!',
      subTitle:
          'Track expenses, make payments, and manage your money in one place.',
      image: 'assets/images/board_bg.png',
    ),
    //onboarding page 2
    _OnboardingPageData(
      highlightedText: 'Spend smarter',
      normalText: ' everyday with smarter tools in one app!',
      subTitle: 'Monitor spending, pay securely',
      image: 'assets/images/board.png',
    ),
    //onboarding page 3
    _OnboardingPageData(
      highlightedText: 'Pay for Everything',
      normalText: ' with ease and confidence',
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
            colors: [Colors.white38, Color(0xFFFBFDFB), Color(0xFFF5F9F5)],// background Color gradient
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
                        Container(//top right wallet icon
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
                              size: 18,
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
                                fontWeight: FontWeight.w800,
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
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),

                          Spacer(),
                          Center(
                            child: AnimatedIllustration(
                              child: _buildAnimatedIllustration(_currentIndex,page.image, 300.0),// AnimatedIllustration Image
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_pages.length,
                              (i)=> _IndicatorDot(isActive: i == _currentIndex),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
        if (index == 0)...[
          Positioned(
            bottom: maxHeight * 0.12,
            right: maxHeight * 0.05,
            
            child: _buildFloatingCard(
              child: Row(
                children:[
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE7F4E5),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/icons/wallet.png',//bottom right icon
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text('\$12,340.00',style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: AppColors.textPrimary,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]else if (index == 1)// onboarding Screen #2
          ...[
            Positioned(
              top: maxHeight * 0.1,
              left: maxHeight * 0.05,
              child: Container(
                width: maxHeight * 0.36,
                height: maxHeight * 0.22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.18),
                        blurRadius: 12,
                        offset: Offset(0,6),
                      ),
                    ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/icons/card_second.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ]else if (index == 2)// onboarding Screen #3
            ...[
              Positioned(
                top: maxHeight * 0.2,
                right: maxHeight * 0.02,
                child: _buildFloatingCard(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xFFE7F4E5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.check_circle_rounded,
                              color: AppColors.indicatorActive,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(children: [
                          Text("Payment sent")
                        ]),
                      ],
                    )),
              ),
            ],
      ],
    ),
  );
  Widget _buildFloatingCard({required Widget child}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 8 ),
          ),
        ],
      ),
      child: child,
    );
  }

}
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

class _IndicatorDot extends StatelessWidget{
  const _IndicatorDot({required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.indicatorActive
            : AppColors.indicatorInactive,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
