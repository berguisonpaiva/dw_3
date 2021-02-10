import 'package:deliveri_api/entities/menu.dart';

abstract class IMenuService {
  Future<List<Menu>> getAllMenus();
}
