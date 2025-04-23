import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'SalonHomeScreen.dart';
import 'Page10.dart';

class Page14 extends StatefulWidget {
  const Page14({super.key});

  @override
  _Page14State createState() => _Page14State();
}

class _Page14State extends State<Page14> {
  String selectedMethod = 'Visa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[70],
      body: ResponsiveWrapper.builder(
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Reduced top space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/left_arrow.png', width: 30, height: 30),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Page10()));
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Payment Details',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[700],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 70),
                    ],
                  ),
                  const SizedBox(height: 50),

                  /// Order Summary
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _buildOrderItem('Order_1', 1, 4999),
                  _buildOrderItem('Order_2', 2, 999),
                  _buildOrderItem('Order_3', 1, 1999),

                  const Divider(height: 30, thickness: 2),

                  _buildPriceRow('Subtotal', 8996),
                  _buildPriceRow('Tax', 630),

                  const Divider(height: 30, thickness: 2),

                  /// Payment Method
                  const Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  _buildPaymentMethod('   Visa', 'assets/visa.png'),
                  _buildPaymentMethod('   PayPal', 'assets/paypal.png'),
                  _buildPaymentMethod('   Cash', 'assets/cash.png'),

                  const Divider(height: 30, thickness: 2),

                  /// Total + Checkout
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text('Rs. 10,125', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Proceed to checkout
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text('Proceed to Checkout', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String name, int qty, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name x$qty', style: const TextStyle(fontSize: 20)),
          Text('Rs. ${(price * qty).toStringAsFixed(0)}', style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          Text('Rs. ${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: 20, color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String method, String iconPath) {
    return Row(
      children: [
        // Image on the left
        Image.asset(
          iconPath,
          width: 60,
          height: 70,
        ),
        const SizedBox(width: 10), // Space between image and text

        // Text in the middle
        Text(method, style: const TextStyle(fontSize: 20)),

        // Radio button on the right, after the text
        Expanded(
          child: Align(
            alignment: Alignment.centerRight, // Aligns the radio button to the right
            child: Radio<String>(
              value: method,
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              activeColor: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
