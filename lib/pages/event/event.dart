import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EVENT',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                          size: 20,
                        ))])])))),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildEventCard(
                      'OFFLINE',
                      'MASTERING THE ENTREPRENEUR MINDSET',
                      '\$25.5 \$45.5',
                      '38 Participants',
                      'May 22, 2024',
                      'assets/images/event_image_1.jpg',
                      Colors.blue,
                      context,
                    ),
                    _buildEventCard(
                      'ONLINE',
                      'GENERAL CONCEPT OF FNB BUDGETING',
                      'FREE',
                      '38 Participants',
                      'May 22, 2024',
                      'assets/images/event_image_2.jpg',
                      Colors.red,
                      context,
                    )])))]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/');
                break;
              case 1:
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/store');
                break;
              case 3:
                Navigator.pushReplacementNamed(context, '/forum');
                break;
              case 4:
                Navigator.pushReplacementNamed(context, '/profile');
                break;
            }
          },
        )));
  }

  Widget _buildEventCard(
      String type,
      String title,
      String price,
      String participants,
      String date,
      String imagePath,
      Color chipColor,
      BuildContext context,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: chipColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  )))]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
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
                        color: price == 'FREE' ? Colors.green : Colors.black,
                        decoration:
                        price.contains('\$45.5') ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    if (price.contains('\$45.5')) const SizedBox(width: 8),
                    if (price.contains('\$45.5'))
                      Text(
                        '\$45.5',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ))]),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          participants,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ))]),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ))])]),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/eventDetail',
                        arguments: {
                          'type': type,
                          'title': title,
                          'price': price,
                          'participants': participants,
                          'date': date,
                          'imagePath': imagePath,
                          'chipColor': chipColor,
                        });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text('Join Event',
                        style: TextStyle(color: Colors.white)),
                  ))]))]));
  }
}