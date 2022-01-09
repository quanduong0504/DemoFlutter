
import 'package:flutter/material.dart';

abstract class WidgetBase<T extends StatefulWidget> extends State<T> {
  void pushScreen(StatefulWidget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pushScreenAndAwaitResult(StatefulWidget screen, Function result) async {
    final rs = await Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

    result(rs);
  }

  void pushStateLess(StatelessWidget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pushNamed(routerName, Object arguments) {
    Navigator.pushNamed(context, routerName, arguments: arguments);
  }
}