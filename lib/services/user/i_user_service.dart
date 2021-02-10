import 'package:deliveri_api/entities/user.dart';
import 'package:deliveri_api/modules/users/view_models/register_input_model.dart';
import 'package:deliveri_api/modules/users/view_models/user_login_model.dart';

abstract class IUserService {
  Future<void> register(RegisterInputModel inputModel);
  Future<User> login(UserLoginModel viewModel);
}
