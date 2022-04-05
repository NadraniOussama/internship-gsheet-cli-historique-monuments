class Path {
  String? pathName;
  int numberMon = 10;
  List<int>? list;
  Path({this.pathName, this.list});
  Path.fromJson(Map<String, dynamic> json) {
    pathName = json["path"];
    numberMon = json["size"];
    list = [];
    for (int i = 0; i < numberMon; i++) {
      list!.add(json["list"][i]);
    }
  }
  String? getName() {
    return (pathName == null) ? pathName : "";
  }
}
