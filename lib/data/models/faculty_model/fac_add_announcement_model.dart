class FacAddAnnouncementModel {
  String? status;
  FacAddAnnouncementData? data;

  FacAddAnnouncementModel({this.status, this.data});

  FacAddAnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? FacAddAnnouncementData.fromJson(json['data'])
        : null;
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

class FacAddAnnouncementData {
  String? announcement;
  String? batch;
  String? section;
  String? date;

  FacAddAnnouncementData(
      {this.announcement, this.batch, this.section, this.date});

  FacAddAnnouncementData.fromJson(Map<String, dynamic> json) {
    announcement = json['announcement'];
    batch = json['batch'];
    section = json['section'];
    date = json['date'];
  }

  int? get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['announcement'] = announcement;
    data['batch'] = batch;
    data['date'] = date;
    return data;
  }
}
