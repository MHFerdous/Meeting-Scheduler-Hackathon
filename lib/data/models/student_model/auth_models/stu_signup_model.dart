class StuSignupModel {
  String? status;
  StuSignupData? data;

  StuSignupModel({this.status, this.data});

  StuSignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? StuSignupData.fromJson(json['data']) : null;
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

class StuSignupData {
  bool? acknowledged;
  int? modifiedCount;
  Null upsertedId;
  int? upsertedCount;
  int? matchedCount;

  StuSignupData(
      {this.acknowledged,
      this.modifiedCount,
      this.upsertedId,
      this.upsertedCount,
      this.matchedCount});

  StuSignupData.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['modifiedCount'] = modifiedCount;
    data['upsertedId'] = upsertedId;
    data['upsertedCount'] = upsertedCount;
    data['matchedCount'] = matchedCount;
    return data;
  }
}
