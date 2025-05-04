import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final String orderId;
  final String paymentDate;

  const TransactionDetailPage({
    super.key,
    required this.orderId,
    required this.paymentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transaction History',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order ID',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  orderId,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Date',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  paymentDate,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            // Purchased Items
            _buildItemCard(
              imagePath: 'assets/images/tr_Image1.jpg',
              title: 'Mastering the Entrepreneur Mindset',
              originalPrice: '\$49.5',
              discountedPrice: '\$29',
            ),
            const SizedBox(height: 16),
            _buildItemCard(
              imagePath: 'assets/images/tr_Image2.jpg',
              title: 'General Concept of FnB Budgeting',
              originalPrice: '\$49.5',
              discountedPrice: '\$29',
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            // Payment Details
            const Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  'Bank Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'TOTAL PRICE (2 ITEM)',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '\$99.0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'DISCOUNT',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '-\$41.0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'VOUCHER',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '-\$0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '\$58.0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Contact Us Button
            const Text(
              'DO YOU NEED HELP?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard({
    required String imagePath,
    required String title,
    required String originalPrice,
    required String discountedPrice,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    discountedPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    originalPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}