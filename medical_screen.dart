import 'package:flutter/material.dart';

class MedicalScreen extends StatefulWidget {
  const MedicalScreen({super.key});

  @override
  State<MedicalScreen> createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  final List<Map<String, dynamic>> medicines = [
    {"name": "Panadol", "price": 50},
    {"name": "Brufen", "price": 80},
    {"name": "Amoxicillin", "price": 120},
    {"name": "Disprin", "price": 30},
  ];

  int total = 0;

  void addMedicine(int price) {
    setState(() {
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8e2de2), Color(0xff4a00e0)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const Text(
              "MEDICAL STORE",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            const SizedBox(height: 10),

            Text(
              "Total Bill: Rs $total",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final m = medicines[index];

                  return GestureDetector(
                    onTap: () => addMedicine(m["price"]),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.9),
                        border: Border.all(color: Colors.purpleAccent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(m["name"]),
                          Text("Rs ${m["price"]}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}