import 'package:dartz/dartz.dart';
import 'package:kitchen/data/data_source/remote_data_source.dart';
import 'package:kitchen/data/mapper/mapper.dart';
import 'package:kitchen/data/network/error_handler.dart';
import 'package:kitchen/data/network/failure.dart';
import 'package:kitchen/data/network/network_info.dart';
import 'package:kitchen/data/network/requestes.dart';
import 'package:kitchen/domain/models/models.dart';
import 'package:kitchen/domain/repository/repository.dart';

class RepositortImpl implements Repository {
  final NetworkInfoImpl _networkInfoImpl;
  final RemoteDataSource _remoteDataSource;
  RepositortImpl(this._networkInfoImpl, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> Login(
      LoginRequest loginRequest) async {
    if (await _networkInfoImpl.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatusCode.Succsses) {
          return right(response.toDomain());
        } else {
          return left(Failure(ApiInternalStatusCode.failure,
              response.message ?? ResponseMessage.Defult));
        }
      } catch (error) {
        return left(ErrorHandler.handel(error).failure);
      }
    } else {
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
