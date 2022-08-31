import 'package:floward/domain/api/call_api.dart';
import 'package:floward/domain/models/home_model.dart';
import 'package:floward/domain/models/posts_model.dart';
import 'package:floward/domain/models/users_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeProvider extends ChangeNotifier {
  List<PostsModel>? _listPosts;
  List<UsersModel>? _listUsers;
  final List<HomeModel> _homeItems = [];

  List<HomeModel> get homeItems => _homeItems;

  Future<void> init() async {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    await _getPosts();
    await _getUsers();
    _mergePostsUsersData();
    notifyListeners();
    EasyLoading.dismiss();
  }

  Future<void> _getPosts() async {
    _listPosts = await CallApis().getPosts();
  }

  Future<void> _getUsers() async {
    _listUsers = await CallApis().getUsers();
  }

  void _mergePostsUsersData() {
    _listUsers?.forEach((user) {
      var posts =
          _listPosts?.where((post) => post.userId == user.userId).toList() ??
              [];
      _homeItems.add(
        HomeModel(
          albumId: user.albumId,
          userId: user.userId,
          name: user.name,
          url: user.url,
          thumbnailUrl: user.thumbnailUrl,
          postsModel: posts,
        ),
      );
    });
  }
}
