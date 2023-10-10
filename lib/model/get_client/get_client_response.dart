class GetClientResponse {
  bool? success;
  String? message;
  List<Data>? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  GetClientResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  GetClientResponse.withError(String err):error = err;
  GetClientResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['http_status_code'] = this.httpStatusCode;
    return data;
  }
}

class Data {
  int? id;
  int? agencyId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? photo;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.agencyId,
        this.name,
        this.phone,
        this.email,
        this.address,
        this.photo,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    photo = json['photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_id'] = this.agencyId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}