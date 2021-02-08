import 'package:deliveri_api/application/routers/i_router_configure.dart';
import 'package:shelf_router/src/router.dart';

import 'controller/user_controller.dart';

class UsersRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/user/', UserController().router);
  }
}
