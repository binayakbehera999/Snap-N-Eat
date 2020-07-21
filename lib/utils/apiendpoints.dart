class APIEndpoints {
  final DateTime now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  void Print(){
    print(formatter.format(now));
  }
}