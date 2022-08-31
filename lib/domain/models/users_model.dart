class UsersModel {
  int? albumId;
  int? userId;
  String? name;
  String? url;
  String? thumbnailUrl;

  UsersModel(
      {this.albumId, this.userId, this.name, this.url, this.thumbnailUrl});

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
