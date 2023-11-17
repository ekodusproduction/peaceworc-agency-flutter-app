class CreateJobResponse {
  bool? success;
  String? message;
  Data? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  CreateJobResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  CreateJobResponse.withError(String err): error = err;
  CreateJobResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['http_status_code'] = this.httpStatusCode;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? clientId;
  String? title;
  String? careType;
  List<CareItems>? careItems;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? amount;
  String? address;
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
  String? description;
  //List<dynamic>? medicalHistory;
  //List<dynamic>? expertise;
  //List<dynamic>? otherRequirements;
  //List<dynamic>? checkList;
  String? status;
  String? jobType;
  dynamic? biddingStartTime;
  dynamic? biddingEndTime;
  int? paymentStatus;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Data(
      {this.id,
        this.userId,
        this.clientId,
        this.title,
        this.careType,
        this.careItems,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.amount,
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
        this.description,
        //this.medicalHistory,
        //this.expertise,
        //this.otherRequirements,
        //this.checkList,
        this.status,
        this.jobType,
        this.biddingStartTime,
        this.biddingEndTime,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    title = json['title'];
    careType = json['care_type'];
    if (json['care_items'] != null) {
      careItems = <CareItems>[];
      json['care_items'].forEach((v) {
        careItems!.add(new CareItems.fromJson(v));
      });
    }
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    amount = json['amount'];
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
    description = json['description'];
    //medicalHistory = json['medical_history'] as List<dynamic>;
    //expertise = json['expertise'] as List<dynamic>?;
    //otherRequirements = json['other_requirements'] as List<dynamic>?;
    //checkList = json['check_list'] as List<dynamic>?;
    status = json['status'];
    jobType = json['job_type'];
    biddingStartTime = json['bidding_start_time'];
    biddingEndTime = json['bidding_end_time'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['title'] = this.title;
    data['care_type'] = this.careType;
    if (this.careItems != null) {
      data['care_items'] = this.careItems!.map((v) => v.toJson()).toList();
    }
    data['start_date'] = this.startDate;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
    data['end_time'] = this.endTime;
    data['amount'] = this.amount;
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
    data['description'] = this.description;
    //data['medical_history'] = this.medicalHistory;
    //data['expertise'] = this.expertise;
    //data['other_requirements'] = this.otherRequirements;
    //data['check_list'] = this.checkList;
    data['status'] = this.status;
    data['job_type'] = this.jobType;
    data['bidding_start_time'] = this.biddingStartTime;
    data['bidding_end_time'] = this.biddingEndTime;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class CareItems {
  String? age;
  String? gender;
  String? patientName;

  CareItems({this.age, this.gender, this.patientName});

  CareItems.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    patientName = json['patient_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['patient_name'] = this.patientName;
    return data;
  }
}