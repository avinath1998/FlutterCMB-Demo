import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmb_meetup/code/timeline_page.dart';
import 'package:nima/nima_actor.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

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
          borderRadius: BorderRadius.circular(20.0),),
        child: Container(
            width: screenSize.width,
            padding: const EdgeInsets.all(10.0),
            child: MediaQuery
                .of(context)
                .orientation == Orientation.portrait ?
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Text(widget.timelinePage.textOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: widget.timelinePage.textOneSize,
                          fontWeight: widget.timelinePage.textOneBold
                              ? FontWeight
                              .bold
                              : FontWeight.normal
                      )
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: Container(
                      child: CachedNetworkImage(
                        imageUrl: widget.timelinePage.imageOne,
                        placeholder: Center(
                            child: CircularProgressIndicator()),),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(widget.timelinePage.textTwo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: widget.timelinePage.textTwoSize,
                          fontWeight: widget.timelinePage.textTwoBold
                              ? FontWeight
                              .bold
                              : FontWeight.normal
                      )
                  ),
                ),

              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                          widget.timelinePage.textOne,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.timelinePage.textOneSize,
                              fontWeight: widget.timelinePage.textOneBold
                                  ? FontWeight
                                  .bold
                                  : FontWeight.normal
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            widget.timelinePage.textTwo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: widget.timelinePage.textTwoSize,
                                fontWeight: widget.timelinePage.textTwoBold
                                    ? FontWeight
                                    .bold
                                    : FontWeight.normal
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: PinchZoomImage(
                      hideStatusBarWhileZooming: true,
                      image: Container(
                        child: CachedNetworkImage(
                          imageUrl: widget.timelinePage.imageOne,
                          placeholder: Center(
                              child: CircularProgressIndicator()),),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      );
    } else
    if (widget.timelinePage.timelineType == TimelinePage.TopIMiddleTBottomT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: screenSize.width - 40,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: CachedNetworkImage(
                      imageUrl: widget.timelinePage.imageOne,
                      placeholder: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        child: Text(widget.timelinePage.textOne,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: widget.timelinePage.textOneSize,
                                fontWeight: widget.timelinePage.textOneBold
                                    ? FontWeight
                                    .bold
                                    : FontWeight.normal
                            )
                        ),
                      ),
                      Text(
                          widget.timelinePage.textTwo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.timelinePage.textTwoSize,
                              fontWeight: widget.timelinePage.textTwoBold
                                  ? FontWeight
                                  .bold
                                  : FontWeight.normal
                          )
                      ),
                    ],
                  ),
                ),
              ),
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
          width: screenSize.width - 40,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: widget.timelinePage.flareOne.contains("nma")
                      ? NimaActor(
                    widget.timelinePage.flareOne,
                    animation: widget.timelinePage.flareOneAnimation,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ) : FlareActor(
                    widget.timelinePage.flareOne,
                    animation: widget.timelinePage.flareOneAnimation,

                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.timelinePage.textOne,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.timelinePage.textOneSize,
                              fontWeight: widget.timelinePage.textOneBold
                                  ? FontWeight
                                  .bold
                                  : FontWeight.normal),
                        ),
                      ),
                      Text(
                        widget.timelinePage.textTwo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: widget.timelinePage.textTwoSize,
                            fontWeight: widget.timelinePage.textTwoBold
                                ? FontWeight
                                .bold
                                : FontWeight.normal),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else
    if (widget.timelinePage.timelineType == TimelinePage.MiddleFMiddleT) {
      return Center(child: Text("Timeline type not found"));
    } else if (widget.timelinePage.timelineType == TimelinePage.TopIMiddleI) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
            width: screenSize.width - 40,
            padding: const EdgeInsets.all(30.0),
            child: MediaQuery
                .of(context)
                .orientation == Orientation.landscape ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: CachedNetworkImage(
                      imageUrl: widget.timelinePage.imageOne,
                      placeholder: Center(child: CircularProgressIndicator(),),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: CachedNetworkImage(
                      imageUrl: widget.timelinePage.imageTwo,
                      placeholder: Center(child: CircularProgressIndicator(),),
                    ),
                  ),
                ),
              ],
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: CachedNetworkImage(
                      imageUrl: widget.timelinePage.imageOne,
                      placeholder: Center(child: CircularProgressIndicator(),),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: PinchZoomImage(
                    hideStatusBarWhileZooming: true,
                    image: CachedNetworkImage(
                      imageUrl: widget.timelinePage.imageTwo,
                      placeholder: Center(child: CircularProgressIndicator(),),
                    ),
                  ),
                )
              ],
            )
        ),
      );
    } else if (widget.timelinePage.timelineType == TimelinePage.TopIMiddleT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: screenSize.width - 40,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: PinchZoomImage(
                  hideStatusBarWhileZooming: true,
                  image: CachedNetworkImage(
                    imageUrl: widget.timelinePage.imageOne,
                    placeholder: Center(child: CircularProgressIndicator()),),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
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
            ],
          ),
        ),
      );
    } else if (widget.timelinePage.timelineType == TimelinePage.TopTBottomT) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: screenSize.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Text(
                  widget.timelinePage.textOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textOneSize,
                      fontWeight: widget.timelinePage.textOneBold ? FontWeight
                          .bold : FontWeight.normal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.timelinePage.textTwo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textTwoSize,
                        fontWeight: widget.timelinePage.textTwoBold ? FontWeight
                          .bold : FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      );
    }else if(widget.timelinePage.timelineType == TimelinePage.TopTMiddleL){
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: screenSize.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
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
              Flexible(
                flex: 2,
                child:Text(
                  widget.timelinePage.textTwo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timelinePage.textTwoSize,
                      fontWeight: widget.timelinePage.textTwoBold ? FontWeight
                          .bold : FontWeight.normal),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: widget.timelinePage.textList.length,
                      itemBuilder: (context,index){
                        return Center(
                            child: Text(widget.timelinePage.textList[index].toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 17.5),));
                      },
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(child: Text("Timeline type not found"),);
    }
  }
}
