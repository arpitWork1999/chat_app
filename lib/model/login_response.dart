class User {
  int? statusCode;
  Data? data;
  String? token;
  String? message;

  User({this.statusCode, this.data, this.token, this.message});

  User.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? userName;
  String? password;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? countryCode;
  Null? emailOtp;
  bool? isPhoneNumberVerified;
  bool? isEmailVerified;
  int? termsOfUseAccepted;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? followersCount;
  int? followingCount;
  Null? otpExpiry;
  NotificationPreferenceData? notificationPreferenceData;

  Data(
      {this.sId,
        this.userName,
        this.password,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.countryCode,
        this.emailOtp,
        this.isPhoneNumberVerified,
        this.isEmailVerified,
        this.termsOfUseAccepted,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.followersCount,
        this.followingCount,
        this.otpExpiry,
        this.notificationPreferenceData});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    password = json['password'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    countryCode = json['country_code'];
    emailOtp = json['email_otp'];
    isPhoneNumberVerified = json['is_phone_number_verified'];
    isEmailVerified = json['is_email_verified'];
    termsOfUseAccepted = json['terms_of_use_accepted'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    otpExpiry = json['otp_expiry'];
    notificationPreferenceData = json['notificationPreferenceData'] != null
        ? new NotificationPreferenceData.fromJson(
        json['notificationPreferenceData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['country_code'] = this.countryCode;
    data['email_otp'] = this.emailOtp;
    data['is_phone_number_verified'] = this.isPhoneNumberVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['terms_of_use_accepted'] = this.termsOfUseAccepted;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['otp_expiry'] = this.otpExpiry;
    if (this.notificationPreferenceData != null) {
      data['notificationPreferenceData'] =
          this.notificationPreferenceData!.toJson();
    }
    return data;
  }
}

class NotificationPreferenceData {
  String? sId;
  String? userId;
  bool? ratingNotification;
  bool? newComment;
  bool? addNewRecipe;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationPreferenceData(
      {this.sId,
        this.userId,
        this.ratingNotification,
        this.newComment,
        this.addNewRecipe,
        this.createdAt,
        this.updatedAt,
        this.iV});

  NotificationPreferenceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    ratingNotification = json['rating_notification'];
    newComment = json['new_comment'];
    addNewRecipe = json['add_new_recipe'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['rating_notification'] = this.ratingNotification;
    data['new_comment'] = this.newComment;
    data['add_new_recipe'] = this.addNewRecipe;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
