import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/delete_comment_fasilitas_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_comment_hotel_event.dart';
part 'delete_comment_hotel_state.dart';
part 'delete_comment_hotel_bloc.freezed.dart';

class DeleteCommentHotelBloc
    extends Bloc<DeleteCommentHotelEvent, DeleteCommentHotelState> {
  final FasilitasHotelRemoteDatasource fasilitasHotelRemoteDatasource;
  DeleteCommentHotelBloc(this.fasilitasHotelRemoteDatasource)
      : super(DeleteCommentHotelState.initial()) {
    on<DeleteCommentHotelEvent>((event, emit) async {
      await event.when(
          started: () async {},
          deleteCommentHotel: (commentId) async {
            emit(const DeleteCommentHotelState.loading());
            final eitherResponse = await fasilitasHotelRemoteDatasource
                .deleteCommentHotel(commentId);
            eitherResponse.fold((l) => emit(DeleteCommentHotelState.error(l)),
                (r) => emit(DeleteCommentHotelState.success(r)));
          });
    });
  }
}
