// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserClient implements UserClient {
  _UserClient(this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<User>> registerUser({
    required String name,
    required String surname,
    required DateTime dob,
    required String email,
    required String password,
    required bool verified,
    required bool active,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'name': name,
      'surname': surname,
      'dob': dob,
      'email': email,
      'password': password,
      'verified': verified,
      'active': active,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HttpResponse<User>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
      _dio.options,
      '/user',
      queryParameters: queryParameters,
      data: _data,
    )
        .copyWith(
        baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = User.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<User>> loginUser({
    required String email,
    required String password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HttpResponse<User>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
      _dio.options,
      '/user/login',
      queryParameters: queryParameters,
      data: _data,
    )
        .copyWith(
        baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = User.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl,
      String? baseUrl,) {
    if (baseUrl == null || baseUrl
        .trim()
        .isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<HttpResponse<User>> updateUser(int userId, {
    String? name,
    String? surname,
    DateTime? dob,
    String? email,
    String? password
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (dob != null) 'dob': dob,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<HttpResponse<User>>(
        Options(
          method: 'PUT',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          '/user/$userId',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(
          baseUrl: _combineBaseUrls(
            _dio.options.baseUrl,
            baseUrl,
          ),
        ),
      ),
    );
    {
      // TODO: implement updateUser
      throw UnimplementedError();
    }
  }
}



