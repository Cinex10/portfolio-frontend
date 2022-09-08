import 'package:portfolio/models/picture_model.dart';

class WorkModel {
  WorkModel({
    required this.title,
    required this.description,
    required this.tools,
    required this.briefDescription,
    required this.date,
    required this.team,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    this.psUrl,
    this.asUrl,
    required this.mainPicture,
    required this.pictures,
  });

  final String title;
  final String briefDescription;
  final String tools;
  final String description;
  final DateTime date;
  final String team;
  final String? psUrl;
  final String? asUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final PictureModel mainPicture;
  final List<PictureModel> pictures;

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        title: json["title"],
        description: json["description"],
        briefDescription: json["briefDescription"],
        date: DateTime.parse(json["date"]),
        tools: json["tools"],
        team: json["team"],
        psUrl: json["psUrl"],
        asUrl: json["asUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        mainPicture: PictureModel.fromJson(json["mainPicture"]["data"]),
        pictures: PictureModel.listFromJson(json["pictures"]["data"]),
      );

  static List<WorkModel> listFromJson(List<dynamic> list) => List.generate(
        list.length,
        (index) => WorkModel.fromJson(
          list[index]['attributes'],
        ),
      );
}
