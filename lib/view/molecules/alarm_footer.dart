import 'package:flutter/material.dart';

class AlarmFooter extends StatefulWidget {
  const AlarmFooter();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'alarm',
          icon: Icon(Icons.alarm),
        ),
        BottomNavigationBarItem(
          label: 'timer',
          icon: Icon(Icons.timer),
        ),
      ],
    );
  }
}
