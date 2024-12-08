class BookedUserModel {
  String? message;
  Data? data;

  BookedUserModel({this.message, this.data});

  BookedUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Schedule? schedule;
  Guest? guest;

  Data({this.schedule, this.guest});

  Data.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    guest = json['guest'] != null ? Guest.fromJson(json['guest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    if (guest != null) {
      data['guest'] = guest!.toJson();
    }
    return data;
  }
}

class Schedule {
  String? sId;
  String? hostEmail;
  String? hostFullName;
  String? title;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? meetingAddress;
  String? status;
  int? count;
  String? createdAt;
  int? iV;

  Schedule(
      {this.sId,
        this.hostEmail,
        this.hostFullName,
        this.title,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.meetingAddress,
        this.status,
        this.count,
        this.createdAt,
        this.iV});

  Schedule.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hostEmail = json['hostEmail'];
    hostFullName = json['hostFullName'];
    title = json['title'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    meetingAddress = json['meetingAddress'];
    status = json['status'];
    count = json['count'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['hostEmail'] = hostEmail;
    data['hostFullName'] = hostFullName;
    data['title'] = title;
    data['startDate'] = startDate;
    data['startTime'] = startTime;
    data['endDate'] = endDate;
    data['endTime'] = endTime;
    data['meetingAddress'] = meetingAddress;
    data['status'] = status;
    data['count'] = count;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}

class Guest {
  String? sId;
  String? email;
  String? fullName;
  String? title;
  String? companyName;
  String? mobile;
  String? timeZone;
  String? createdDate;

  Guest(
      {this.sId,
        this.email,
        this.fullName,
        this.title,
        this.companyName,
        this.mobile,
        this.timeZone,
        this.createdDate});

  Guest.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    title = json['title'];
    companyName = json['companyName'];
    mobile = json['mobile'];
    timeZone = json['timeZone'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['title'] = title;
    data['companyName'] = companyName;
    data['mobile'] = mobile;
    data['timeZone'] = timeZone;
    data['createdDate'] = createdDate;
    return data;
  }
}
