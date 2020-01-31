import 'package:flutter/material.dart';
import 'package:wolkflow/store/store.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/owm_glyphs.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppbarTabsWidget(
          tabs: <Widget>[
            Tab(text: "Wiadomości"),
            Tab(text: "Powiadomienia"),
            Tab(text: "Tagi"),
          ],
        ),
        body: TabBarView(
          children: [
            NotLoggedWidget(
              icon: Icons.mail,
              text: "Prywatne wiadomości",
              child: ConversationsList(),
            ),
            NotLoggedWidget(
              icon: Icons.notifications,
              text: "Powiadomienia",
              child: NotificationsList(
                  pageKey: "Notifications",
                  converterCallback: (store) =>
                      store.state.notificationsState.notificationsState,
                  loadDataCallback: (store, refresh, completer) =>
                      store.dispatch(loadNotifications(refresh, completer))),
            ),
            NotLoggedWidget(
              icon: OwmGlyphs.ic_navi_my_wykop,
              text: "Obserwowane tagi",
              child: NotificationsList(
                  pageKey: "HashNotifications",
                  converterCallback: (store) =>
                      store.state.notificationsState.hashTagsState,
                  loadDataCallback: (store, refresh, completer) => store
                      .dispatch(loadHashTagNotifications(refresh, completer))),
            ),
          ],
        ),
      ),
    );
  }
}
