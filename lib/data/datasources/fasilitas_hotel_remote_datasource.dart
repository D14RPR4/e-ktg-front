import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_hotel_response_model.dart';

import 'package:http/http.dart' as http;
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';

import '../model/request/comment/comment_fasilitas_request_model.dart';
import '../model/responses/comment/comment_fasilitas_response_model.dart';
import '../model/responses/comment/delete_comment_fasilitas_response_model.dart';
import '../model/responses/comment/get_comment_fasilitas_response_model.dart';
import '../model/responses/like/like_fasilitas_response_model.dart';

class FasilitasHotelRemoteDatasource {
  Future<Either<String, FasilitasHotelResponseModel>> getAllHotel() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(hotelUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(FasilitasHotelResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }

  Future<Either<String, LikeHotelResponseModel>> likePost(String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('$likeHotel/$postId/likes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(LikeHotelResponseModel.fromJson(response.body));
    } else {
      return const Left('Error, sesuatu salah');
    }
  }

  Future<Either<String, GetCommentHotelResponseModel>> getAllCommentHotel(
      String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('$getCommentHotelUrl/$postId/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetCommentHotelResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }

  Future<Either<String, CommentHotelResponseModel>> postCommentHotel(
      CommentHotelRequestModel commentHotelRequestModel, String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('$getCommentHotelUrl/$postId/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
      body: commentHotelRequestModel.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(CommentHotelResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, DeleteCommentHotelResponseModel>> deleteCommentHotel(
      String commentId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.delete(
      Uri.parse('$deleteCommentHotelUrl/$commentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(DeleteCommentHotelResponseModel.fromJson(response.body));
    } else {
      return Left('Error, sesuatu salah');
    }
  }
}
