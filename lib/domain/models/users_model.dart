class UsersModel {
  late int albumId;
  late int userId;
  late String name;
  late String url;
  late String thumbnailUrl;

  UsersModel(
      {required this.albumId,
      required this.userId,
      required this.name,
      required this.url,
      required this.thumbnailUrl});

  UsersModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    userId = json['userId'];
    name = json['name'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['userId'] = userId;
    data['name'] = name;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
