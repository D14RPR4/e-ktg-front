import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/auth_login_request_model.dart';
import 'package:e_ktg_mobile/data/model/request/auth_register_request_model.dart';
import 'package:e_ktg_mobile/data/model/request/auth_validate_request_model.dart';
import 'package:e_ktg_mobile/data/model/responses/auth_validate_response_model.dart';
import 'package:http/http.dart' as http;

import '../model/responses/auth_response_model.dart';

class AuthRemoteDatasource {
  String apiKey = '7ac93740b3c74445fceb71e705faacac';
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'api-key': apiKey, // Menambahkan API key ke header
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left(
          'Register gagal, pastikan sudah mengisi formulir dengan benar');
    }
  }

  Future<Either<String, ValidateResponseModel>> validate(
      ValidateRequestModel validateRequestModel) async {
    final response = await http.post(
      Uri.parse(validateUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: validateRequestModel.toJson(),
    );
    if (response.statusCode == 404) {
      return Right(ValidateResponseModel.fromJson(response.body));
    } else {
      return const Left(
          'Verifikasi gagal, Email salah atau Email sudah di gunakan ');
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse(logoutUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return const Right('logout berhasil');
    } else {
      return const Left('logout gagal');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final response = await http.post(Uri.parse(logintUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data.toJson());

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('login gagal, periksa Email & Password');
    }
  }
}
