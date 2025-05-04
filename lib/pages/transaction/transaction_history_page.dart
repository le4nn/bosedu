import 'package:flutter/material.dart';

import 'transaction_detail_page.dart'; // Adjust the import path as needed

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  int _selectedFilterIndex = 0;

  final List<Map<String, String>> transactions = [
    {
      'imagePath': 'assets/images/tr_Image1.jpg',
      'title': 'MASTERING THE ENTREPRENEUR MINDSET',
      'subtitle': '12 chapter 22 min',
      'date': 'Feb 22, 2024 | 08:00 UTC',
      'orderId': '1345AADD0Q1211J',
    },
    {
      'imagePath': 'assets/images/tr_Image2.jpg',
      'title': 'GENERAL CONCEPT OF FNB BUDGETING',
      'subtitle': 'MAY 22, 2024',
      'date': 'Feb 22, 2024 | 08:00 UTC',
      'orderId': '1345AADD0Q1211J',
    },
    {
      'imagePath': 'assets/images/tr_image3.jpg',
      'title': 'BUSINESS LEGALIZATION',
      'subtitle': '10 PAGE',
      'date': 'Feb 22, 2024 | 08:00 UTC',
      'orderId': '1345AADD0Q1211J',
    },
    {
      'imagePath': 'assets/images/tr_Image1.jpg',
      'title': 'MASTERING THE ENTREPRENEUR MINDSET',
      'subtitle': '12 chapter 22 min',
      'date': 'Feb 22, 2024 | 08:00 UTC',
      'orderId': '1345AADD0Q1211J',
    },
    {
      'imagePath': 'assets/images/tr_Image2.jpg',
      'title': 'GENERAL CONCEPT OF FNB BUDGETING',
      'subtitle': 'MAY 22, 2024',
      'date': 'Feb 22, 2024 | 08:00 UTC',
      'orderId': '1345AADD0Q1211J',
    },
  ];

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
      body: Column(
        children: [
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('ALL', 0),
                  const SizedBox(width: 8),
                  _buildFilterButton('Modul', 1),
                  const SizedBox(width: 8),
                  _buildFilterButton('Course', 2),
                  const SizedBox(width: 8),
                  _buildFilterButton('Challenge', 3),
                  const SizedBox(width: 8),
                  _buildFilterButton('Bootcamp', 4),
                ],
              ),
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search something...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          // Transaction List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetailPage(
                            orderId: transaction['orderId']!,
                            paymentDate: transaction['date']!,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              transaction['imagePath']!,
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
                                  transaction['title']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  transaction['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Order Date : ${transaction['date']!.split(' |')[0]}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
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
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    bool isSelected = _selectedFilterIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilterIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              _getIconForLabel(label),
              size: 16,
              color: isSelected ? Colors.white : Colors.blue,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'ALL':
        return Icons.check;
      case 'Modul':
        return Icons.book;
      case 'Course':
        return Icons.school;
      case 'Challenge':
        return Icons.star;
      case 'Bootcamp':
        return Icons.computer;
      default:
        return Icons.check;
    }
  }
}