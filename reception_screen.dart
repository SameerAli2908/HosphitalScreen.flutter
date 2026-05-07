import 'package:flutter/material.dart';

class ReceptionScreen extends StatefulWidget {
  const ReceptionScreen({super.key});

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  final List<Map<String, dynamic>> patients = [
    {"name": "Ali Raza", "token": "A-101"},
    {"name": "Ahmed Khan", "token": "A-102"},
  ];

  void addPatient() {
    setState(() {
      patients.add({
        "name": "New Patient ${patients.length + 1}",
        "token": "A-10${patients.length + 1}"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addPatient,
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff7971e), Color(0xffffd200)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "RECEPTION AREA",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.9),
                      border: Border.all(color: const Color.fromARGB(255, 89, 148, 83)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(patients[index]["name"]),
                        Text(
                          patients[index]["token"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
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