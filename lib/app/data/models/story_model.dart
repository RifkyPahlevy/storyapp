class Story {
  int? id;
  String? judul;
  String? cerita;
  String? gambar;

  Story({this.id, this.judul, this.cerita, this.gambar});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    cerita = json['cerita'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['cerita'] = cerita;
    data['gambar'] = gambar;
    return data;
  }

  static List<Story> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Story.fromJson(e)).toList();
  }
}
