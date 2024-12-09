class AllGuestModel {
  String? message;
  List<Data>? data;

  AllGuestModel({this.message, this.data});

  AllGuestModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? fullName;
  String? title;
  String? companyName;
  String? mobile;
  String? timeZone;
  String? createdDate;

  Data(
      {this.sId,
        this.email,
        this.fullName,
        this.title,
        this.companyName,
        this.mobile,
        this.timeZone,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
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
