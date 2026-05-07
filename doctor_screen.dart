import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({super.key});

  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Ahmed Khan",
      "speciality": "Child Specialist",
      "time": "10:00 AM - 2:00 PM",
      "date": "Mon - Fri",
    },
    {
      "name": "Dr. Sara Ali",
      "speciality": "Cardiologist",
      "time": "2:00 PM - 6:00 PM",
      "date": "Mon - Sat",
    },
    {
      "name": "Dr. XYZ",
      "speciality": "Neurologist",
      "time": "6:00 PM - 10:00 PM",
      "date": "Tue - Sun",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const Text(
              "DOCTOR DEPARTMENT",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final d = doctors[index];

                  return Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.6),
                        ],
                      ),
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          d["name"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text("Speciality: ${d["speciality"]}"),
                        Text("Time: ${d["time"]}"),
                        Text("Days: ${d["date"]}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
