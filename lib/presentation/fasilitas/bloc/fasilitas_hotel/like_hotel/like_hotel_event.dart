part of 'like_hotel_bloc.dart';

@freezed
class LikeHotelEvent with _$LikeHotelEvent {
  const factory LikeHotelEvent.started() = _Started;
  const factory LikeHotelEvent.like(String postId) = _Like;
}
