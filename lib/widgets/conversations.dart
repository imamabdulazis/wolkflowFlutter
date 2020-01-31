import 'package:flutter/material.dart';
import 'package:wolkflow/api/api.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/utils/utils.dart';

class ConversationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conversation>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var conversation = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    Utils.getPageTransition(
                      PmScreen(
                        conversation: conversation,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 18.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          conversation.author != null
                              ? AvatarWidget(
                                  author: conversation.author,
                                  size: 46.0,
                                )
                              : Container(),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 12.0,
                                right: 8.0,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: conversation.author.login,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: Utils.getAuthorColor(
                                            conversation.author, context),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\n' +
                                          Utils.getSimpleDate(
                                              conversation.lastUpdate),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        height: 1.3,
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DividerWidget(
                      padding: EdgeInsets.only(
                        left: 78.0,
                        right: 18.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: api.pm.getConversations(),
    );
  }
}
