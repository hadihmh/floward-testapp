import 'package:floward/domain/models/posts_model.dart';

class HomeModel {
  int albumId;
  int userId;
  String name;
  String url;
  String thumbnailUrl;
  List<PostsModel> postsModel;

  HomeModel(
      {required this.albumId,
      required this.userId,
      required this.name,
      required this.url,
      required this.thumbnailUrl,
      required this.postsModel});
}
