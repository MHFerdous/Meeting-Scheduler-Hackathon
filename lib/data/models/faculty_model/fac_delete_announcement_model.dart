class FacDeleteAnnouncementModel {
  String? status;
  FacDeleteAnnouncementData? data;

  FacDeleteAnnouncementModel({this.status, this.data});

  FacDeleteAnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? FacDeleteAnnouncementData.fromJson(json['data'])
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

class FacDeleteAnnouncementData {
  bool? acknowledged;
  int? deletedCount;

  FacDeleteAnnouncementData({this.acknowledged, this.deletedCount});

  FacDeleteAnnouncementData.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    deletedCount = json['deletedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['deletedCount'] = deletedCount;
    return data;
  }
}
