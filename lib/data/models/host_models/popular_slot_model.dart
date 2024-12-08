class PopularSlotModel {
  String? message;
  List<Data>? data;

  PopularSlotModel({this.message, this.data});

  PopularSlotModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? time;
  int? count;

  Data({this.time, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['count'] = count;
    return data;
  }
}
