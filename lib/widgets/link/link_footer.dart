import 'package:flutter/material.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/utils/utils.dart';

class LinkFooterWidget extends StatelessWidget {
  final Link link;
  final bool isClickable;
  LinkFooterWidget(this.link, this.isClickable);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FavoriteButton(
            isFavorite: false,
            onTap: () {},
          ),
          CommentsButton(
            count: link.commentsCount,
            onTap: () {
              if (isClickable) {
                Navigator.push(
                  context,
                  Utils.getPageTransition(
                    LinkScreen(
                      linkId: link.id,
                    ),
                  ),
                );
              }
            },
          ),
          ShareButton(onTap: () {}),
        ],
      ),
    );
  }
}
