import 'package:dartz/dartz.dart';
import 'package:kitchen/data/network/failure.dart';
import 'package:kitchen/data/network/requestes.dart';
import 'package:kitchen/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> Login(LoginRequest loginRequest);
}
