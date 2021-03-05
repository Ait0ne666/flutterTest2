import 'package:flutter/material.dart';
import 'package:loginFlowTest/navigation/SecondRouter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  void navigate(BuildContext context) {
    // MainRouter.router.navigateTo(context, 'login',
    //     rootNavigator: true,
    //     transition: TransitionType.cupertino,
    //     clearStack: true);
    SecondRouter.router.navigateTo(context, 'fourth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Second Screen'),
            RaisedButton(
                onPressed: () => navigate(context), child: Text('Go to Fourth'))
          ],
        ),
      ),
    );
  }
}
