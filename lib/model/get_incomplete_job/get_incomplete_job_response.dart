class GetInCompletedJobsResponse {
  bool? success;
  String? message;
  List<Data>? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  GetInCompletedJobsResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  GetInCompletedJobsResponse.withError(String err):error = err;
  GetInCompletedJobsResponse.fromJson(Map<String, dynamic?> json) {
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
}

class Data {
  int? jobId;
  JobAcceptedBy? jobAcceptedBy;
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
  String? description;
  List<Null>? medicalHistory;
  List<Null>? expertise;
  List<Null>? otherRequirements;
  List<Null>? checkList;
  String? status;

  Data(
      {this.jobId,
        this.jobAcceptedBy,
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
        this.description,
        this.medicalHistory,
        this.expertise,
        this.otherRequirements,
        this.checkList,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobAcceptedBy = json['job_accepted_by'] != null
        ? new JobAcceptedBy.fromJson(json['job_accepted_by'])
        : null;
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
    description = json['description'];
    medicalHistory = json['medical_history'].cast<String>();
    expertise = json['expertise'].cast<String>();
    otherRequirements = json['other_requirements'].cast<String>();
    checkList = json['check_list'].cast<String>();
    status = json['status'];
  }
}

class JobAcceptedBy {
  int? userId;
  String? name;
  String? photo;

  JobAcceptedBy({this.userId, this.name, this.photo});

  JobAcceptedBy.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
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