import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../location/current_location.dart';
import '../model/alarm_model/alarm_model.dart';
import 'widgets/alarm_card.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<AlarmModel> alarms = [];

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      setState(() {
        alarms.add(
          AlarmModel(
            time: DateFormat.jm().format(dateTime),
            date: DateFormat('EEE d MMM yyyy').format(dateTime),
            isOn: true,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f3a),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b0f3a),
        title: const Text(
          "Selected Current Location",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CurrentLocatrionScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: pickTime,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.white70),
                  SizedBox(width: 10),
                  Text(
                    "Add your location",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alarms",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  return AlarmCard(
                    alarm: alarm,
                    onSwitchChanged: (value) {
                      setState(() {
                        alarm.isOn = value;
                      });
                    },
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
