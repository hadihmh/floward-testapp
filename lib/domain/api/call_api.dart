import 'package:floward/domain/api/base_api.dart';
import 'package:floward/domain/config/routes.dart';
import 'package:floward/domain/models/posts_model.dart';
import 'package:floward/domain/models/users_model.dart';

class CallApis extends BaseAPI {
  Future<List<PostsModel>> getPosts() async {
    var result = await get<List<dynamic>>(route: Routes.posts);
    return result?.map((e) => PostsModel.fromJson(e)).toList() ?? [];
  }

  Future<List<UsersModel>> getUsers() async {
    var result = await get<List<dynamic>>(route: Routes.users);
    return result?.map((e) => UsersModel.fromJson(e)).toList() ?? [];
  }
}
