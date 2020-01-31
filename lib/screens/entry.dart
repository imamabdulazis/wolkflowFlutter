import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wolkflow/store/store.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/keys.dart';
import 'dart:async';

class EntryScreen extends StatelessWidget {
  final int entryId;
  EntryScreen({Key key, @required this.entryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return _SystemPadding(
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: StoreConnector<AppState, dynamic>(
              converter: (store) =>
                  (Completer completer, InputData inputData) => store
                      .dispatch(addEntryComment(entryId, inputData, completer)),
              builder: (context, callback) => InputBarWidget((inputData) {
                    var completer = Completer();
                    callback(completer, inputData);
                    return completer.future;
                  }, key: OwmKeys.inputBarKey)),
          resizeToAvoidBottomPadding: false,
          appBar: AppbarNormalWidget(
            title: "Wpis",
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {},
                tooltip: "Odśwież",
              ),
            ],
          ),
          body: StoreConnector<AppState, dynamic>(
            converter: (store) => (completer) => store
                .dispatch(loadEntry(entryId.toString(), entryId, completer)),
            builder: (context, callback) => StoreConnector<AppState, List<int>>(
                  converter: (store) => store.state.entryScreensState
                              .states[entryId.toString()] !=
                          null
                      ? store.state.entryScreensState.states[entryId.toString()]
                          .ids
                      : [],
                  onInit: (store) {
                    store.dispatch(
                        loadEntry(entryId.toString(), entryId, Completer()));
                  },
                  builder: (context, ids) {
                    if (ids.length == 0) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return RefreshIndicator(
                      onRefresh: () {
                        var completer = new Completer();
                        callback(completer);
                        return completer.future;
                      },
                      child: ScrollConfiguration(
                        behavior: NotSuddenJumpScrollBehavior(),
                        child: ErrorHandlerWidget(
                          errorType: ENTRY_PREFIX + entryId.toString(),
                          errorStateConverter: (store) =>
                              store.state.entryScreensState
                                  ?.states[entryId.toString()]?.errorState ??
                              ErrorState(),
                          hasData: () => ids.isNotEmpty,
                          child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: ids.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return EntryWidget(
                                  ellipsize: false,
                                  entryId: entryId,
                                  isClickable: false,
                                );
                              } else {
                                return EntryCommentWidget(
                                  commentId: ids[index],
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: Duration(milliseconds: 150),
      child: child,
    );
  }
}
