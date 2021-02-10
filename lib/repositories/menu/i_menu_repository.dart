import 'package:deliveri_api/entities/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> findAll();
}
