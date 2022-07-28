// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

class Profile {
    Profile({
        this.success,
        this.data,
    });

    bool ?success;
    Data ?data;

    factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        success: json["success"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.toMap(),
    };
}

class Data {
    Data({
        this.userId,
        this.username,
        this.name,
        this.email,
        this.picture,
        this.description,
        this.mobile,
        this.address,
        this.pincode,
        this.accessToken,
        this.tokenExpiry,
        this.socialUniqueId,
        this.loginBy,
        this.userStatus,
        this.isVerified,
        this.deviceType,
        this.deviceToken,
    });

    String ?userId;
    dynamic username;
    String ?name;
    String ?email;
    String ?picture;
    String ?description;
    String ?mobile;
    dynamic address;
    dynamic pincode;
    String ?accessToken;
    String ?tokenExpiry;
    String ?socialUniqueId;
    String ?loginBy;
    int ?userStatus;
    int ?isVerified;
    String ?deviceType;
    String ?deviceToken;

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        picture: json["picture"],
        description: json["description"],
        mobile: json["mobile"],
        address: json["address"],
        pincode: json["pincode"],
        accessToken: json["access_token"],
        tokenExpiry: json["token_expiry"],
        socialUniqueId: json["social_unique_id"],
        loginBy: json["login_by"],
        userStatus: json["user_status"],
        isVerified: json["is_verified"],
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "username": username,
        "name": name,
        "email": email,
        "picture": picture,
        "description": description,
        "mobile": mobile,
        "address": address,
        "pincode": pincode,
        "access_token": accessToken,
        "token_expiry": tokenExpiry,
        "social_unique_id": socialUniqueId,
        "login_by": loginBy,
        "user_status": userStatus,
        "is_verified": isVerified,
        "device_type": deviceType,
        "device_token": deviceToken,
    };
}
