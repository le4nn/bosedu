import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildNotificationSection(
            dateTime: 'February 22, 2024 | 15:30 UTC',
            icon: Icons.shopping_bag,
            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitle: 'Sed tempor dolor lectus, lobortis porta turpis.',
            isUnread: true,
          ),
          _buildNotificationSection(
            dateTime: 'February 22, 2024 | 15:30 UTC',
            icon: Icons.message,
            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitle: 'Sed tempor dolor lectus, lobortis porta turpis.',
            isUnread: true,
          ),
          _buildNotificationSection(
            dateTime: 'February 22, 2024 | 15:30 UTC',
            icon: Icons.shopping_bag,
            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitle: 'Sed tempor dolor lectus, lobortis porta turpis.',
            isUnread: false,
          ),
          _buildNotificationSection(
            dateTime: 'February 22, 2024 | 15:30 UTC',
            icon: Icons.message,
            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitle: 'Sed tempor dolor lectus, lobortis porta turpis.',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection({
    required String dateTime,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isUnread,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateTime,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.blue, size: 24),
                ),
                if (isUnread)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
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
        const SizedBox(height: 16),
      ],
    );
  }
}