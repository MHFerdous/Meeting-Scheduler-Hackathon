class FacAvailableModel {
  String? status;
  List<Data>? data;

  FacAvailableModel({this.status, this.data});

  FacAvailableModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
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
  String? designation;
  String? department;
  String? password;
  String? createdDate;
  String? count;
  String? shortWords;

  Data(
      {this.sId,
      this.email,
      this.fullName,
      this.designation,
      this.department,
      this.password,
      this.createdDate,
      this.count,
      this.shortWords});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    designation = json['designation'];
    department = json['department'];
    password = json['password'];
    createdDate = json['createdDate'];
    count = json['count'];
    shortWords = json['shortWords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['fullName'] = fullName;
    data['designation'] = designation;
    data['department'] = department;
    data['password'] = password;
    data['createdDate'] = createdDate;
    data['count'] = count;
    data['shortWords'] = shortWords;
    return data;
  }
}
