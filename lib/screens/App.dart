import 'package:flutter/material.dart';
import 'package:loginFlowTest/navigation/FirstRouter.dart';
import 'package:loginFlowTest/navigation/MainRouter.dart';
import 'package:loginFlowTest/navigation/SecondRouter.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentTab = 0;

  @override
  void initState() {
    FirstRouter.setupRouter();
    SecondRouter.setupRouter();
    super.initState();
  }

  final _firstScreenKey = GlobalKey<NavigatorState>();
  final _secondScreenKey = GlobalKey<NavigatorState>();

  Widget _buildTabRouter(String type) {
    if (type == 'first') {
      return Offstage(
        offstage: currentTab == 1,
        child: Navigator(
          key: _firstScreenKey,
          onGenerateRoute: FirstRouter.router.generator,
          initialRoute: 'first',
        ),
      );
    } else if (type == 'second') {
      print(type);
      return Offstage(
        offstage: currentTab == 0,
        child: Navigator(
          key: _secondScreenKey,
          onGenerateRoute: SecondRouter.router.generator,
          initialRoute: 'second',
        ),
      );
    } else {
      return null;
    }
  }

  void _setCurrentTab(int index) {
    print(index);
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: [
        _buildTabRouter('first'),
        _buildTabRouter('second'),
      ], index: currentTab),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'first',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'second',
          ),
        ],
        onTap: _setCurrentTab,
        currentIndex: currentTab,
      ),
    );
  }
}
