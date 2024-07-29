import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:http/http.dart' as http;
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/responses/desa_response_model.dart';

class DesaRemoteDatasource {
  //get content by id
  Future<Either<String, DesaWisataResponseModel>> getAllDesa() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(desaUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(DesaWisataResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }
}