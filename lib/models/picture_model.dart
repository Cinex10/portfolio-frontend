class PictureModel {
  PictureModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
        name: json['attributes']["name"],
        url: json['attributes']["url"],
      );

  static List<PictureModel> listFromJson(List<dynamic> list) => List.generate(
        list.length,
        (index) => PictureModel.fromJson(
          list[index],
        ),
      );
}
