
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/events/production_event.dart';
import 'package:exercise_example/models/product.dart';
import 'package:exercise_example/models/product_actions.dart';
import 'package:exercise_example/scenes/add_product.dart';
import 'package:exercise_example/scenes/detail_product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  static const FB_AVATAR = 'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/271547255_4762969830497176_7735263019609657449_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=Rweh_TSkwFIAX9d0VyM&_nc_ht=scontent.fhan5-2.fna&oh=00_AT_W0SZGnKsjGqHvTEI7A1f2ztDmgAPREOKLnx8FKAYB6w&oe=61E0B07B';
  final Production _production;
  final GlobalKey _optionsKey = GlobalKey();
  final Function onItemListener;

  ProductItem(this._production, this.onItemListener, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductItem();
  }
}

class _ProductItem extends BaseState<ProductItem> {
  void _showPopupMenu(Offset position) async {
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
        items: [
          PopupMenuItem(
            value: 0,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Delete"),
          ),
        ],
        elevation: 6
    );

    switch(result) {
      case 0: _onEditItem();
              break;
      case 1: _onDeleteItem();
              break;
    }
  }

  void _onEditItem() {
    pushScreenAndAwaitResult(AddProductScreen(widget._production), _onEditResult);
  }

  void _onEditResult(Production production) {
    widget.onItemListener(ProductActions(production, ProductionEvent.EDIT));
  }

  void _onDeleteItem() {
    widget.onItemListener(ProductActions(widget._production, ProductionEvent.DELETE));
  }

  void _updateFavorite(bool isFavorite) {
    setState(() {
      widget._production.isFavorite = isFavorite;
      widget.onItemListener(ProductActions(widget._production, ProductionEvent.FAVORITE));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 3,
          margin: EdgeInsets.only(top: 12, left: 12, right: 12),
          child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 3,
                        child: ClipRRect(
                          child: AspectRatio(
                              aspectRatio: 16/9,
                              child: Image.network(ProductItem.FB_AVATAR, fit: BoxFit.fill)
                          ),
                          borderRadius: BorderRadius.circular(6),
                        )
                    ),
                    Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                child: Text(widget._production.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis)
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                child: Text(widget._production.subTitle, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800), maxLines: 1, overflow: TextOverflow.ellipsis)
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                              child: Text(widget._production.name, style: TextStyle(fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                child: Text('Price: \$ ${widget._production.price}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic), maxLines: 1, overflow: TextOverflow.ellipsis)
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                child: InkWell(
                                  key: widget._optionsKey,
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    final box = widget._optionsKey.currentContext?.findRenderObject() as RenderBox;
                                    final position = box.localToGlobal(Offset.zero);
                                    _showPopupMenu(position);
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Image.asset('assets/images/icon_options.png', width: 24, height: 24)
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Material(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    setState(() {
                                      widget._production.updateFavorite();
                                      widget.onItemListener(ProductActions(widget._production, ProductionEvent.FAVORITE));
                                    });
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Icon(widget._production.isFavorite ? Icons.favorite : Icons.favorite_border, size: 18, color: Colors.pink)
                                  ),
                                ),
                              ),
                            ]
                        )
                    )
                  ],
                ),
              )
          )
      ),
      onTap: () {
        pushScreen(DetailProduct(widget._production, _updateFavorite));
      },
    );
  }
}