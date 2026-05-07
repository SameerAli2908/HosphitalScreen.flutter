import 'package:flutter/material.dart';
import 'doctor_screen.dart';
import 'reception_screen.dart';
import 'medical_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<Map<String, dynamic>> items = [
    {"title": "Doctors", "icon": Icons.local_hospital, "color": Colors.blue},
    {"title": "Reception", "icon": Icons.person, "color": Colors.green},
    {"title": "Medical Store", "icon": Icons.medication, "color": Colors.orange},
  ];

  void openPage(BuildContext context, String title) {
    if (title == "Doctors") {
      Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorScreen()));
    } else if (title == "Reception") {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ReceptionScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MedicalScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f2027), Color(0xff203a43), Color(0xff2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [

            const SizedBox(height: 60),

            // 🏥 Hospital Name (Professional Badge Style)
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.15),
                  border: Border.all(color: Colors.white30),
                ),
                child: const Text(
                  "CITY CARE HOSPITAL",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Professional Health Care System",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return GestureDetector(
                    onTap: () => openPage(context, item["title"]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.08),
                        border: Border.all(color: Colors.white24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: item["color"],
                            radius: 25,
                            child: Icon(item["icon"], color: Colors.white),
                          ),

                          const SizedBox(width: 15),

                          Text(
                            item["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Spacer(),

                          const Icon(Icons.arrow_forward_ios,
                              color: Colors.white54, size: 16),
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