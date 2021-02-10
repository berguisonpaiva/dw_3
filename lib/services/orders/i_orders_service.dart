import 'package:deliveri_api/entities/order.dart';
import 'package:deliveri_api/modules/orders/view_models/save_order_input_model.dart';

abstract class IOrdersService {
  Future<void> saveOrder(SaveOrderInputModel saveOrder);
  Future<List<Order>> findMyOrders(int userId);
}
