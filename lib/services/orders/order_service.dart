import 'package:deliveri_api/entities/order.dart';
import 'package:deliveri_api/modules/orders/view_models/save_order_input_model.dart';
import 'package:deliveri_api/repositories/orders/i_orders_repository.dart';
import 'package:injectable/injectable.dart';

import './i_orders_service.dart';

@LazySingleton(as: IOrdersService)
class OrderService implements IOrdersService {
  final IOrdersRepository _repository;

  OrderService(
    this._repository,
  );

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    await _repository.saveOrder(saveOrder);
  }

  @override
  Future<List<Order>> findMyOrders(int userId) async {
    return await _repository.findMyOrders(userId);
  }
}
