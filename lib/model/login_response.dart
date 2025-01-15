class User {
  int? statusCode;
  Data? data;
  String? message;

  User({this.statusCode, this.data, this.message});

  User.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<String>? following;
  List<String>? followers;
  String? sId;
  String? userName;
  String? password;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? countryCode;
  String? emailOtp;
  bool? isPhoneNumberVerified;
  bool? isEmailVerified;
  int? termsOfUseAccepted;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otpExpiry;

  Data(
      {this.following,
        this.followers,
        this.sId,
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
        this.otpExpiry});

  Data.fromJson(Map<String, dynamic> json) {
    following = json['following'].cast<String>();
    followers = json['followers'].cast<String>();
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
    otpExpiry = json['otp_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following'] = this.following;
    data['followers'] = this.followers;
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
    data['otp_expiry'] = this.otpExpiry;
    return data;
  }
}
