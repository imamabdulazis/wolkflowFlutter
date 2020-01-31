import 'package:flutter/material.dart';
import 'html_parser.dart';

class BodyWidget extends StatelessWidget {
  final String body;
  final bool ellipsize;
  final EdgeInsets padding;
  final bool blackTheme;
  BodyWidget({
    this.body,
    this.ellipsize = false,
    this.padding: const EdgeInsets.only(
      left: 12,
      right: 12,
      bottom: 12,
    ),
    this.blackTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    if (body != null) {
      return Column(children: [
        Padding(
          padding: padding,
          child: HtmlWidget(
              blackText: false,
              html: body != null
                  ? body.length > 300 && ellipsize
                      ? body.substring(0, 200) + '...'
                      : body
                  : ''),
        )
      ]);
    } else {
      return Container();
    }
  }
}
