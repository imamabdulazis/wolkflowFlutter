import 'package:flutter/material.dart';
import 'package:wolkflow/owm_glyphs.dart';
import 'package:wolkflow/utils/utils.dart';
import 'package:wolkflow/widgets/widgets.dart';

class VoteButton extends StatefulWidget {
  final VoidCallback onClicked;
  final num count;
  final isSelected;
  final bool negativeIcon;
  final bool onlyIcon;
  final double fontSize;
  final EdgeInsets margin;
  VoteButton({
    @required this.onClicked,
    @required this.isSelected,
    this.count,
    this.negativeIcon: false,
    this.onlyIcon: false,
    this.fontSize: 14.0,
    this.margin,
  });

  @override
  VoteButtonState createState() {
    return new VoteButtonState();
  }
}

class VoteButtonState extends State<VoteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: widget.margin,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Utils.voteBackgroundStateColor(
            isSelected: widget.isSelected,
            negativeIcon: widget.negativeIcon,
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              (widget.negativeIcon
                  ? OwmGlyphs.ic_buttontoolbar_minus
                  : OwmGlyphs.ic_buttontoolbar_plus),
              size: widget.fontSize * 1.19,
              color: Utils.voteIconStateColor(
                isSelected: widget.isSelected,
                negativeIcon: widget.negativeIcon,
              ),
            ),
            widget.onlyIcon
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      right: 4.0,
                    ),
                    child: Text(
                      widget.count.toInt().toString(),
                      style: TextStyle(
                        color: Utils.voteIconStateColor(
                          isSelected: widget.isSelected,
                          negativeIcon: widget.negativeIcon,
                        ),
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      onTap: () {
        this.widget.onClicked();
      },
    );
  }
}
