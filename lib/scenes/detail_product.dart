
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/product.dart';
import 'package:exercise_example/widgets/product_item.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  final Production _production;
  final Function onFavoriteChanged;

  DetailProduct(this._production, this.onFavoriteChanged);

  @override
  State<StatefulWidget> createState() {
    return _DetailProduct();
  }
}

class _DetailProduct extends WidgetBase<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              widget._production.updateFavorite();
              widget.onFavoriteChanged(widget._production.isFavorite);
            });
          }, icon: Icon(
              widget._production.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.pink,
            )
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 6/5,
            child: Image.network(ProductItem.FB_AVATAR, fit: BoxFit.fill),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Text(widget._production.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              child: Text(widget._production.subTitle, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800))
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              child: Text('Price: \$ ${widget._production.price}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic))
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(widget._production.name, style: TextStyle(fontSize: 14)),
          ),
        ],
      )
    );
  }
}