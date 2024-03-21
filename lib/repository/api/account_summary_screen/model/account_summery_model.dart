// To parse this JSON data, do
//
//     final accSummeryModel = accSummeryModelFromJson(jsonString);

import 'dart:convert';

AccSummeryModel accSummeryModelFromJson(String str) => AccSummeryModel.fromJson(json.decode(str));

String accSummeryModelToJson(AccSummeryModel data) => json.encode(data.toJson());

class AccSummeryModel {
    int? id;
    String? password;
    dynamic lastLogin;
    bool? isSuperuser;
    String? username;
    String? firstName;
    String? lastName;
    String? email;
    bool? isStaff;
    bool? isActive;
    DateTime? dateJoined;
    dynamic address;
    int? phone;
    dynamic mpin;
    int? accountNumber;
    String? ifsc;
    double? accountBalance;
    List<dynamic>? groups;
    List<dynamic>? userPermissions;

    AccSummeryModel({
        this.id,
        this.password,
        this.lastLogin,
        this.isSuperuser,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.isStaff,
        this.isActive,
        this.dateJoined,
        this.address,
        this.phone,
        this.mpin,
        this.accountNumber,
        this.ifsc,
        this.accountBalance,
        this.groups,
        this.userPermissions,
    });

    factory AccSummeryModel.fromJson(Map<String, dynamic> json) => AccSummeryModel(
        id: json["id"],
        password: json["password"],
        lastLogin: json["last_login"],
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: json["date_joined"] == null ? null : DateTime.parse(json["date_joined"]),
        address: json["address"],
        phone: json["phone"],
        mpin: json["mpin"],
        accountNumber: json["account_number"],
        ifsc: json["ifsc"],
        accountBalance: json["account_balance"]?.toDouble(),
        groups: json["groups"] == null ? [] : List<dynamic>.from(json["groups"]!.map((x) => x)),
        userPermissions: json["user_permissions"] == null ? [] : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined?.toIso8601String(),
        "address": address,
        "phone": phone,
        "mpin": mpin,
        "account_number": accountNumber,
        "ifsc": ifsc,
        "account_balance": accountBalance,
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
        "user_permissions": userPermissions == null ? [] : List<dynamic>.from(userPermissions!.map((x) => x)),
    };
}
