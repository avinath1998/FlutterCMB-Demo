import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/timeline_page.dart';
import 'package:nima/nima_actor.dart';

class PresentationTile extends StatefulWidget {

  TimelinePage timelinePage;

  PresentationTile({this.timelinePage});

  @override
  State<StatefulWidget> createState() {
    return _PresentationTileState();
  }
}

class _PresentationTileState extends State<PresentationTile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    if (widget.timelinePage.timelineType == TimelinePage.TopTMiddleIBottomT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(widget.timelinePage.textOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textOneSize,
                      fontWeight: widget.timelinePage.textOneBold ? FontWeight
                          .bold : FontWeight.normal
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.timelinePage.imageOne,
                    placeholder: Center(child: CircularProgressIndicator(),),)
              ),
              Text(widget.timelinePage.textTwo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textTwoSize,
                      fontWeight: widget.timelinePage.textTwoBold ? FontWeight
                          .bold : FontWeight.normal
                  )
              ),

            ],
          ),
        ),
      );
    } else
    if (widget.timelinePage.timelineType == TimelinePage.TopIMiddleTBottomT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.timelinePage.imageOne,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
              Text(widget.timelinePage.textOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textOneSize,
                      fontWeight: widget.timelinePage.textOneBold ? FontWeight
                          .bold : FontWeight.normal
                  )
              )
            ],
          ),
        ),
      );
    } else
    if (widget.timelinePage.timelineType == TimelinePage.TopFMiddleTBottomT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: screenSize.height / 4,
                child: widget.timelinePage.flareOne.contains("nma") ? NimaActor(
                  widget.timelinePage.flareOne,
                  animation: widget.timelinePage.flareOneAnimation,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ) : FlareActor(
                  widget.timelinePage.flareOne,
                  animation: widget.timelinePage.flareOneAnimation,

                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    widget.timelinePage.textOne,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: widget.timelinePage.textOneSize,
                        fontWeight: widget.timelinePage.textOneBold ? FontWeight
                            .bold : FontWeight.normal),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    widget.timelinePage.textTwo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: widget.timelinePage.textTwoSize,
                        fontWeight: widget.timelinePage.textTwoBold ? FontWeight
                            .bold : FontWeight.normal),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else
    if (widget.timelinePage.timelineType == TimelinePage.MiddleFMiddleT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: <Widget>[
              Container(
                height: screenSize.height / 2,
                width: screenSize.width / 2,
                child: widget.timelinePage.flareOne.contains("nma") ? NimaActor(
                    widget.timelinePage.flareOne,
                    animation: widget.timelinePage.flareOneAnimation,
                    alignment: Alignment.center,
                    fit: BoxFit.contain
                ) : Container(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: FlareActor(
                    widget.timelinePage.flareOne,
                    animation: widget.timelinePage.flareOneAnimation,
                  ),
                ),
              ),
              Container(
                width: screenSize.width / 2,
                alignment: Alignment.center,
                child: Text(
                  widget.timelinePage.textOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textOneSize,
                      fontWeight: widget.timelinePage.textOneBold ? FontWeight
                          .bold : FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      );
    }else if(widget.timelinePage.timelineType == TimelinePage.TopIMiddleI){
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
          child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.timelinePage.imageOne,
              ),
              CachedNetworkImage(
                imageUrl: widget.timelinePage.imageTwo,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(child: Text("Timeline type not found"),);
    }
  }
}
