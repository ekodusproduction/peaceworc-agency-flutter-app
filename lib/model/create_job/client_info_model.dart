class ClientInfoModel{
  String gender;
  String age;
  String patient_name;
  ClientInfoModel({required this.gender, required this.age, required this.patient_name});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['patient_name'] = this.patient_name;
    return data;
  }
}