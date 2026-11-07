import 'package:flutter/material.dart';
import 'package:luv_app/constant.dart';
import 'package:luv_app/model/payment_item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.primaryBrown),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerTop(context),
                  SizedBox(height: 20),
                  Text(
                    "Money Spend",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "\$1000",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _quickActions(context),
                ],
              ),
            ),

            Positioned(
              top: 260,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(DashboardSizes.headerRadius),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [paymentListGrid(context)]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentListGrid(BuildContext context) {
    final items = [
      PaymentItem('Internet', Icons.wifi, Colors.red),
      PaymentItem('Electricity', Icons.bolt, Colors.orange),
      PaymentItem('Water', Icons.water_drop, Colors.blue),
      PaymentItem('Gas', Icons.local_gas_station, Colors.green),
      PaymentItem('TV', Icons.tv, Colors.purple),
      PaymentItem('Merchant', Icons.shopping_cart, Colors.pink),
      PaymentItem('Mobile', Icons.phone, Colors.yellow),
      PaymentItem('More', Icons.apps, Colors.teal),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "payment List",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,// bug fix
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              child: Column(
                children: [
                  Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: item.color,
                        shape: BoxShape.circle,
                      ),
                    child: Icon(item.icon, color:Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(item.title, style: const TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: Colors.black54),)
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _quickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickIcon(Icons.account_balance_wallet, () {}),
        _quickIcon(Icons.swap_horiz, () {}),
        _quickIcon(Icons.credit_card, () {}),
        _quickIcon(Icons.savings, () {}),
      ],
    );
  }

  Widget _quickIcon(IconData icon, void Function()? onPressed) {
    return Container(
      height: DashboardSizes.iconCircle,
      width: DashboardSizes.iconCircle,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.2),
      ),

      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _headerTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Hello",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
          ],
        ),

        Row(
          children: [
            GestureDetector(child: _circleIcon(Icons.notifications_none)),
            SizedBox(width: 10),
            GestureDetector(child: _circleIcon(Icons.fingerprint)),
          ],
        ),
      ],
    );
  }

  Container _circleIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
