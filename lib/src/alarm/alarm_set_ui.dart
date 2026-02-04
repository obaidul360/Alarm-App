import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AlarmSetScreen extends StatefulWidget {
  const AlarmSetScreen({super.key});

  @override
  State<AlarmSetScreen> createState() => _AlarmSetScreenState();
}

class _AlarmSetScreenState extends State<AlarmSetScreen> {
  List<AlarmModel> alarms = [];

  // Time Picker Function
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
          "Selected Location",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
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
            // Location Box
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

            // Alarm Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alarms",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            const SizedBox(height: 12),

            // Alarm List
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  return alarmCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget alarmCard(int index) {
    final alarm = alarms[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1a1f5a),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                alarm.time,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(alarm.date, style: const TextStyle(color: Colors.white60)),
            ],
          ),

          Switch(
            value: alarm.isOn,
            onChanged: (v) {
              setState(() {
                alarm.isOn = v;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AlarmModel {
  String time;
  String date;
  bool isOn;

  AlarmModel({required this.time, required this.date, required this.isOn});
}

