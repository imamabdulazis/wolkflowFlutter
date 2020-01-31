import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/store/store.dart';
import 'package:wolkflow/utils/utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';

typedef void LoginCallback(String login, String token, Completer completer);

class AppbarUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      child: StoreConnector<AppState, AuthState>(
        onInit: (store) => store.dispatch(syncStateWithApi()),
        converter: (store) => store.state.authState,
        builder: (context, authState) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(
                Utils.getPageTransition(
                  MainSettingsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: authState.loggedIn
                      ? AdvancedNetworkImage(
                          authState.avatarUrl,
                          useDiskCache: true,
                        )
                      : AssetImage(
                          'assets/avatar.png',
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
