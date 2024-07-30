import 'package:dio/dio.dart';
import 'package:kitchen/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handel(dynamic error) {
    if (error is DioException) {
    } else {
      failure = DataSource.Defult.getFailure();
    }
  }
  Failure _handelError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.Defult.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusMessage != null &&
            error.response?.statusCode != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.Defult.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioExceptionType.unknown:
        return DataSource.Defult.getFailure();
    }
  }
}

enum DataSource {
  SUCSSES,
  NO_CONTENT,
  BAD_REQUIEST,
  FORBIDDEN,
  UNAUTHORISEDM,
  NOT_FOUND,
  INRENAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  Defult
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCSSES:
        return Failure(ResponseCode.SUCSSES, ResponseMessage.SUCSSES);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUIEST:
        return Failure(ResponseCode.BAD_REQUIEST, ResponseMessage.BAD_REQUIEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISEDM:
        return Failure(
            ResponseCode.UNAUTHORISEDM, ResponseMessage.UNAUTHORISEDM);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INRENAL_SERVER_ERROR:
        return Failure(ResponseCode.INRENAL_SERVER_ERROR,
            ResponseMessage.INRENAL_SERVER_ERROR);
      case DataSource.CONNECTION_TIMEOUT:
        return Failure(ResponseCode.CONNECTION_TIMEOUT,
            ResponseMessage.CONNECTION_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CASHE_ERROR:
        return Failure(ResponseCode.CASHE_ERROR, ResponseMessage.CASHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.Defult:
        return Failure(ResponseCode.Defult, ResponseMessage.Defult);
    }
  }
}

class ResponseCode {
  static const int SUCSSES = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUIEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORISEDM = 401;
  static const int INRENAL_SERVER_ERROR = 500;
  static const int NOT_FOUND = 404;
// local status code
  static const int CONNECTION_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int Defult = -7;
}

class ResponseMessage {
  static const String SUCSSES = "Succsses";
  static const String NO_CONTENT = "Succsses";
  static const String BAD_REQUIEST = "Bad Requiest, Try again later";
  static const String FORBIDDEN = "ForBidden Requiest, Try again later";
  static const String UNAUTHORISEDM = "User unautharised, Try again later";
  static const String INRENAL_SERVER_ERROR =
      "Some thing went wrong, Try again later";
  static const String NOT_FOUND = 'Failure , not found';
// local status code
  static const String CONNECTION_TIMEOUT = "Timeout Error, Try again later ";
  static const String CANCEL = "Requiset was canceled, Try again later";
  static const String RECIEVE_TIMEOUT = "Timeout Error, Try again later ";
  static const String SEND_TIMEOUT = "Timeout Error, Try again later ";
  static const String CASHE_ERROR = "Cashe Error, Try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check your internet connection";
  static const String Defult = "Some thing went wrong, Try again later";
}

class ApiInternalStatusCode {
  static const int Succsses = 0;
  static const int failure = 1;
}
