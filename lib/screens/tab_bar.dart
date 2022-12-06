import 'package:address_book/screens/users.dart';
import 'package:address_book/screens/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const HomeTabBar());
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [const Users(title: 'Users'), const Contacts()];

    return Platform.isAndroid
        ? MaterialApp(
            home: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.view_list),
                      ),
                      Tab(
                        icon: Icon(Icons.list),
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: <Widget>[
                    Users(title: 'Users'),
                    Contacts(),
                  ],
                ), // This trailing comma makes auto-formatting nicer for build methods.
              ),
            ),
          )
        : CupertinoApp(
            home: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
                    label: 'Users',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.list_bullet),
                    label: 'Contacts',
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                   return Padding(
                     padding: const EdgeInsets.only(bottom: 50),
                      child: tabs[index]
                    );
                  },
                );
              },
            ),
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
          );
  }
}
