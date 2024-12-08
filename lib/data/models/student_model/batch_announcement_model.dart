class BatchAnnouncementModel {
  String? status;
  int? total;
  List<Data>? data;

  BatchAnnouncementModel({this.status, this.total, this.data});

  BatchAnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? announcement;
  String? batch;
  String? type;
  String? date;
  String? timestamp;

  Data(
      {this.sId,
      this.email,
      this.announcement,
      this.batch,
      this.type,
      this.date,
      this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    announcement = json['announcement'];
    batch = json['batch'];
    type = json['type'];
    date = json['date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['email'] = email;
    data['announcement'] = announcement;
    data['batch'] = batch;
    data['type'] = type;
    data['date'] = date;
    data['timestamp'] = timestamp;
    return data;
  }
}
