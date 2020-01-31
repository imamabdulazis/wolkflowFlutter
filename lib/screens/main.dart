import 'package:flutter/material.dart';
import 'package:wolkflow/screens/screens.dart';
import 'package:wolkflow/keys.dart';
import 'package:wolkflow/owm_glyphs.dart';
import 'package:wolkflow/widgets/widgets.dart';
import 'package:wolkflow/utils/utils.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    MikroblogScreen(),
    MyWykopScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: OwmKeys.mainScaffoldKey,
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2.0,
              ),
            ],
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconButton(Icons.home, 0, "Strona główna"),
              _iconButton(Icons.add_box, 1, "Mikroblog"),
              _addNewButton(),
              _iconButton(Icons.loyalty, 2, "Mój Wykop"),
              _iconButton(Icons.mail, 3, "Powiadomienia", badge: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addNewButton() {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 36.0,
      height: 36.0,
      child: FloatingActionButton(
        child: Icon(
          Icons.create,
          size: 22.0,
        ),
        tooltip: "Dodaj",
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).iconTheme.color.withOpacity(0.40),
        elevation: 0.0,
        onPressed: () {
          _showWriteBottomSheet(context);
        },
      ),
    );
  }

  void _showWriteBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final mqData = MediaQuery.of(context);
        final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
        return MediaQuery(
          data: mqDataNew,
          child: NotLoggedWidget(
            icon: Icons.account_circle,
            fullText: "Dodawanie treści będzie możliwe po zalogowaniu.",
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  image: AssetImage("kosmo_bg.png"),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 4.0,
                    ),
                    child: Text(
                      "NAPISZ COŚ OD SIEBIE",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _iconAddNewButton(
                        icon: OwmGlyphs.ic_buttontoolbar_wykop,
                        color: Colors.blueAccent,
                        title: "ZNALEZISKO",
                        onPressed: () {},
                      ),
                      _iconAddNewButton(
                        icon: Icons.add_box,
                        color: Colors.green,
                        title: "WPIS",
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                              Utils.getPageTransition(EntryInputScreen()));
                        },
                      ),
                      _iconAddNewButton(
                        icon: Icons.mail,
                        color: Colors.deepOrange,
                        title: "WIADOMOŚĆ",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    width: 34.0,
                    height: 34.0,
                    child: FloatingActionButton(
                      child: Icon(Icons.close),
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor:
                          Theme.of(context).iconTheme.color.withOpacity(0.40),
                      elevation: 0.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _iconAddNewButton({
    IconData icon,
    Color color,
    String title,
    VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 4.0,
      ),
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            elevation: 0.0,
            highlightElevation: 8.0,
            onPressed: onPressed,
            child: Icon(icon),
            backgroundColor: color,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 4.0,
              ),
              child: Text(
                title,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Theme.of(context).backgroundColor,
                      blurRadius: 2.0,
                    )
                  ],
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip,
      {num badge = 0}) {
    return IconButton(
      icon: Stack(
        children: <Widget>[
          Icon(
            icon,
            size: _currentIndex == index ? 30.0 : 26.0,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: badge != 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 3.0,
                    ),
                    child: Text(
                      badge <= 99 ? badge.toString() : "+99",
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      color: _currentIndex == index
          ? Theme.of(context).iconTheme.color
          : Theme.of(context).iconTheme.color.withOpacity(0.40),
      onPressed: () => this.setState(() {
            this._currentIndex = index;
          }),
      tooltip: tooltip,
    );
  }
}
