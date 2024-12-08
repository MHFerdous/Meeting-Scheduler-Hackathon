class StudentResourcesModel {
  String? status;
  List<Data>? data;

  StudentResourcesModel({this.status, this.data});

  StudentResourcesModel.fromJson(Map<String, dynamic> json) {
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
  String? resource;
  String? batch;
  String? date;
  String? timestamp;

  Data({this.sId, this.resource, this.batch, this.date, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    resource = json['resource'];
    batch = json['batch'];
    date = json['date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['resource'] = resource;
    data['batch'] = batch;
    data['date'] = date;
    data['timestamp'] = timestamp;
    return data;
  }
}
