import 'package:deliveri_api/application/modules/users/users_router.dart';
import 'package:deliveri_api/application/routers/i_router_configure.dart';
import 'package:shelf_router/src/router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [
    UsersRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => routers.forEach((r) => r.configure(_router));
}
