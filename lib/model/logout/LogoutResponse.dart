/// success : true
/// message : "Great! OTP Verified. SignUp Successful."
/// data : null
/// token : "2|kWPTDFMMX49IUpHWxrVL7UwHsFPCgGdxW9T1TTuL"
/// http_status_code : 201

class LogoutResponse {
  bool? success;
  String? message;
  Null? data;
  String? token;
  int? httpStatusCode;
  String? error;

  LogoutResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  LogoutResponse.withError(String err): error = err;
  LogoutResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data;
    data['token'] = this.token;
    data['http_status_code'] = this.httpStatusCode;
    return data;
  }
}