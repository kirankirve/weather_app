class SearchLocationResponseModel {
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  SearchLocationResponseModel(
      {this.id,
        this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.url});

  SearchLocationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['url'] = this.url;
    return data;
  }
}

class TestItem {
  String label;
  dynamic value;
  TestItem({
    required this.label,
    this.value
  });

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(
        label: json['label'],
        value: json['value']
    );
  }
}