import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/meetup.dart';
import 'package:flutter_cmb_meetup/code/presentation.dart';
import 'package:flutter_cmb_meetup/widgets/presentation_list.dart';
import 'package:scoped_model/scoped_model.dart';


class ScreenPresentationModel extends Model {
  Meetup meetup;

  ScreenPresentationModel({@required this.meetup});

  Presentation presentation;
  bool showPresentationList = false;
  bool showError = false;
  bool showPresentationNotStarted = false;
  StreamSubscription subscription;

  void initStream() {
    Stream<QuerySnapshot> stream = Firestore.instance.collection("meetups")
        .document(meetup.id).collection("presentations").where(
        "active", isEqualTo: true)
        .snapshots();
    subscription = stream.listen((sn) {
      if (sn.documents.length == 1) {
        sn.documentChanges.forEach((dc) {
          switch (dc.type) {
            case DocumentChangeType.added:
              presentation = Presentation.fromMap(
                  dc.document.data, dc.document.documentID);
              showPresentationList = true;
              showPresentationNotStarted = false;

              notifyListeners();
              break;
            case DocumentChangeType.modified:
              return;
            case DocumentChangeType.removed:
              showPresentationList = false;
              showError = true;
              showPresentationNotStarted = false;
              notifyListeners();
              break;
          }
        });
      } else if (sn.documents.length > 1) {
        showError = true;
        showPresentationList = false;
        showPresentationNotStarted = false;
        notifyListeners();
      } else {
        showError = false;
        showPresentationList = false;
        showPresentationNotStarted = true;
        notifyListeners();
      }
    });
    subscription.onError((error) {
      showError = true;
      showPresentationList = false;
      showPresentationNotStarted = false;
      notifyListeners();
    });
  }

  void dispose() {
    print("Disposing Model");
    subscription.cancel();
  }

}

class ScreenPresentation extends StatefulWidget {

  Meetup meetup;
  ScreenPresentationModel screenPresentationModel;

  ScreenPresentation({@required this.meetup}) {
    screenPresentationModel = new ScreenPresentationModel(meetup: this.meetup);
  }

  @override
  State<StatefulWidget> createState() {
    return _ScreenPresentationState();
  }
}

class _ScreenPresentationState extends State<ScreenPresentation> {
  @override
  void initState() {
    super.initState();
    widget.screenPresentationModel.initStream();
  }

  @override
  void dispose() {
    super.dispose();
    widget.screenPresentationModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: widget.screenPresentationModel,
      child: ScopedModelDescendant<ScreenPresentationModel>(
          builder: (context, child, model) {
            if (model.showPresentationList) {
              return PresentationList(
                presentation: model.presentation,
                meetup: widget.meetup,
              );
            } else if (model.showError) {
              return Center(
                  child: Text("An error has occured, try again later."));
            } else if (model.showPresentationNotStarted) {
              return Center(
                  child: Text("The presentation has not yet started."));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
