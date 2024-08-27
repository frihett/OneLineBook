// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String?,
      userName: json['userName'] as String,
      email: json['email'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String,
      currentReadingBookList: (json['currentReadingBookList'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      likedReviewList: (json['likedReviewList'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewList: (json['reviewList'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'profilePictureUrl': instance.profilePictureUrl,
          'currentReadingBookList': instance.currentReadingBookList?.map((e) => e.toJson()).toList(),
          'likedReviewList': instance.likedReviewList?.map((e) => e.toJson()).toList(),
          'reviewList': instance.reviewList?.map((e) => e.toJson()).toList(),
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
