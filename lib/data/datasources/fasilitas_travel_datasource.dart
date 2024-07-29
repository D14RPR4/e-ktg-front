import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_travel_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';

class FasilitasTravelRemoteDatasource {
  Future<Either<String, FasilitasTravelResponseModel>> getAllTravel() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(travelUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(FasilitasTravelResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }
}
