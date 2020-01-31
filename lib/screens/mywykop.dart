import 'package:flutter/material.dart';
import 'package:wolkflow/store/store.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/owm_glyphs.dart';

class MyWykopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppbarTabsWidget(
          onPressedSearch: () {},
          tabs: <Widget>[
            Tab(text: 'Mój Wykop'),
            Tab(text: 'Tagi'),
            Tab(text: 'Użytkownicy'),
            Tab(text: 'Lista tagów'),
          ],
        ),
        body: TabBarView(
          children: [
            NotLoggedWidget(
              icon: Icons.loyalty,
              fullText: "Mój wykop będzie widoczny po zalogowaniu.",
              child: EntryLinkList(
                  actionType: MYWYKOP_INDEX,
                  converterCallback: (store) =>
                      store.state.myWykopState.indexState,
                  loadDataCallback: (store, refresh, completer) =>
                      store.dispatch(loadIndex(refresh, completer))),
            ),
            NotLoggedWidget(
              icon: OwmGlyphs.ic_navi_my_wykop,
              fullText:
                  "Aktywność z obserwowanych tagów będzie widoczna po zalogowaniu.",
              child: Center(
                child: Text('Niezaimplementowane'),
              ),
            ),
            NotLoggedWidget(
              icon: Icons.group,
              fullText:
                  "Aktywność obserwowanych użytkowników będzie widoczna po zalogowaniu.",
              child: Center(
                child: Text('Niezaimplementowane'),
              ),
            ),
            NotLoggedWidget(
              icon: Icons.list,
              text: "Obserwowane tagi",
              child: Center(
                child: Text('Niezaimplementowane'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
