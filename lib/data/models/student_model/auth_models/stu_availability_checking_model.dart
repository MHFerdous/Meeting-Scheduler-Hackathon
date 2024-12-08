class StuAvailabilityCheckingModel {
  String? status;
  List<StuAvailabilityCheckingData>? data;

  StuAvailabilityCheckingModel({this.status, this.data});

  StuAvailabilityCheckingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <StuAvailabilityCheckingData>[];
      json['data'].forEach((v) {
        data!.add(StuAvailabilityCheckingData.fromJson(v));
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

class StuAvailabilityCheckingData {
  String? sId;
  String? email;
  String? fullName;
  String? designation;
  String? department;
  String? password;
  String? createdDate;

  StuAvailabilityCheckingData(
      {this.sId,
      this.email,
      this.fullName,
      this.designation,
      this.department,
      this.password,
      this.createdDate});

  StuAvailabilityCheckingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    designation = json['designation'];
    department = json['department'];
    password = json['password'];
    createdDate = json['createdDate'];
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
    return data;
  }
}
