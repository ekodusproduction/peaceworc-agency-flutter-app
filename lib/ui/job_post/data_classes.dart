class Data {
  String? lat;
  String? long;
  String? street;
  String? description;
  String? city;
  String? state;
  String? place;
  Data({this.lat, this.long, this.street, this.description, this.city, this.state, this.place});
}

class CareTypeData {
  String? careType;
  bool? isClientVisible = false;
  CareTypeData({this.careType, this.isClientVisible});
}

class DateTimeBottomSheetData{
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  bool? isDateTimeAvailAble;
  DateTimeBottomSheetData({this.startDate, this.endDate, this.startTime, this.endTime, this.isDateTimeAvailAble});
}