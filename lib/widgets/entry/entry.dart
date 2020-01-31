import 'package:flutter/material.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/utils/utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wolkflow/store/store.dart';

class EntryWidget extends StatelessWidget {
  final int entryId;
  final bool ellipsize;
  final bool isClickable;
  EntryWidget({
    this.entryId,
    this.ellipsize,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Key(entryId.toString()),
      padding: EdgeInsets.only(
        bottom: 0.0,
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        child: StoreConnector<AppState, Entry>(
          converter: (store) => store.state.entitiesState.entries[entryId],
          builder: (context, entry) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AuthorWidget(
                        author: entry.author,
                        date: entry.date,
                        fontSize: 14.0,
                        padding:
                            EdgeInsets.only(top: 12.0, bottom: 0.0, right: 4.0),
                      ),
                      _drawVoteButton(entry),
                    ],
                  ),
                  _drawBody(context, entry),
                  _drawEmbed(entry),
                  EntryFooterWidget(entry, this.isClickable),
                  Divider(
                    height: 1.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _drawBody(BuildContext context, Entry entry) {
    return SupaGestureDetector(
      onTap: isClickable
          ? () {
              Navigator.of(context).push(
                  Utils.getPageTransition(EntryScreen(entryId: this.entryId)));
            }
          : null,
      child: BodyWidget(
        body: entry.body,
        ellipsize: ellipsize,
        padding: EdgeInsets.only(
          top: 12.0,
          left: 2.0,
          right: 2.0,
          bottom: 2.0,
        ),
      ),
    );
  }

  Widget _drawVoteButton(Entry entry) {
    return Padding(
      padding: EdgeInsets.only(
        right: 0.0,
      ),
      child: StoreConnector<AppState, VoidCallback>(
        converter: (state) => () => state.dispatch(voteEntry(entryId)),
        builder: (context, callback) => VoteButton(
              isSelected: entry.isVoted,
              count: entry.voteCount,
              onClicked: () {
                callback();
              },
            ),
      ),
    );
  }

  Widget _drawEmbed(Entry entry) {
    if (entry.embed != null) {
      return Container(
        padding: EdgeInsets.only(top: 14.0, bottom: 2.0),
        child: EmbedWidget(
          embed: entry.embed,
          borderRadius: 14.0,
          reducedWidth: 36.0,
        ),
      );
    } else {
      return Container();
    }
  }
}
