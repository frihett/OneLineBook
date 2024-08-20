// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikedReviewImpl _$$LikedReviewImplFromJson(Map<String, dynamic> json) =>
    _$LikedReviewImpl(
      likedReviewId: json['likedReviewId'] as String,
      reviewId: json['reviewId'] as String,
      userId: json['userId'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$LikedReviewImplToJson(_$LikedReviewImpl instance) =>
    <String, dynamic>{
      'likedReviewId': instance.likedReviewId,
      'reviewId': instance.reviewId,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
    };
