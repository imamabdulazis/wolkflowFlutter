import 'package:flutter/material.dart';
import 'package:wolkflow/models/models.dart';

class AvatarWidget extends StatelessWidget {
  final Author author;
  final double size;
  final bool genderVisibility;
  final Color badge;
  final List<BoxShadow> boxShadow;
  AvatarWidget({
    @required this.author,
    @required this.size,
    this.genderVisibility: true,
    this.badge,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 1.15,
      height: size * 1.15,
      child: Stack(
        children: <Widget>[
          _drawAvatar(context),
          _drawGender(context),
        ],
      ),
    );
  }

  Widget _drawAvatar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        shape: BoxShape.circle,
        border: Border.all(
          color: badge ?? Theme.of(context).cardColor,
          width: size / 30,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).cardColor,
            width: size / 30,
          ),
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: author.avatar.length != 0
                  ? NetworkImage(
                      author.avatar,
                    )
                  : AssetImage(
                      'assets/avatar.png',
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawGender(BuildContext context) {
    if (genderVisibility && author.sex != AuthorSex.OTHER) {
      return Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).cardColor,
              width: size / 15,
            ),
          ),
          child: Container(
            width: size / 4.5,
            height: size / 4.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: genderColor,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color get genderColor {
    if (author.sex == AuthorSex.MALE) {
      return Colors.blue;
    } else if (author.sex == AuthorSex.FEMALE) {
      return Colors.pink;
    } else {
      return Colors.transparent;
    }
  }
}
