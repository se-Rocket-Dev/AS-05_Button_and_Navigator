import 'package:flutter/material.dart';

void main() => runApp(const MyDemoApp());

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.deepOrange),
      title: 'Button Nav Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ✅ ฟังก์ชันนำทาง
  void _navigate(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyWidget(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Nav Flutter Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              child: const Text('Go to MyWidget'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: () {
                _navigate(context, 'Elevated Button');
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 70),
              ),
              child: const Text('Outlined Button'),
              onPressed: () => _navigate(context, 'Outlined Button'),
            ),
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(Icons.arrow_forward), // ✅ แก้ Icon ผิด
              iconSize: 70,
              onPressed: () => _navigate(context, 'Icon Button'),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _navigate(context, 'InkWell Button'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: const Center(
                  child: Text(
                    'InkWell Button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;

  const MyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_back),
          label: const Text('Back to HomePage'),
          onPressed: () => Navigator.pop(context, 'Back from $title'),
        ),
      ),
    );
  }
}

