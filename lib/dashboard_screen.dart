import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:luv_app/common/navigation_bar.dart';
import 'package:luv_app/home/home_screen.dart';
import 'package:luv_app/cart/cart_screen.dart';
import 'package:luv_app/profile/profile_screen.dart';
import 'package:luv_app/stats/statistics_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    StatisticsScreen(),
    SizedBox(),
    MyCartScreen(),
    ProfileScreen(),
  ];

  void onBottomNavigationTap(int index){
    currentIndex = index;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: currentIndex,
        onNavTap: onBottomNavigationTap,
      ),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _fab(){
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.black,
      child: Icon(Icons.fingerprint, color: AppColors.background),
    );
  }
}

