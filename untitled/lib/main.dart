import 'package:flutter/material.dart';

void main() {
  runApp(const MySimpleApp());
}

class MySimpleApp extends StatelessWidget {
  const MySimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // لإخفاء شريط الـ Debug
      home: const WisdomPage(),
    );
  }
}

class WisdomPage extends StatefulWidget {
  const WisdomPage({super.key});

  @override
  State<WisdomPage> createState() => _WisdomPageState();
}

class _WisdomPageState extends State<WisdomPage> {
  // قائمة من الجمل المتغيرة
  List<String> wisdoms = [
    "الاستمرارية هي سر النجاح",
    "تعلم البرمجة ممتع جداً",
    "فلاتر تجعل بناء التطبيقات أسهل",
    "ابدأ اليوم ولا تؤجل للغد"
  ];

  int index = 0;

  void changeWisdom() {
    setState(() {
      // نغير الرقم ليختار جملة أخرى من القائمة
      index = (index + 1) % wisdoms.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text("تطبيقي الأول"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lightbulb, size: 100, color: Colors.amber),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                wisdoms[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: changeWisdom,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("تغيير الحكمة", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}