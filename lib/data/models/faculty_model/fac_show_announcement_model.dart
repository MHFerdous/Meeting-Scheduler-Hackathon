class FacShowAnnouncementModel {
  String? status;
  List<FacShowAnnouncementData>? data;

  FacShowAnnouncementModel({this.status, this.data});

  FacShowAnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacShowAnnouncementData>[];
      json['data'].forEach((v) {
        data!.add(FacShowAnnouncementData.fromJson(v));
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

class FacShowAnnouncementData {
  String? sId;
  String? email;
  String? announcement;
  String? batch;
  String? section;
  String? date;
  String? timestamp;

  FacShowAnnouncementData(
      {this.sId,
      this.email,
      this.announcement,
      this.batch,
      this.section,
      this.date,
      this.timestamp});

  FacShowAnnouncementData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    announcement = json['announcement'];
    batch = json['batch'];
    section = json['section'];
    date = json['date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['announcement'] = announcement;
    data['batch'] = batch;
    data['section'] = section;
    data['date'] = date;
    data['timestamp'] = timestamp;
    return data;
  }
}
