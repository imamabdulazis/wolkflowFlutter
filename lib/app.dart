import 'package:flutter/material.dart';
import 'package:wolkflow/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/themes.dart';
import 'package:wolkflow/utils/utils.dart';
import 'package:wolkflow/keys.dart';

class OwmApp extends StatelessWidget {
  final Store<AppState> store;

  OwmApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, bool>(
          // Required to make app redraw on login
          converter: (store) => store.state.authState.loggedIn,
          builder: (context, loggedIn) => StoreConnector<AppState, OWMTheme>(
                onInit: (store) => store.dispatch(ensureTheme()),
                converter: (store) => store.state.themeState.currentTheme,
                builder: (context, theme) => MaterialApp(
                      title: 'Wykop Mobilny',
                      navigatorKey: OwmKeys.navKey,
                      theme: theme == OWMTheme.LIGHT_THEME
                          ? Themes.lightTheme()
                          : Themes.darkTheme(),
                      routes: {
                        '/': (context) => MainScreen(),
                      },
                    ),
              ),
        ));
  }
}
