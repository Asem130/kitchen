import 'package:kitchen/data/network/app_api.dart';
import 'package:kitchen/data/network/requestes.dart';
import 'package:kitchen/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
 final   AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return _appServiceClient.login(loginRequest.email, loginRequest.password);
  }
}
