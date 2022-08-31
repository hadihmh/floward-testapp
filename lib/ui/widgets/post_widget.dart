import 'package:floward/resources/screen_values.dart';
import 'package:floward/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String title;
  final String body;

  const PostWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainTheme = Theme.of(context).textTheme.bodyText1;
    return CardWidget(
      child: Padding(
        padding: EdgeInsets.all(ScreenValues.paddingNormal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: mainTheme?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ScreenValues.paddingSmall),
            Text(
              body,
              style: mainTheme,
            ),
          ],
        ),
      ),
    );
  }
}
