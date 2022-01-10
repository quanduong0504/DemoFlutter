
import 'dart:convert';

import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/events/production_event.dart';
import 'package:exercise_example/models/product.dart';
import 'package:exercise_example/models/product_actions.dart';
import 'package:exercise_example/scenes/add_product.dart';
import 'package:exercise_example/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Production> _productions = <Production>[];

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends WidgetBase<HomeScreen> {
  void _getDataFromPrefs() {
    widget._productions.clear();
    getPrefs<List>(WidgetBase.PREFS_PRODUCTION, (result) {
      if(result != null) {
        List<String> items = result;

        setState(() {
          widget._productions.addAll(
              items.map((e) => Production.fromJson(json.decode(e))).toList()
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text('Home Screen'),
            actions: [
              IconButton(onPressed: () {
                pushScreenAndAwaitResult(AddProductScreen(null), _onAddResult);
              }, icon: Icon(
                Icons.add,
                color: Colors.white
              ))
            ],
        ),
        body: widget._productions.length == 0 ?
            Center(child: Text('Empty data')) :
            ListView.builder(
              itemCount: widget._productions.length,
                itemBuilder: (context, index) => ProductItem(widget._productions[index], (p) {
              onItemResultListener(p, index);
            }),
        ),
      );
  }

  void onItemResultListener(ProductActions productActions, int index) {
    switch(productActions.event) {
      case ProductionEvent.EDIT:
        setState(() {
          widget._productions[index] = productActions.production;
          _updateItemsToLocal();
        });
        break;
      case ProductionEvent.DELETE:
        setState(() {
          widget._productions.removeAt(index);
          _updateItemsToLocal();
        });
        break;
      case ProductionEvent.FAVORITE:
        _updateItemsToLocal();
        break;
    }
  }

  void _onAddResult(Production production) {
    setState(() {
      production.id = widget._productions.length == 0 ? 0 : widget._productions.last.id + 1;
      widget._productions.add(production);
      _updateItemsToLocal();
    });
  }
  
  void _updateItemsToLocal() {
    putPrefs(
        WidgetBase.PREFS_PRODUCTION,
        widget._productions.map((e) => jsonEncode(e.toJson())).toList(), () {}
    );
  }
}