class Presentation {
  bool _active;
  String _description;
  String _id;
  int _currentOrder;
  List<dynamic> _slideshowUrls;

  Presentation(){
    _slideshowUrls = new List();
  }

  List<dynamic> get slideshowUrls => _slideshowUrls;

  set slideshowUrls(List<dynamic> value) {
    _slideshowUrls = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  bool get active => _active;

  set active(bool value) {
    _active = value;
  }

  int get currentOrder => _currentOrder;

  set currentOrder(int value) {
    _currentOrder = value;
  }


  static Presentation fromMap(Map<String, dynamic> map, String id){
    Presentation presentation = new Presentation();
    presentation.slideshowUrls = map['slideshow'];
    presentation.description = map['description'];
    presentation.active = map['active'];
    presentation.id = id;
    presentation.currentOrder = map['currentOrder'];
    return presentation;
  }


}