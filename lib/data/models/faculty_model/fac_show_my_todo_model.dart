class FacShowMyToDoModel {
  String? status;
  List<FacShowMyToDoData>? data;

  FacShowMyToDoModel({this.status, this.data});

  FacShowMyToDoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacShowMyToDoData>[];
      json['data'].forEach((v) {
        data!.add(FacShowMyToDoData.fromJson(v));
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

class FacShowMyToDoData {
  String? sId;
  String? email;
  String? title;
  String? date;
  String? timestamp;

  FacShowMyToDoData(
      {this.sId, this.email, this.title, this.date, this.timestamp});

  FacShowMyToDoData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    title = json['title'];
    date = json['date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['title'] = title;
    data['date'] = date;
    data['timestamp'] = timestamp;
    return data;
  }
}
