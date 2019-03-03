import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';
import 'package:flutter_cmb_meetup/code/presentation.dart';
import 'package:flutter_cmb_meetup/code/timeline_page.dart';
import 'package:flutter_cmb_meetup/widgets/presentation_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class PresentationList extends StatefulWidget {

  Presentation presentation;
  Meetup meetup;

  PresentationList({@required this.presentation, @required this.meetup}) {}

  @override
  State<StatefulWidget> createState() {
    return _PresentationListState();
  }
}

class _PresentationListState extends State<PresentationList> {

  PageController pager = new PageController();
  PresentationListModel model;

  @override
  void initState() {
    super.initState();
    model = new PresentationListModel(
        presentation: widget.presentation, meetup: widget.meetup);
    model.currentOrderStream();
  }

  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return StreamBuilder(
      stream: Firestore.instance.collection("meetups")
          .document(widget.meetup.id).collection("presentations")
          .document(widget.presentation.id).collection("timelinePages")
          .orderBy("order", descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.documents.length == 0) {
            return Center(child: Text(
                "Sorry, but this presentation doesn't have any timeline pages"));
          } else {
            return ScopedModel(
                model: model,
                child: ScopedModelDescendant<PresentationListModel>(
                  builder: (context, child, model) {
                    if (model.showErrorMessage) {
                      return Center(
                          child: Text("Error retrieving data, try again!"));
                    } else if (model.showTimeline) {
                      model.slider = CarouselSlider(
                          items: snapshot.data.documents.map((dc) {
                            return new Builder(
                              builder: (BuildContext context) {
                                TimelinePage page = TimelinePage.fromMap(
                                    dc.data,
                                    dc.documentID);
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                  child: PresentationTile(timelinePage: page),
                                );
                              },
                            );
                          }).toList(),
                          initialPage: 0,
                          aspectRatio: MediaQuery
                              .of(context)
                              .orientation == Orientation.portrait
                              ? 0.8
                              : screenSize.width / screenSize.height,
                          reverse: false
                      );
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: model.slider,
                                width: screenSize.width,
                              ),
                            ), Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text("Presented by Colombo Flutter Community",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),),
                                    Text(
                                        "#flutterCMB"
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                    return Center(child: Text("Error"),);
                  },
                )
            );
          }
        } else if (snapshot.hasError) {
          return Center(
              child: Text("Sorry, something went wrong, try again later :("));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class PresentationListModel extends Model {
  Presentation presentation;
  Meetup meetup;
  bool showErrorMessage = false;
  bool showTimeline = false;
  List<TimelinePage> pages = new List();
  CarouselSlider slider;
  Stream stream;
  StreamSubscription subscription;

  PresentationListModel({@required this.presentation, @required this.meetup});

  void changePagerPage(int page) {
    print("Changing pager page to: $page");
    if (slider != null) {
      slider.animateToPage(
          page, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    } else {
      print("Slider is null");
    }
  }

  void dispose() {
    slider.pageController.dispose();
    subscription.cancel();
  }

  void currentOrderStream() {
    stream =
        Firestore.instance.collection("meetups").document(meetup.id).collection(
            "presentations").document(presentation.id).snapshots();
    subscription = stream.listen((dc) {
      Presentation presentationUpdate = Presentation.fromMap(
          dc.data, dc.documentID);
      if (presentationUpdate.currentOrder != presentation.currentOrder) {
        changePagerPage(presentationUpdate.currentOrder);
        presentation = presentationUpdate;
      }
      if (!showTimeline) {
        showTimeline = true;
        notifyListeners();
      }
    });
    subscription.onError((error) {
      showErrorMessage = true;
      showTimeline = false;
    });
  }

}