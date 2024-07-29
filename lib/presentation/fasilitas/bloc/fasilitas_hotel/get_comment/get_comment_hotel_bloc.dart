import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/get_comment_fasilitas_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_comment_hotel_event.dart';
part 'get_comment_hotel_state.dart';
part 'get_comment_hotel_bloc.freezed.dart';

class GetCommentHotelBloc
    extends Bloc<GetCommentHotelEvent, GetCommentHotelState> {
  final FasilitasHotelRemoteDatasource fasilitasHotelRemoteDatasource;
  GetCommentHotelBloc(this.fasilitasHotelRemoteDatasource)
      : super(const GetCommentHotelState.initial()) {
    on<GetCommentHotelEvent>((event, emit) async {
      await event.when(
          started: () async {},
          getAllCommentHotel: (postId) async {
            emit(const GetCommentHotelState.loading());
            final eitherResponse =
                await fasilitasHotelRemoteDatasource.getAllCommentHotel(postId);
            eitherResponse.fold(
              (failure) => emit(GetCommentHotelState.error(failure)),
              (success) => emit(GetCommentHotelState.success(success)),
            );
          });
    });
  }
}
