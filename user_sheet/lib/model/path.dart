class Path {
  String? pathName;
  List<String>? list;
  Path({this.pathName, this.list});
  Path.fromJson(Map<String, dynamic> json) {
    pathName = json["path"];
    list = json["list"];
  }
  String? getName() {
    return (pathName == null) ? pathName : "";
  }
}
