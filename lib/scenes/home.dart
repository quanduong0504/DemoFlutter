
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
        body: ListView.builder(
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
        });
        break;
      case ProductionEvent.DELETE:
        setState(() {
          widget._productions.removeAt(index);
        });
        break;
    }
  }

  void _onAddResult(Production production) {
    setState(() {
      production.id = widget._productions.length == 0 ? 0 : widget._productions.last.id + 1;
      widget._productions.add(production);
    });
  }
}