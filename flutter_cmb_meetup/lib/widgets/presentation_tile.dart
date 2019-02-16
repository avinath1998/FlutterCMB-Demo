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

    } else if (widget.timelinePage.timelineType == TimelinePage.TopIMiddleTBottomT) {
      return Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      );
    } else if (widget.timelinePage.timelineType == TimelinePage.TopFMiddleTBottomT) {
      return Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              height: screenSize.height / 2,
              child: widget.timelinePage.flareOne.contains("nma") ? NimaActor(
                  widget.timelinePage.flareOne,
                  animation: widget.timelinePage.flareOneAnimation,
                  alignment: Alignment.center,
                  fit: BoxFit.contain
              ) : SizedBox(
                height: screenSize.height / 2,
                width: screenSize.width / 2,
                child: FlareActor(
                  widget.timelinePage.flareOne,
                  animation: widget.timelinePage.flareOneAnimation,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: screenSize.height / 4,
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
              padding: const EdgeInsets.all(10.0),
              height: screenSize.height / 4,
              child: Center(
                child: Text(
                  widget.timelinePage.textTwo,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textTwoSize,
                      fontWeight: widget.timelinePage.textTwoBold ? FontWeight
                          .bold : FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      );
    } else if (widget.timelinePage.timelineType == TimelinePage.MiddleFMiddleT) {
      return Container(
        height: screenSize.height,
        width: screenSize.width,
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
      );
    } else {
      return Center(child: Text("Timeline type not found"),);
    }
  }
}
