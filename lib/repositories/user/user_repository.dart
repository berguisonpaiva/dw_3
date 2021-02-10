import 'package:deliveri_api/application/database/i_database_connection.dart';
import 'package:deliveri_api/application/execeptions/database_error_exception.dart';
import 'package:deliveri_api/application/execeptions/user_not_foud_exception.dart';
import 'package:deliveri_api/entities/user.dart';

import 'package:deliveri_api/modules/users/view_models/register_input_model.dart';
import 'package:deliveri_api/modules/users/view_models/user_login_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnection _connection;

  UserRepository(this._connection);
  @override
  Future<void> saveUser(RegisterInputModel model) async {
    final conn = await _connection.openConnection();

    try {
      await conn.query('insert into usuario(nome,email,senha) values(?,?,?)',
          [model.name, model.email, model.password]);
    } on MySqlException catch (e, s) {
      print(s);
      throw DatabaseErrorException(message: 'Erro ao registrar usuario');
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<User> login(UserLoginModel viewModel) async {
    final conn = await _connection.openConnection();

    try {
      final result = await conn.query('''
     select *
     from usuario
     where email = ?
     and senha = ?
     ''', [viewModel.email, viewModel.password]);

      if (result.isEmpty) {
        throw UserNotFoudException();
      }
      final row = result.first;
      return User(
        id: row['id_usuario'] as int,
        name: row['nome'] as String,
        email: row['email'] as String,
        password: row['senha'] as String,
      );
    } on MySqlException catch (e, s) {
      print(s);
      throw DatabaseErrorException(message: 'Erro ao buscar usuario');
    } finally {
      await conn?.close();
    }
  }
}
