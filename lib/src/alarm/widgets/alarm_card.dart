import 'package:flutter/material.dart';
import '../../model/alarm_model/alarm_model.dart';

class AlarmCard extends StatelessWidget {
  final AlarmModel alarm;
  final ValueChanged<bool> onSwitchChanged;

  const AlarmCard({
    super.key,
    required this.alarm,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          Switch(value: alarm.isOn, onChanged: onSwitchChanged),
        ],
      ),
    );
  }
}
