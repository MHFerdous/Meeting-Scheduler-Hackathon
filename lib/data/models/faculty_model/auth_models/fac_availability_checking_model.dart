class FacAvailabilityCheckingModel {
  String? status;
  List<FacAvailabilityCheckingData>? data;

  FacAvailabilityCheckingModel({this.status, this.data});

  FacAvailabilityCheckingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacAvailabilityCheckingData>[];
      json['data'].forEach((v) {
        data!.add(FacAvailabilityCheckingData.fromJson(v));
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

class FacAvailabilityCheckingData {
  String? sId;
  String? email;
  String? fullName;
  String? designation;
  String? department;
  String? shortWords;
  String? password;
  String? createdDate;

  FacAvailabilityCheckingData(
      {this.sId,
      this.email,
      this.fullName,
      this.designation,
      this.department,
      this.shortWords,
      this.password,
      this.createdDate});

  FacAvailabilityCheckingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    designation = json['designation'];
    department = json['department'];
    shortWords = json['shortWords'];
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
    data['shortWords'] = shortWords;
    data['password'] = password;
    data['createdDate'] = createdDate;
    return data;
  }
}
