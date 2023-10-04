class SearchClientResponse {
  bool? success;
  String? message;
  List<Data>? data;
  Null? token;
  int? httpStatusCode;
  String? error;

  SearchClientResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  SearchClientResponse.withError(String err): error = err;
  SearchClientResponse.fromJson(Map<String, dynamic> json) {
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
  String? gender;
  String? age;
  String? address;
  String? shortAddress;
  String? street;
  Null? appartmentOrUnit;
  Null? floorNo;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? lat;
  String? long;
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
        this.gender,
        this.age,
        this.address,
        this.shortAddress,
        this.street,
        this.appartmentOrUnit,
        this.floorNo,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.lat,
        this.long,
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
    gender = json['gender'];
    age = json['age'];
    address = json['address'];
    shortAddress = json['short_address'];
    street = json['street'];
    appartmentOrUnit = json['appartment_or_unit'];
    floorNo = json['floor_no'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
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
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['address'] = this.address;
    data['short_address'] = this.shortAddress;
    data['street'] = this.street;
    data['appartment_or_unit'] = this.appartmentOrUnit;
    data['floor_no'] = this.floorNo;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}