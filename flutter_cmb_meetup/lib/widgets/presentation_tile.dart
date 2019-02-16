import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/timeline_page.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    if(widget.timelinePage.timelineType == TimelinePage.TopTMiddleI){
      return Container(
        child: Column(
          children: <Widget>[
            Text(widget.timelinePage.textOne),
            CachedNetworkImage(imageUrl: widget.timelinePage.imageOne)
          ],
        )
      );
    }else if(widget.timelinePage.timelineType == TimelinePage.MiddleTTopI){

    }else if(widget.timelinePage.timelineType == TimelinePage.TopTMiddleIBottomT){

    }else if(widget.timelinePage.timelineType == TimelinePage.TopIMiddleTBottomT){
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
                        fontWeight: widget.timelinePage.textOneBold ? FontWeight.bold: FontWeight.normal
                    )
                )
              ],
            ),
          ),
        ),
      );
    }else if(widget.timelinePage.timelineType == TimelinePage.TopFMiddleTBottomI){

    }else if(widget.timelinePage.timelineType == TimelinePage.MiddleFTopT){

    }else if(widget.timelinePage.timelineType == TimelinePage.TopFMiddleT){

    }else if(widget.timelinePage.timelineType == TimelinePage.TopFMiddleTBottomF){

    }else if(widget.timelinePage.timelineType == TimelinePage.MiddleFMiddleT){
      return Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: screenSize.width/2,
              child: FlareActor(
                widget.timelinePage.flareOne,
                animation: widget.timelinePage.flareOneAnimation,
              ),
            ),
            SizedBox(
              width: screenSize.width/2,
              child: Text(
                widget.timelinePage.textOne,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget.timelinePage.textOneSize,
                    fontWeight: widget.timelinePage.textOneBold ? FontWeight.bold: FontWeight.normal),
              ),
            )
          ],
        ),
      );
    }else{
      return Center(child: Text("Timeline type not found"),);
    }
  }
}
