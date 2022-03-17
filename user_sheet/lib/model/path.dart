class Path {
  String? pathName;
  int numberMon = 10;
  List<String>? list;
  Path({this.pathName, this.list});
  Path.fromJson(Map<String, dynamic> json) {
    pathName = json["path"];
    numberMon = json["size"];
    list = [];
    for (int i = 0; i < numberMon; i++) {
      list!.add(json["list"][i]);
      // print("This is element $i hey: ${list!.elementAt(i)}");
    }
  }
  String? getName() {
    return (pathName == null) ? pathName : "";
  }
}
