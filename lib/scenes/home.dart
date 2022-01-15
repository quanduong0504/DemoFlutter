
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/database/database.dart';
import 'package:exercise_example/events/production_event.dart';
import 'package:exercise_example/models/product.dart';
import 'package:exercise_example/models/product_actions.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/scenes/add_product.dart';
import 'package:exercise_example/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final List<Production> _productions = <Production>[];

  HomeScreen(this.user);

  @override
  State<StatefulWidget> createState() {
    print('xin chao, ${user.fullName}');
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseState<HomeScreen> {
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
        body: FutureBuilder<List<Production>>(
          future: ProductionDB.db.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if(snapshot.hasData) {
              widget._productions.clear();
              widget._productions.addAll(snapshot.data!);
              return widget._productions.length == 0 ?
              Center(child: Text('Empty data')) :
              ListView.builder(
                itemCount: widget._productions.length,
                itemBuilder: (context, index) => ProductItem(widget._productions[index], (p) {
                  onItemResultListener(p, index);
                }),
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      );
  }

  void onItemResultListener(ProductActions productActions, int index) {
    switch(productActions.event) {
      case ProductionEvent.EDIT:
      case ProductionEvent.FAVORITE:
        _onUpdateProductItem(productActions.production, index);
        break;
      case ProductionEvent.DELETE:
        _onDeleteProductItem(productActions.production, index);
        break;
    }
  }

  void _onUpdateProductItem(Production production, int index) async {
    final success = await ProductionDB.db.update(production);

    if(success) {
      setState(() {
        widget._productions[index] = production;
      });
    }
  }

  void _onDeleteProductItem(Production production, int index) async {
    final success = await ProductionDB.db.delete(production);

    if(success) {
      setState(() {
        widget._productions.removeAt(index);
      });
    }
  }

  void _onAddResult(Production production) async {
    final result = await ProductionDB.db.insert(production);

    setState(() {
      widget._productions.add(result);
    });
  }
}