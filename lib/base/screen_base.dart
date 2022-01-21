
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
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

  void showSnackBar(String msg) {
    final snackBar = SnackBar(content: Text(msg));

    ScaffoldMessenger.of(context)
                     ..removeCurrentSnackBar()
                     ..showSnackBar(snackBar);
  }

  getAsync(String path, Map<String, dynamic>? params, Function response) async {
    final rp = await Dio().get(path, queryParameters: params);

    response(rp);
  }

  void showPopupMenu(List<PopupMenuItem> items, GlobalKey key, Function resultShowMenu) async {
    final box = key.currentContext?.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);

    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
        items: items,
        elevation: 6
    );

    resultShowMenu(result);
  }
}