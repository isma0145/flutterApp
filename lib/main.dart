import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image and Flutter App',
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: ThemeData(
        fontFamily: 'Poppins', // Default font
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Horizontal ListView for network images
            const Text(
              'Network Images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              height: 250,
              child: HorizontalNetworkImages(),
            ),
            const SizedBox(height: 16),

            // ListTile Widgets with different fonts
            const Text(
              'Custom ListTiles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const CustomListTiles(),
            const SizedBox(height: 16),

            // Horizontal ListView for asset images
            const Text(
              'Asset Images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              height: 200,
              child: HorizontalAssetImages(),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Horizontal ListView with network images
class HorizontalNetworkImages extends StatelessWidget {
  const HorizontalNetworkImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3, // Number of images
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            'https://picsum.photos/600/400?random=$index',
            width: 300,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 100, color: Colors.red);
            },
          ),
        );
      },
    );
  }
}

// Widget for Horizontal ListView with asset images
class HorizontalAssetImages extends StatelessWidget {
  const HorizontalAssetImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Image.asset('assets/images/image1.jpg', width: 200),
        const SizedBox(width: 10),
        Image.asset('assets/images/image2.jpg', width: 200),
        const SizedBox(width: 10),
        Image.asset('assets/images/image3.jpg', width: 200),
      ],
    );
  }
}

// Widget for ListTiles with different font styles
class CustomListTiles extends StatelessWidget {
  const CustomListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Poppins Regular',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          leading: const Icon(Icons.star),
        ),
        ListTile(
          title: const Text(
            'Poppins Medium',
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          ),
          trailing: const CircleAvatar(child: Icon(Icons.person)),
        ),
        ListTile(
          title: const Text(
            'Poppins SemiBold',
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          ),
          leading: const Icon(Icons.favorite),
        ),
        ListTile(
          title: const Text(
            'Default Font',
            style: TextStyle(fontFamily: null),
          ),
          trailing: const Icon(Icons.access_alarm),
        ),
      ],
    );
  }
}
