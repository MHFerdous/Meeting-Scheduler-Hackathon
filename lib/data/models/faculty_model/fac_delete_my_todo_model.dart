class FacDeleteMyToDoModel {
  String? status;
  FacDeleteMyToDoData? data;

  FacDeleteMyToDoModel({this.status, this.data});

  FacDeleteMyToDoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? FacDeleteMyToDoData.fromJson(json['data'])
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

class FacDeleteMyToDoData {
  bool? acknowledged;
  int? deletedCount;

  FacDeleteMyToDoData({this.acknowledged, this.deletedCount});

  FacDeleteMyToDoData.fromJson(Map<String, dynamic> json) {
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
