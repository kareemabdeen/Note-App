import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color; // we will know reason behind its type later

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });

  // Method to update all data in the NoteModel
  void updateAll({
    String? title,
    String? subtitle,
    String? date,
    int? color,
  }) {
    // Update properties with provided values if not null
    this.title = title ?? this.title;
    this.subtitle = subtitle ?? this.subtitle;
    this.date = date ?? this.date;
    this.color = color ?? this.color;

    // Save the changes to the Hive database
    save();
  }

  NoteModel copyWith({
    String? title,
    String? subtitle,
    String? date,
    int? color,
  }) {
    return NoteModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }
}
