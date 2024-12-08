class FacultyListModel {
  String? status;
  List<FacultyListData>? data;

  FacultyListModel({this.status, this.data});

  FacultyListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacultyListData>[];
      json['data'].forEach((v) {
        data!.add(FacultyListData.fromJson(v));
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

class FacultyListData {
  String? sId;
  String? batch;
  String? section;
  String? courseCode;
  String? courseTitle;
  String? email;
  List<FacultyMember>? member;
  String? createdDate;

  FacultyListData(
      {this.sId,
      this.batch,
      this.section,
      this.courseCode,
      this.courseTitle,
      this.email,
      this.member,
      this.createdDate});

  FacultyListData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    batch = json['batch'];
    section = json['section'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    email = json['email'];
    if (json['member'] != null) {
      member = <FacultyMember>[];
      json['member'].forEach((v) {
        member!.add(FacultyMember.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['batch'] = batch;
    data['section'] = section;
    data['courseCode'] = courseCode;
    data['courseTitle'] = courseTitle;
    data['email'] = email;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    return data;
  }
}

class FacultyMember {
  String? name;
  String? designation;
  String? department;
  String? sId;
  List<Chat>? chat;
  String? timestamp;

  FacultyMember(
      {this.name,
      this.designation,
      this.department,
      this.sId,
      this.chat,
      this.timestamp});

  FacultyMember.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
    sId = json['_id'];
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
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
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Chat {
  String? message;
  String? sender;
  String? sId;
  String? timestamp;

  Chat({this.message, this.sender, this.sId, this.timestamp});

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sender'] = sender;
    data['_id'] = sId;
    data['timestamp'] = timestamp;
    return data;
  }
}
