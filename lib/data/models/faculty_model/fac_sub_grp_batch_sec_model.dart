class FacultyCreatingSubGrpBatchSecModel {
  String? status;
  dynamic data;

  FacultyCreatingSubGrpBatchSecModel({this.status, this.data});

  FacultyCreatingSubGrpBatchSecModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dynamic jsonData = json['data'];
    if (jsonData != null) {
      if (jsonData is List) {
        data = jsonData
            .map((item) => FacultyCreatingSubGrpBatchSecData.fromJson(item))
            .toList();
      } else {
        data = FacultyCreatingSubGrpBatchSecData.fromJson(jsonData);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FacultyCreatingSubGrpBatchSecData {
  String? batch;
  String? courseCode;
  String? courseTitle;
  List<Member>? member;
  String? createdDate;
  String? sId;

  FacultyCreatingSubGrpBatchSecData(
      {this.batch,
      this.courseCode,
      this.courseTitle,
      this.member,
      this.createdDate,
      this.sId});

  FacultyCreatingSubGrpBatchSecData.fromJson(Map<String, dynamic> json) {
    batch = json['batch'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch'] = batch;
    data['courseCode'] = courseCode;
    data['courseTitle'] = courseTitle;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}

class Member {
  String? name;
  String? designation;
  String? department;
  String? sId;
  List<String>? chat; // Changed the type from List<Null>? to List<String>?
  String? timestamp;

  Member({
    this.name,
    this.designation,
    this.department,
    this.sId,
    this.chat,
    this.timestamp,
  });

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
    sId = json['_id'];
    if (json['chat'] != null) {
      chat = <String>[];
      json['chat'].forEach((v) {
        chat!.add(v.toString());
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['department'] = department;
    data['_id'] = sId;
    if (chat != null) {
      data['chat'] = chat!;
    }
    data['timestamp'] = timestamp;
    return data;
  }
}
