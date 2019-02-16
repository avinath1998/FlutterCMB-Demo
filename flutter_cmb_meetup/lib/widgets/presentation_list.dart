import 'dart:async';

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
    model = new PresentationListModel(presentation: widget.presentation, meetup: widget.meetup);
    model.currentOrderStream();
  }

  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("meetups")
          .document(widget.meetup.id).collection("presentations")
          .document(widget.presentation.id).collection("timelinePages")
          .orderBy("order", descending: true).snapshots(),
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
                    return PageView.builder(
                      controller: model.pageController,
                      itemCount: snapshot.data.documents.length,
                      pageSnapping: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (model.showErrorMessage) {
                          return Center(
                              child: Text("Error retrieving data, try again!"));
                        } else if (model.showTimeline) {
                          TimelinePage page = TimelinePage.fromMap(
                              snapshot.data.documents[index].data,
                              snapshot.data.documents[index].documentID);
                          return PresentationTile(timelinePage: page);
                        }
                        return Center(child: Text("Pading"));
                      },
                    );
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
  PageController pageController;
  Stream stream;
  StreamSubscription subscription;

  PresentationListModel({@required this.presentation, @required this.meetup}) {
    pageController = new PageController();
  }

  void changePagerPage(int page) {
    print("Changing pager page to: $page");
    pageController.animateToPage(
        page, duration: Duration(seconds: 1), curve: Curves.bounceOut);
  }

  void dispose() {
    pageController.dispose();
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
      }
    });
    subscription.onError((error) {
      showErrorMessage = true;
      showTimeline = false;
    });
  }

}