import 'package:floward/floward_app.dart';
import 'package:floward/resources/screen_values.dart';
import 'package:floward/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomeWidgetCard extends StatelessWidget {
  final String userName;
  final String thumbnail;
  final int postTotalCount;
  final Function() onTap;

  const HomeWidgetCard({
    Key? key,
    required this.onTap,
    required this.userName,
    required this.thumbnail,
    required this.postTotalCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenValues.radiusNormal),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenValues.paddingLarge),
          child: Row(
            children: [
              ClipOval(
                child: Hero(
                  tag: userName,
                  child: Image.network(
                    thumbnail,
                    width: ScreenValues.imageSmall,
                    height: ScreenValues.imageSmall,
                  ),
                ),
              ),
              SizedBox(width: ScreenValues.paddingLarge),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: ScreenValues.paddingNormal),
                    Text(
                      "${AppLocalizations.of(context)?.post_count ?? ""} : $postTotalCount",
                    ),
                  ],
                ),
              ),
              const Icon(Icons.play_arrow_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
