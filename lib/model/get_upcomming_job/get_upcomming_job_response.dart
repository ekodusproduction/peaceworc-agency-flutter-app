class GetUpcommingJobResponse {
  bool? success;
  String? message;
  List<Data>? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  GetUpcommingJobResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  GetUpcommingJobResponse.withError(String err):error = err;
  GetUpcommingJobResponse.fromJson(Map<String, dynamic> json) {
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
  List<String>? medicalHistory;
  List<String>? expertise;
  List<String>? otherRequirements;
  List<String>? checkList;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    if (this.jobAcceptedBy != null) {
      data['job_accepted_by'] = this.jobAcceptedBy!.toJson();
    }
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
    data['description'] = this.description;
    data['medical_history'] = this.medicalHistory;
    data['expertise'] = this.expertise;
    data['other_requirements'] = this.otherRequirements;
    data['check_list'] = this.checkList;
    data['status'] = this.status;
    return data;
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