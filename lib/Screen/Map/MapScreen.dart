import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wasatah/Controller/mapController.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isactiveprice = false;

  bool isfloor = false;
  bool isfloorto = false;
  bool isvela = false;
  bool isvelato = false;
  bool island = false;

  ExpandableController expandableController1 = ExpandableController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<MapController>(
         init: MapController(),
          builder: (controller) {
            if(controller.customIcon != null||controller.currentPostion!=null){
              return Stack(
                children: [
                  Container(child: GoogleMap(
                        myLocationButtonEnabled: false,
                        markers: Set.from(controller.allMarkers),
                        mapType: MapType.terrain,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: controller.currentPostion,
                          zoom: 15,
                        ),
                        onMapCreated: (GoogleMapController con) {
                         controller.controllermap.complete(con);
                        },
                        zoomControlsEnabled: false,
                      )),
                  Positioned(
                    top: 15,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       InkWell(
                            onTap: ()=> controller.getUserLocation(),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.gps_fixed_outlined,
                                  color: HexColor("#1B2B5D"),
                                ),
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () =>
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => new BackdropFilter(
                                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(30.0),
                                          topRight: const Radius.circular(30.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'فلترة البحث',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: const Color(0xff1b2b5d),
                                                      letterSpacing: -0.25,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.2,
                                                    ),
                                                    textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                        false),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SvgPicture.asset("assets/reload.svg"),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 15),
                                              child: Divider(
                                                height: 1.5,
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: StatefulBuilder(
                                                builder: (context, setstate) =>
                                                    SingleChildScrollView(
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                                          child: Column(
                                                            children: [
                                                               Padding(
                                                                  padding:
                                                                  const EdgeInsets.all(8.0),
                                                                  child: ExpandablePanel(
                                                                    header: InkWell(
                                                                      onTap: () {
                                                                        setstate(() {
                                                                          expandableController1
                                                                              .expanded =
                                                                          !expandableController1
                                                                              .expanded;
                                                                        });
                                                                      },
                                                                      child: SizedBox(
                                                                        child: Text(
                                                                          'حسب القسم',
                                                                          style: TextStyle(
                                                                            fontSize: 18,
                                                                            color:
                                                                            expandableController1
                                                                                .expanded
                                                                                ? const Color(
                                                                                0xff33d6d7)
                                                                                : Colors
                                                                                .black,
                                                                            fontWeight:
                                                                            FontWeight.w500,
                                                                          ),
                                                                          textHeightBehavior:
                                                                          TextHeightBehavior(
                                                                              applyHeightToFirstAscent:
                                                                              false),
                                                                          textAlign:
                                                                          TextAlign.right,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed: Container(),
                                                                    controller:
                                                                    expandableController1,
                                                                    expanded: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              side: BorderSide(
                                                                                  width: 1.0,
                                                                                  color: const Color(
                                                                                      0xffd7d8da)),
                                                                              value: isfloor,
                                                                              activeColor:
                                                                              HexColor(
                                                                                  "#33D6D7"),
                                                                              onChanged: (value) {
                                                                                setstate(() {
                                                                                  isfloor =
                                                                                  !isfloor;
                                                                                });
                                                                              },
                                                                            ),
                                                                            SizedBox(
                                                                              child: Text(
                                                                                'شقق للبيع',
                                                                                style: TextStyle(
                                                                                  fontFamily:
                                                                                  'IBM Plex Sans Arabic',
                                                                                  fontSize: 16,
                                                                                  color: const Color(
                                                                                      0xff1b2b5d),
                                                                                  letterSpacing:
                                                                                  -0.24615383911132813,
                                                                                ),
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .right,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              side: BorderSide(
                                                                                  width: 1.0,
                                                                                  color: const Color(
                                                                                      0xffd7d8da)),
                                                                              value: isfloorto,
                                                                              activeColor:
                                                                              HexColor(
                                                                                  "#33D6D7"),
                                                                              onChanged: (value) {
                                                                                setstate(() {
                                                                                  isfloorto =
                                                                                  !isfloorto;
                                                                                });
                                                                              },
                                                                            ),
                                                                            // Adobe XD layer: 'Remember me' (text)
                                                                            SizedBox(
                                                                              child: Text(
                                                                                'شقق للإيجار',
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: const Color(
                                                                                      0xff1b2b5d),
                                                                                ),
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .right,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              side: BorderSide(
                                                                                  width: 1.0,
                                                                                  color: const Color(
                                                                                      0xffd7d8da)),
                                                                              value: isvela,
                                                                              activeColor:
                                                                              HexColor(
                                                                                  "#33D6D7"),
                                                                              onChanged: (value) {
                                                                                setstate(() {
                                                                                  isvela =
                                                                                  !isvela;
                                                                                });
                                                                              },
                                                                            ),
                                                                            // Adobe XD layer: 'Remember me' (text)
                                                                            SizedBox(
                                                                              child: Text(
                                                                                'فلل للبيع',
                                                                                style: TextStyle(
                                                                                  fontFamily:
                                                                                  'IBM Plex Sans Arabic',
                                                                                  fontSize: 16,
                                                                                  color: const Color(
                                                                                      0xff1b2b5d),
                                                                                  letterSpacing:
                                                                                  -0.24615383911132813,
                                                                                ),
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .right,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              side: BorderSide(
                                                                                  width: 1.0,
                                                                                  color: const Color(
                                                                                      0xffd7d8da)),
                                                                              value: isvelato,
                                                                              activeColor:
                                                                              HexColor(
                                                                                  "#33D6D7"),
                                                                              onChanged: (value) {
                                                                                setstate(() {
                                                                                  isvelato =
                                                                                  !isvelato;
                                                                                });
                                                                              },
                                                                            ),
                                                                            // Adobe XD layer: 'Remember me' (text)
                                                                            SizedBox(
                                                                              child: Text(
                                                                                'فلل للإيجار',
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: const Color(
                                                                                      0xff1b2b5d),
                                                                                ),
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .right,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              side: BorderSide(
                                                                                  width: 1.0,
                                                                                  color: const Color(
                                                                                      0xffd7d8da)),
                                                                              value: island,
                                                                              activeColor:
                                                                              HexColor(
                                                                                  "#33D6D7"),
                                                                              onChanged: (value) {
                                                                                setstate(() {
                                                                                  island =
                                                                                  !island;
                                                                                });
                                                                              },
                                                                            ),
                                                                            SizedBox(
                                                                              child: Text(
                                                                                'أرض للبيع',
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: const Color(
                                                                                      0xff1b2b5d),
                                                                                ),
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .right,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              Padding(
                                                                    padding:
                                                                    const EdgeInsets.all(8.0),
                                                                    child: ExpandablePanel(
                                                                      header: Text(
                                                                        'حسب السعر',
                                                                        style: TextStyle(
                                                                          fontSize: 18,
                                                                          color: const Color(
                                                                              0xff1b2b5d),
                                                                          letterSpacing: -0.225,
                                                                          fontWeight:
                                                                          FontWeight.w500,
                                                                        ),
                                                                        textHeightBehavior:
                                                                        TextHeightBehavior(
                                                                            applyHeightToFirstAscent:
                                                                            false),
                                                                        textAlign:
                                                                        TextAlign.right,
                                                                      ),
                                                                      collapsed: SizedBox(),
                                                                      expanded: SizedBox(),
                                                                    ),
                                                                  ),
                                                             Padding(
                                                                    padding:
                                                                    const EdgeInsets.all(8.0),
                                                                    child: ExpandablePanel(
                                                                      header: Text(
                                                                        'حسب المساحة',
                                                                        style: TextStyle(
                                                                          fontSize: 18,
                                                                          color: const Color(
                                                                              0xff1b2b5d),
                                                                          letterSpacing: -0.225,
                                                                          fontWeight:
                                                                          FontWeight.w500,
                                                                        ),
                                                                        textHeightBehavior:
                                                                        TextHeightBehavior(
                                                                            applyHeightToFirstAscent:
                                                                            false),
                                                                        textAlign:
                                                                        TextAlign.right,
                                                                      ),
                                                                      collapsed: SizedBox(),
                                                                      expanded: SizedBox(),
                                                                    ),
                                                                  ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                child: InkWell(
                                                                  onTap: () =>
                                                                      Navigator.of(context).pop(),
                                                                  child: Container(
                                                                    height: 50,

                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          25.0),
                                                                      color:
                                                                      const Color(0xff33d6d7),
                                                                    ),
                                                                    child: Center(
                                                                      child: // Adobe XD layer: 'Get started' (text)
                                                                      Text(
                                                                        'تم',
                                                                        style: TextStyle(
                                                                          fontSize: 18,
                                                                          color: const Color(
                                                                              0xffffffff),
                                                                          fontWeight:
                                                                          FontWeight.w700,
                                                                        ),
                                                                        textHeightBehavior:
                                                                        TextHeightBehavior(
                                                                            applyHeightToFirstAscent:
                                                                            false),
                                                                        textAlign:
                                                                        TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                              ),
                                            )
                                            ,SizedBox(
                                              height: 50,
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color: HexColor("#1B2B5D"),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 100,
                        child: Container(
                          height: 70,
                          child: ScrollablePositionedList.builder(
                              itemScrollController:controller.itemScrollController,
                              itemPositionsListener:controller.itemPositionsListener,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    controller.goToTheLake(controller.nearbyLocation[index].latitude,controller.nearbyLocation[index].longitude,index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: const Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/mapv.png"))),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 10),
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                child: Text(
                                                  'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: const Color(0xff1b2b5d),
                                                  ),
                                                  textHeightBehavior: TextHeightBehavior(
                                                      applyHeightToFirstAscent: false),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),

                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'SAR',
                                                      style: TextStyle(
                                                        fontFamily: 'IBM Plex Sans Arabic',
                                                        fontSize: 14,
                                                        color: const Color(0xff1b2b5d),
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.2857142857142858,
                                                      ),
                                                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '1,500,000 ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: const Color(0xff1b2b5d),
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textHeightBehavior: TextHeightBehavior(
                                                          applyHeightToFirstAscent: false),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ))
                ],
              );
            }else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          }),
    );
  }


}
