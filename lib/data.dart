import 'package:light_alarm/alarm_info.dart';
import 'package:light_alarm/constants/theme_dart.dart';
import 'package:light_alarm/enums.dart';
import 'package:light_alarm/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office', gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Sport', gradientColors: GradientColors.sunset),
];
