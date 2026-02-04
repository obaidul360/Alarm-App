import 'package:flutter/material.dart';

import '../../alarm/alarm_screen.dart';
class HomeButtonWidgets extends StatelessWidget {
  const HomeButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlarmScreen(), //AlarmSetScreen(),
            ), // AlarmScreenGoMap()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 65,
          width: MediaQuery.of(context).size.width * 2,
          decoration: BoxDecoration(
            color: Color(0xff5200FF),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xff5E6097), width: 2),
          ),
          child: Text(
            "Set Alarm",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}