import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_resto_response_model.dart';

import 'package:http/http.dart' as http;
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';



class FasilitasRestoRemoteDatasource {
  Future<Either<String, FasilitasRestoResponseModel>> getAllResto() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(restolUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(FasilitasRestoResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }

  
}
