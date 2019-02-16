

class TimelinePage {
  static final String TopTMiddleI = "TopTMiddleI";
  static final String MiddleTTopI = "MiddleTTopI";
  static final String TopTMiddleIBottomT = "TopTMiddleIBottomT";
  static final String TopIMiddleTBottomT = "TopIMiddleTBottomT";
  static final String TopFMiddleTBottomI = "TopFMiddleTBottomI";
  static final String MiddleFTopT = "MiddleFTopT";
  static final String TopFMiddleT = "TopFMiddleT";
  static final String TopFMiddleTBottomF = "TopFMiddleTBottomF";
  static final String MiddleFMiddleT = "MiddleFMiddleT";

  String _id;
  int _order;
  String _timelineType;
  String _textOne;
  String _textTwo;
  String _textThree;
  String _imageOne;
  String _imageTwo;
  String _flareOne;
  String _flareOneAnimation;
  String _flareTwo;
  String _flareTwoAnimation;
  double _textOneSize;
  double _textTwoSize;
  double _textThreeSize;
  bool _textOneBold;
  bool _textTwoBold;
  bool _textThreeBold;

  static TimelinePage fromMap(Map<String, dynamic> map, String id){
    TimelinePage page = new TimelinePage();
    page.id = id;
    page.order = map['order'];
    page.timelineType = map['timelineType'];
    page.textOne = map['textOne'];
    page.textTwo = map['textTwo'];
    page._textThree = map['textThree'];
    page.imageOne = map['imageOne'];
    page.imageTwo = map['imageTwo'];
    page.flareOne = map['flareOne'];
    page.flareOneAnimation = map['flareOneAnimation'];
    page.flareTwo = map['flareTwo'];
    page.textOneSize = map['textOneSize'];
    page.textTwoSize = map['textTwoSize'];
    page.flareTwoAnimation = map['flaretTwoAnimation'];
    page.textThreeSize = map['textThreeSize'];
    page.textOneBold = map['textOneBold'];
    page.textTwoBold = map['textTwoBold'];
    page.textThreeBold = map['textThreeBold'];
    return page;
  }


  bool get textOneBold => _textOneBold;

  set textOneBold(bool value) {
    _textOneBold = value;
  }

  int get order => _order;

  set order(int value) {
    _order = value;
  }

  double get textThreeSize => _textThreeSize;

  set textThreeSize(double value) {
    _textThreeSize = value;
  }

  String get textThree => _textThree;

  set textThree(String value) {
    _textThree = value;
  }

  double get textOneSize => _textOneSize;

  set textOneSize(double value) {
    _textOneSize = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get timelineType => _timelineType;

  set timelineType(String value) {
    _timelineType = value;
  }

  String get textOne => _textOne;

  set textOne(String value) {
    _textOne = value;
  }

  String get flareTwoAnimation => _flareTwoAnimation;

  set flareTwoAnimation(String value) {
    _flareTwoAnimation = value;
  }

  String get flareTwo => _flareTwo;

  set flareTwo(String value) {
    _flareTwo = value;
  }

  String get flareOneAnimation => _flareOneAnimation;

  set flareOneAnimation(String value) {
    _flareOneAnimation = value;
  }

  String get flareOne => _flareOne;

  set flareOne(String value) {
    _flareOne = value;
  }

  String get imageTwo => _imageTwo;

  set imageTwo(String value) {
    _imageTwo = value;
  }

  String get imageOne => _imageOne;

  set imageOne(String value) {
    _imageOne = value;
  }

  String get textTwo => _textTwo;

  set textTwo(String value) {
    _textTwo = value;
  }

  double get textTwoSize => _textTwoSize;

  set textTwoSize(double value) {
    _textTwoSize = value;
  }

  bool get textTwoBold => _textTwoBold;

  set textTwoBold(bool value) {
    _textTwoBold = value;
  }

  bool get textThreeBold => _textThreeBold;

  set textThreeBold(bool value) {
    _textThreeBold = value;
  }

  @override
  bool operator ==(other) {
    if (other is TimelinePage) {
      TimelinePage page = other as TimelinePage;
      return page.id == this.id;
    }
    return false;
  }


}