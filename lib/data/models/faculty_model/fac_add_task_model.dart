class FacAddTaskModel {
  String? status;
  List<FacAddTaskData>? data;

  FacAddTaskModel({this.status, this.data});

  FacAddTaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacAddTaskData>[];
      json['data'].forEach((v) {
        data!.add(FacAddTaskData.fromJson(v));
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

class FacAddTaskData {
  String? sId;
  String? email;
  String? batch;
  String? section;
  String? taskType;
  String? timestamp;

  FacAddTaskData(
      {this.sId,
      this.email,
      this.batch,
      this.section,
      this.taskType,
      this.timestamp});

  FacAddTaskData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    batch = json['batch'];
    section = json['section'];
    taskType = json['taskType'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['batch'] = batch;
    data['section'] = section;
    data['taskType'] = taskType;
    data['timestamp'] = timestamp;
    return data;
  }
}
