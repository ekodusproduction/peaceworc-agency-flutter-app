class GetPostJobResponse {
  GetPostJobResponse({
    this.success,
    this.message,
    this.data,
    this.token,
    this.httpStatusCode,
  });

  bool? success;
  String? message;
  Data? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;
  GetPostJobResponse.withError(String err): error = err;
  GetPostJobResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    token = null;
    httpStatusCode = json['http_status_code'];
  }
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic? nextPageUrl;
  String? path;
  String? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;
  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Datum>[];
      json['data'].forEach((v) {
        data!.add(new Datum.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Link>[];
      json['links'].forEach((v) {
        links!.add(new Link.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Datum {
  Datum({
    this.id,
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
    this.medicalHistory,
    this.expertise,
    this.otherRequirements,
    this.checkList,
    this.status,
    this.biddingStartTime,
    this.biddingEndTime,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? userId;
  int? clientId;
  String? title;
  String? careType;
  List<CareItem>? careItems;
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
  List<dynamic>? medicalHistory;
  List<dynamic>? expertise;
  List<dynamic>? otherRequirements;
  List<dynamic>? checkList;
  String? status;
  dynamic? biddingStartTime;
  dynamic? biddingEndTime;
  int? paymentStatus;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    title = json['title'];
    careType = json['care_type'];
    if (json['care_items'] != null) {
      careItems = <CareItem>[];
      json['care_items'].forEach((v) {
        careItems!.add(new CareItem.fromJson(v));
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
    /*if (json['medical_history'] != null) {
      medicalHistory = <Null>[];
      json['medical_history'].forEach((v) {
        medicalHistory!.add(new Null.fromJson(v));
      });
    }*/
    /*if (json['expertise'] != null) {
      expertise = <Null>[];
      json['expertise'].forEach((v) {
        expertise!.add(new Null.fromJson(v));
      });
    }*/
    /*if (json['other_requirements'] != null) {
      otherRequirements = <Null>[];
      json['other_requirements'].forEach((v) {
        otherRequirements!.add(new Null.fromJson(v));
      });
    }*/
    medicalHistory = json['medical_history'] as List<dynamic>?;
    expertise = json['expertise'] as List<dynamic>?;
    otherRequirements = json['otherRequirements'] as List<dynamic>?;
    checkList = json['check_list'] as List<dynamic>?;
    status = json['status'];
    biddingStartTime = json['bidding_start_time'];
    biddingEndTime = json['bidding_end_time'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}

class CareItem {
  CareItem({
    this.age,
    this.gender,
    this.patientName,
  });

  String? age;
  String? gender;
  String? patientName;
  CareItem.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    patientName = json['patient_name'];
  }
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
