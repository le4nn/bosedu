import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      return const Scaffold(
        body: Center(child: Text('No event data available')),
      );
    }

    final String type = args['type'] ?? 'OFFLINE';
    final String title = args['title'] ?? 'No Title';
    final String price = args['price'] ?? '\$0';
    final String participants = args['participants'] ?? '0 Participants';
    final String date = args['date'] ?? 'No Date';
    final String imagePath = args['imagePath'] ?? 'assets/images/event_image_1.jpg';
    final Color chipColor = args['chipColor'] ?? Colors.blue;

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.push_pin_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 16,
                            color: price == 'FREE' ? Colors.green : Colors.red,
                            decoration: price.contains('\$45.5') ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        if (price.contains('\$45.5')) const SizedBox(width: 8),
                        if (price.contains('\$45.5'))
                          const Text(
                            '\$45.5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blue, size: 16),
                        const SizedBox(width: 4),
                        const Text(
                          'Jakarta, Indonesia',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        const Spacer(),
                        const Icon(Icons.calendar_today, color: Colors.blue, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          participants,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, '
                          'consectetur adipiscing elit. '
                          'Phasellus lobortis erat nisi, '
                          'at pretium tellus facilisis aliquet. '
                          'Nam sit amet lacinia odio. '
                          'Aenean ornare eu orci at tincidunt. '
                          'Aliquam ac ultricies odio. '
                          'Maecenas sed sapien ligula. '
                          'Maecenas rutrum luctus orci, et finibus risus.'
                          ' Nulla facilisi. Ut dignissim velit massa, '
                          'in elementum dui vulputate nec.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Read more',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/eventRegistration',
                                arguments: {
                                  'title': title,
                                  'price': price,
                                  'imagePath': imagePath,
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Register Now', style: TextStyle(color: Colors.white)),
                          ))])]))]))));
  }
}