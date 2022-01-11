
import 'package:exercise_example/events/production_event.dart';
import 'package:exercise_example/models/product.dart';

class ProductActions {
  final Production production;
  final ProductionEvent event;

  ProductActions(this.production, this.event);

  ProductActions.createAdded(this.production, this.event);
}