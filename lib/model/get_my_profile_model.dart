// To parse this JSON data, do
//
//     final getMyProfileResponse = getMyProfileResponseFromMap(jsonString);

import 'dart:convert';

GetMyProfileResponse getMyProfileResponseFromMap(String str) => GetMyProfileResponse.fromMap(json.decode(str));

String getMyProfileResponseToMap(GetMyProfileResponse data) => json.encode(data.toMap());

class GetMyProfileResponse {
  GetMyProfile getMyProfile;

  GetMyProfileResponse({
    required this.getMyProfile,
  });

  factory GetMyProfileResponse.fromMap(Map<String, dynamic> json) => GetMyProfileResponse(
    getMyProfile: GetMyProfile.fromMap(json["getMyProfile"]),
  );

  Map<String, dynamic> toMap() => {
    "getMyProfile": getMyProfile.toMap(),
  };
}

class GetMyProfile {
  int code;
  bool error;
  String message;
  GetMyProfileData data;

  GetMyProfile({
    required this.code,
    required this.error,
    required this.message,
    required this.data,
  });

  factory GetMyProfile.fromMap(Map<String, dynamic> json) => GetMyProfile(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    data: GetMyProfileData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "error": error,
    "message": message,
    "data": data.toMap(),
  };
}

class GetMyProfileData {
  String email;
  String firstName;
  dynamic institutionName;
  dynamic institutionAcronym;
  String lastName;
  dynamic phone;
  dynamic profileUrl;
  List<Permission> role;
  List<Permission> permissions;

  GetMyProfileData({
    required this.email,
    required this.firstName,
    required this.institutionName,
    required this.institutionAcronym,
    required this.lastName,
    required this.phone,
    required this.profileUrl,
    required this.role,
    required this.permissions,
  });

  factory GetMyProfileData.fromMap(Map<String, dynamic> json) => GetMyProfileData(
    email: json["email"],
    firstName: json["firstName"],
    institutionName: json["institutionName"],
    institutionAcronym: json["institutionAcronym"],
    lastName: json["lastName"],
    phone: json["phone"],
    profileUrl: json["profileUrl"],
    role: List<Permission>.from(json["role"].map((x) => Permission.fromMap(x))),
    permissions: List<Permission>.from(json["permissions"].map((x) => Permission.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "firstName": firstName,
    "institutionName": institutionName,
    "institutionAcronym": institutionAcronym,
    "lastName": lastName,
    "phone": phone,
    "profileUrl": profileUrl,
    "role": List<dynamic>.from(role.map((x) => x.toMap())),
    "permissions": List<dynamic>.from(permissions.map((x) => x.toMap())),
  };
}

class Permission {
  int id;
  String uuid;
  String name;
  String displayName;

  Permission({
    required this.id,
    required this.uuid,
    required this.name,
    required this.displayName,
  });

  factory Permission.fromMap(Map<String, dynamic> json) => Permission(
    id: json["id"],
    uuid: json["uuid"],
    name: json["name"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "uuid": uuid,
    "name": name,
    "displayName": displayName,
  };
}
