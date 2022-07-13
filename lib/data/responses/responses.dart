import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';
@JsonSerializable()
class BaseResponse{
  @JsonKey(name:"status")
  int? status;
  @JsonKey(name:"message")
  String? message ;

}
@JsonSerializable()
class UserResponse{
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name:"name")
  String? name ;
  @JsonKey(name:"notifications")
  int? notifications;
  UserResponse({this.id, this.name, this.notifications});
  factory UserResponse.fromJson(Map<String,dynamic>json)
  =>_$UserResponseFromJson(json);
  Map<String ,dynamic>toJson()=>_$UserResponseToJson(this);
}
@JsonSerializable()
class ContactsResponse{
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"phone")
  String? phone ;
  @JsonKey(name:"link")
  String? link;
  ContactsResponse({this.email, this.link, this.phone});
  factory ContactsResponse.fromJson(Map<String,dynamic>json)
  =>_$ContactsResponseFromJson(json);
  Map<String ,dynamic>toJson()=>_$ContactsResponseToJson(this);
}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name:"user")
  UserResponse? user;
  @JsonKey(name:"contacts")
  ContactsResponse? contacts ;

  AuthenticationResponse({this.user, this.contacts});
   factory AuthenticationResponse.fromJson(Map<String,dynamic>json)
  =>_$AuthenticationResponseFromJson(json);
   Map<String ,dynamic>toJson()=>_$AuthenticationResponseToJson(this);
}