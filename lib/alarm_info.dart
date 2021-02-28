class AlarmInfo {
  int id;
  String title;
  DateTime alarmDateTime;
  bool isPending;
  int gradientColorIndex;
  // TODO: 本当はList<bool>で持ちたい
  String repeat;

  AlarmInfo({
    this.id,
    this.title,
    this.alarmDateTime,
    this.isPending,
    this.gradientColorIndex,
    this.repeat,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
        gradientColorIndex: json["gradientColorIndex"],
        repeat: json["repeat"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isPending": isPending,
        "gradientColorIndex": gradientColorIndex,
        "repeat": repeat,
      };
}
