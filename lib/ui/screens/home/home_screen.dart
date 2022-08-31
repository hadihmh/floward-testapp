import 'package:floward/floward_app.dart';
import 'package:floward/provider/home_provider.dart';
import 'package:floward/resources/screen_values.dart';
import 'package:floward/ui/screens/post/post_screen.dart';
import 'package:floward/ui/widgets/app_bar_widget.dart';
import 'package:floward/ui/widgets/home_widget_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    await context.read<HomeProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppLocalizations.of(context)?.app_name ?? ""),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => ListView.separated(
          padding: EdgeInsets.all(ScreenValues.paddingSmall),
          itemBuilder: (context, index) {
            var item = homeProvider.homeItems[index];
            return HomeWidgetCard(
              key: Key(item.userId.toString()),
              userName: item.name,
              thumbnail: item.thumbnailUrl,
              postTotalCount: item.postsModel.length,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostScreen(homeModel: item),
                    ));
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: ScreenValues.paddingSmall,
          ),
          itemCount: homeProvider.homeItems.length,
        ),
      ),
    );
  }
}
