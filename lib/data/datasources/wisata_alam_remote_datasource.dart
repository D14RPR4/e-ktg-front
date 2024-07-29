import 'package:dartz/dartz.dart';
import 'package:e_ktg_mobile/core/constants/url.dart';
import 'package:e_ktg_mobile/data/model/request/comment/comment_alam_request_model.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/comment_alam_response_model.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/delete_comment_alam_response_model.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/get_comment_alam_response_model.dart';
import 'package:e_ktg_mobile/data/model/responses/like/like_alam_response_model.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_alam_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';

class WisataAlamRemoteDatasource {
  Future<Either<String, WisataAlamResponseModel>> getAllAlam() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse(alamUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(WisataAlamResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }

  Future<Either<String, LikeAlamResponseModel>> likePost(String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('$likeAlam/$postId/likes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(LikeAlamResponseModel.fromJson(response.body));
    } else {
      return const Left('Error, sesuatu salah');
    }
  }

  Future<Either<String, GetCommentAlamResponseModel>> getAllCommentAlam(
      String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('$getCommentAlamUrl/$postId/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(GetCommentAlamResponseModel.fromJson(response.body));
    } else {
      return const Left('get content gagal');
    }
  }

  Future<Either<String, CommentAlamResponseModel>> postCommentAlam(
      CommentAlamRequestModel commentAlamRequestModel, String postId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('$getCommentAlamUrl/$postId/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
      body: commentAlamRequestModel.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(CommentAlamResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, DeleteCommentAlamResponseModel>> deleteCommentAlam(
      String commentId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.delete(
      Uri.parse('$deleteCommentAlamUrl/$commentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(DeleteCommentAlamResponseModel.fromJson(response.body));
    } else {
      return Left('Error, sesuatu salah');
    }
  }
}
