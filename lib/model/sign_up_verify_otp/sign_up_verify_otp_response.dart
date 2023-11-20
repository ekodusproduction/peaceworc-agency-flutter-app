class SignUpVerifyOtpResponse {
  bool? success;
  String? message;
  int? data;
  String? token;
  int? httpStatusCode;
  String? error;

  SignUpVerifyOtpResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});
  SignUpVerifyOtpResponse.withError(String err): error = err;
  SignUpVerifyOtpResponse.fromJson(Map<String, dynamic> json) {
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