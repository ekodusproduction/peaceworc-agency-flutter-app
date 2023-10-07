class CreateClientResponse {
  bool? success;
  String? message;
  List<Data>? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  CreateClientResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  CreateClientResponse.withError(String err): error = err;
  CreateClientResponse.fromJson(Map<String, dynamic> json) {
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
  int? agencyId;
  String? name;
  String? phone;
  String? email;
  String? gender;
  String? age;
  String? address;
  String? photo;
  String? shortAddress;
  String? street;
  String? appartmentOrUnit;
  String? floorNo;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? lat;
  String? long;

  Data(
      {this.agencyId,
        this.name,
        this.phone,
        this.email,
        this.gender,
        this.age,
        this.address,
        this.photo,
        this.shortAddress,
        this.street,
        this.appartmentOrUnit,
        this.floorNo,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.lat,
        this.long});

  Data.fromJson(Map<String, dynamic> json) {
    agencyId = json['agency_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
    address = json['address'];
    photo = json['photo'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agency_id'] = this.agencyId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['address'] = this.address;
    data['photo'] = this.photo;
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
    return data;
  }
}