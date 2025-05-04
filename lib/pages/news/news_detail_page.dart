import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final String imagePath;

  const NewsDetailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Date
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lobortis erat nisi.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'December 22, 2024 | 12:00 UTC',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // Main Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Body Text
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lobortis erat nisi, at pretium tellus facilisis aliquet. Nam sit amet lacinia odio. Aenean ornare eu orci at tincidunt. Aliquam ac ultricies odio. Maecenas sed sapien ligula. Maecenas rutrum luctus orci, et finibus risus. Nulla facilisi. Ut dignissim velit massa, in elementum dui vulputate nec. Morbi sodales, erat nec vulputate pretium, enim mauris tempor eros, a lobortis erat orci vel neque.',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'Duis hendrerit eu orci sit amet lobortis. Proin dolor diam, venenatis a justo non, pretium aliquet ligula. Sed in orci non tortor gravida auctor et id sem. Donec elementum erat in nunc sagittis, a tempor enim ultricies. Aenean convallis justo nec arcu fermentum aliquet. Suspendisse sed accumsan lacus, non blandit justo.',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 24),
              // Related Section
              const Text(
                'Related',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/related_image.jpg',
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
                            const Text(
                              '1 hour ago',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  '345',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.comment, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  '278',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.share, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  '38',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Comment Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add Comment',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      const Icon(Icons.comment, size: 24, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text(
                        '543',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.thumb_up, size: 24, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text(
                        '1,453',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.share, size: 24, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text(
                        '100',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}