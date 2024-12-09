class MostBookedModel {
  String? message;
  List<Data>? data;

  MostBookedModel({this.message, this.data});

  MostBookedModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
