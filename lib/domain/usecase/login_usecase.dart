import 'package:dartz/dartz.dart';
import 'package:kitchen/data/network/failure.dart';
import 'package:kitchen/data/network/requestes.dart';
import 'package:kitchen/domain/models/models.dart';
import 'package:kitchen/domain/repository/repository.dart';
import 'package:kitchen/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> excute(
      LoginUseCaseInput input) async {
    return await _repository.Login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
