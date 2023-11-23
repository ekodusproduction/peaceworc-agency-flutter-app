class GetProfileResponse {
  bool? success;
  String? message;
  Data? data;
  dynamic? token;
  int? httpStatusCode;
  String? error;

  GetProfileResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});

  GetProfileResponse.withError(String err): error = err;
  GetProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? photo;
  String? companyName;
  dynamic? aboutCompany;
  String? email;
  String? phone;
  String? legalStructure;
  String? organizationType;
  String? taxIdOrEinId;
  String? street;
  dynamic? appartmentOrUnit;
  dynamic? floorNo;
  String? cityOrDistrict;
  String? state;
  String? zipCode;
  String? country;
  String? numberOfEmployee;
  int? yearsInBusiness;
  String? countryOfBusiness;
  String? annualBusinessRevenue;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? jobCount;
  int? ratingCount;
  String? revenueCount;
  ProfileCompletionStatus? profileCompletionStatus;

  Data(
      {this.id,
        this.userId,
        this.photo,
        this.companyName,
        this.aboutCompany,
        this.email,
        this.phone,
        this.legalStructure,
        this.organizationType,
        this.taxIdOrEinId,
        this.street,
        this.appartmentOrUnit,
        this.floorNo,
        this.cityOrDistrict,
        this.state,
        this.zipCode,
        this.country,
        this.numberOfEmployee,
        this.yearsInBusiness,
        this.countryOfBusiness,
        this.annualBusinessRevenue,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.jobCount,
        this.ratingCount,
        this.revenueCount,
        this.profileCompletionStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    photo = json['photo'];
    companyName = json['company_name'];
    aboutCompany = json['about_company'];
    email = json['email'];
    phone = json['phone'];
    legalStructure = json['legal_structure'];
    organizationType = json['organization_type'];
    taxIdOrEinId = json['tax_id_or_ein_id'];
    street = json['street'];
    appartmentOrUnit = json['appartment_or_unit'];
    floorNo = json['floor_no'];
    cityOrDistrict = json['city_or_district'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    numberOfEmployee = json['number_of_employee'];
    yearsInBusiness = json['years_in_business'];
    countryOfBusiness = json['country_of_business'];
    annualBusinessRevenue = json['annual_business_revenue'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jobCount = json['job_count'];
    ratingCount = json['rating_count'];
    revenueCount = json['revenue_count'];
    profileCompletionStatus = json['profile_completion_status'] != null
        ? new ProfileCompletionStatus.fromJson(
        json['profile_completion_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['photo'] = this.photo;
    data['company_name'] = this.companyName;
    data['about_company'] = this.aboutCompany;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['legal_structure'] = this.legalStructure;
    data['organization_type'] = this.organizationType;
    data['tax_id_or_ein_id'] = this.taxIdOrEinId;
    data['street'] = this.street;
    data['appartment_or_unit'] = this.appartmentOrUnit;
    data['floor_no'] = this.floorNo;
    data['city_or_district'] = this.cityOrDistrict;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['country'] = this.country;
    data['number_of_employee'] = this.numberOfEmployee;
    data['years_in_business'] = this.yearsInBusiness;
    data['country_of_business'] = this.countryOfBusiness;
    data['annual_business_revenue'] = this.annualBusinessRevenue;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['job_count'] = this.jobCount;
    data['rating_count'] = this.ratingCount;
    data['revenue_count'] = this.revenueCount;
    if (this.profileCompletionStatus != null) {
      data['profile_completion_status'] =
          this.profileCompletionStatus!.toJson();
    }
    return data;
  }
}

class ProfileCompletionStatus {
  int? userId;
  int? isBusinessInfoComplete;
  int? isOtherInfoAdded;
  int? isAuthorizeInfoAdded;
  int? isProfileApproved;

  ProfileCompletionStatus(
      {this.userId,
        this.isBusinessInfoComplete,
        this.isOtherInfoAdded,
        this.isAuthorizeInfoAdded,
        this.isProfileApproved});

  ProfileCompletionStatus.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    isBusinessInfoComplete = json['is_business_info_complete'];
    isOtherInfoAdded = json['is_other_info_added'];
    isAuthorizeInfoAdded = json['is_authorize_info_added'];
    isProfileApproved = json['is_profile_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['is_business_info_complete'] = this.isBusinessInfoComplete;
    data['is_other_info_added'] = this.isOtherInfoAdded;
    data['is_authorize_info_added'] = this.isAuthorizeInfoAdded;
    data['is_profile_approved'] = this.isProfileApproved;
    return data;
  }
}