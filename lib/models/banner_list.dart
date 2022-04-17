class BannerList {
  int? status;
  String? message;
  List<Data>? data;

  BannerList({this.status, this.message, this.data});

  BannerList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? eventId;
  String? eventTitle;
  String? eventDescription;
  String? eventImage;
  String? eventUrl;

  Data(
      {this.eventId,
      this.eventTitle,
      this.eventDescription,
      this.eventImage,
      this.eventUrl});

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventTitle = json['event_title'];
    eventDescription = json['event_description'];
    eventImage = json['event_image'];
    eventUrl = json['event_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_title'] = this.eventTitle;
    data['event_description'] = this.eventDescription;
    data['event_image'] = this.eventImage;
    data['event_url'] = this.eventUrl;
    return data;
  }
}