class AvailableCourseBatchModel {
  String? status;
  List<Data>? data;

  AvailableCourseBatchModel({this.status, this.data});

  AvailableCourseBatchModel.fromJson(Map<String, dynamic> json) {
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
  String? batch;
  String? courseCode;
  String? courseTitle;
  String? email;
  List<Member>? member;

  Data(
      {this.sId,
      this.batch,
      this.courseCode,
      this.courseTitle,
      this.email,
      this.member});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    batch = json['batch'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    email = json['email'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['batch'] = batch;
    data['courseCode'] = courseCode;
    data['courseTitle'] = courseTitle;
    data['email'] = email;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  String? name;
  String? designation;
  String? department;

  Member({this.name, this.designation, this.department});

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['department'] = department;
    return data;
  }
}
