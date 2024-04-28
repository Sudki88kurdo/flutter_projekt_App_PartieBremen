import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

/// Represents the type of network exceptions that might occur during the usage
/// of the app
@freezed
class NetworkExceptions with _$NetworkExceptions {
  /// The request is cancelled
  const factory NetworkExceptions.requestCancelled({DioException? error}) =
      RequestCancelled;

  /// User is not authorized to do the request
  const factory NetworkExceptions.unauthorizedRequest({DioException? error}) =
      UnauthorizedRequest;

  /// Bad request
  const factory NetworkExceptions.badRequest({
    DioException? error,
  }) = BadRequest;

  /// The path of the request was not found
  const factory NetworkExceptions.notFound(
    String reason, {
    DioException? error,
  }) = NotFound;

  /// Method is not allowed
  const factory NetworkExceptions.methodNotAllowed({DioException? error}) =
      MethodNotAllowed;

  /// Not acceptable
  const factory NetworkExceptions.notAcceptable({DioException? error}) =
      NotAcceptable;

  /// Requested timeout
  const factory NetworkExceptions.requestTimeout({DioException? error}) =
      RequestTimeout;

  /// Send a timeout
  const factory NetworkExceptions.sendTimeout({
    DioException? error,
  }) = SendTimeout;

  /// On conflict
  const factory NetworkExceptions.conflict({DioException? error}) = Conflict;

  /// Internal server error
  const factory NetworkExceptions.internalServerError({DioException? error}) =
      InternalServerError;

  /// Not implemented
  const factory NetworkExceptions.notImplemented({DioException? error}) =
      NotImplemented;

  /// Service is unavailable
  const factory NetworkExceptions.serviceUnavailable({DioException? error}) =
      ServiceUnavailable;

  /// User has not internet connection
  const factory NetworkExceptions.noInternetConnection({DioException? error}) =
      NoInternetConnection;

  /// The request has a format issue
  const factory NetworkExceptions.formatException({DioException? error}) =
      FormatException;

  /// Unable to process the request/response
  const factory NetworkExceptions.unableToProcess({DioException? error}) =
      UnableToProcess;

  /// Default error
  const factory NetworkExceptions.defaultError(
    String error, {
    DioException? dioError,
  }) = DefaultError;

  /// An unexpected error appeared
  const factory NetworkExceptions.unexpectedError({DioException? error}) =
      UnexpectedError;

  /// Handles the response of the server
  static NetworkExceptions handleResponse(
    int? statusCode, {
    DioException? error,
  }) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(error: error);
      case 404:
        return NetworkExceptions.notFound('Not found', error: error);
      case 409:
        return NetworkExceptions.conflict(error: error);
      case 408:
        return NetworkExceptions.requestTimeout(error: error);
      case 422:
        return NetworkExceptions.unableToProcess(error: error);
      case 500:
        return NetworkExceptions.internalServerError(error: error);
      case 503:
        return NetworkExceptions.serviceUnavailable(error: error);
      default:
        final responseCode = statusCode;
        return NetworkExceptions.defaultError(
          'Received invalid status code: $responseCode',
          dioError: error,
        );
    }
  }

  /// Returns the dio exception
  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          return switch (error.type) {
            DioExceptionType.cancel =>
              NetworkExceptions.requestCancelled(error: error),
            DioExceptionType.connectionTimeout =>
              NetworkExceptions.requestTimeout(error: error),
            DioExceptionType.receiveTimeout =>
              NetworkExceptions.sendTimeout(error: error),
            DioExceptionType.badResponse => NetworkExceptions.handleResponse(
                error.response?.statusCode,
                error: error,
              ),
            DioExceptionType.sendTimeout => NetworkExceptions.handleResponse(
                error.response?.statusCode,
                error: error,
              ),
            DioExceptionType.badCertificate =>
              NetworkExceptions.unableToProcess(error: error), // TODO:
            DioExceptionType.connectionError =>
              NetworkExceptions.noInternetConnection(error: error),
            DioExceptionType.unknown => NetworkExceptions.defaultError(
                error.message ?? "",
                dioError: error,
              ),
          };
        } else if (error is SocketException) {
          return const NetworkExceptions.noInternetConnection();
        } else {
          return const NetworkExceptions.unexpectedError();
        }
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  /// Returns the error message
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    // Get Dio Error
    var err = getDioError(networkExceptions);

    // Get Translated Error Message Key
    var string =  networkExceptions.when(
      notImplemented: (err) => 'ERROR.GENERAL',
      requestCancelled: (err) => 'ERROR.REQUEST_CANCELLED',
      internalServerError: (err) => 'ERROR.SERVER_ERROR',
      notFound: (String reason, err) => 'ERROR.NOT_FOUND',
      serviceUnavailable: (err) => 'ERROR.SERVICE_UNAVAILABLE',
      methodNotAllowed: (err) => 'ERROR.METHOD_NOT_ALLOWED',
      badRequest: (err) => 'ERROR.BAD_REQUEST',
      unauthorizedRequest: (err) => 'ERROR.UNAUTHORIZED',
      unexpectedError: (err) => 'ERROR.GENERAL',
      requestTimeout: (err) => 'ERROR.REQUEST_TIMEOUT',
      noInternetConnection: (err) => 'ERROR.NO_INTERNET_CONNECTION',
      conflict: (err) => 'ERROR.CONFLICT',
      sendTimeout: (err) => 'ERROR.SEND_TIMEOUT',
      unableToProcess: (err) => 'ERROR.UNABLE_TO_PROCESS',
      defaultError: (String error, _) => error,
      formatException: (err) => 'ERROR.FORMAT_EXCEPTION',
      notAcceptable: (err) => 'ERROR.NOT_ACCEPTABLE',
    );

    // Translate the message and add the error code
    return string.tr(
      namedArgs: {
        'reason': err?.message ?? "",
        'status': err?.response?.statusCode.toString() ?? "GENERAL.UNKNOWN".tr(),
      },
    );
  }

  static DioException? getDioError(NetworkExceptions networkExceptions) {
    return networkExceptions.whenOrNull(
      notImplemented: (e) => e,
      requestCancelled: (e) => e,
      internalServerError: (e) => e,
      notFound: (String reason, e) => e,
      serviceUnavailable: (e) => e,
      methodNotAllowed: (e) => e,
      badRequest: (e) => e,
      unauthorizedRequest: (e) => e,
      unexpectedError: (e) => e,
      requestTimeout: (e) => e,
      noInternetConnection: (e) => e,
      conflict: (e) => e,
      sendTimeout: (e) => e,
      unableToProcess: (e) => e,
      defaultError: (String error, e) => e,
      formatException: (e) => e,
      notAcceptable: (e) => e,
    );
  }
}
