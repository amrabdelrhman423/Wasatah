import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Screen/Account/AccountScreen.dart';
import 'package:wasatah/Screen/Categories/CategoriesScreen.dart';
import 'package:wasatah/Screen/Home/mainScreen.dart';
import 'package:wasatah/Screen/Map/MapScreen.dart';
import 'package:wasatah/Screen/More/MoreScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=2;
  List<Widget> Screens=[
    AccountScreen(),
    MapScreen(),
    MainScreen(),
    CategoriesScreen(),
    MoreScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child:Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    child:Image.asset("assets/wstlogo.png")
                    ,
                  ),
                ),
                Expanded(
                  child: Container(

                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 2),
                      child: Container(
                        child: TextFormField(

                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                              hintText: "عن ماذا تبحث؟",
                              hintStyle: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontSize: 12,
                                color: const Color(0x800d0e10),

                              ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(width: 1.0, color: const Color(0xffe6e8ea)),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(width: 1.0, color: const Color(0xffe6e8ea)),
                              ) ,
                              hintTextDirection: TextDirection.rtl,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.search,color: HexColor("#1B2B5D"),)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          child: Icon(Icons.notifications_none_outlined,color: Colors.black,size: 30,)
                      ),
                      Positioned(
                        top: 12,
                        left: 30,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: HexColor("#33D6D7"),
                          ),
                          child: Center(
                            child: // Adobe XD layer: '✏️label' (text)
                            Text(
                              '3',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontSize: 10,
                                color: const Color(0xffffffff),

                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.82,
              child: Screens[_currentIndex])
        ],
      ),
      bottomNavigationBar: ConvexAppBar(

        style: TabStyle.fixedCircle,
        height: 60,
        curveSize: 100,
        backgroundColor: Colors.white,
        activeColor: HexColor("#33D6D7"),
        color: Color.fromRGBO(27, 43, 93, 1),
        items: [
          TabItem(icon: SvgPicture.asset("assets/prof.svg",color: _currentIndex==0?HexColor("#33D6D7"):Color.fromRGBO(27, 43, 93, 1),),title: "حسابي"),
          TabItem(icon: SvgPicture.asset("assets/near.svg",color: _currentIndex==1?HexColor("#33D6D7"):Color.fromRGBO(27, 43, 93, 1),),title: "مجاور لك"),

          TabItem(icon: CircleAvatar(
         backgroundColor:HexColor("#33D6D7"),
            child: Icon(Icons.home_outlined,color: Colors.white,size: 40,),
          )),
          TabItem(icon: SvgPicture.asset("assets/cate.svg",color: _currentIndex==3?HexColor("#33D6D7"):Color.fromRGBO(27, 43, 93, 1),),title: "الأقسام"),
          TabItem(icon: SvgPicture.asset("assets/more.svg",color: _currentIndex==4?HexColor("#33D6D7"):Color.fromRGBO(27, 43, 93, 1),),title: "المزيد"),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex=i;
          });
        },
      ),
    );
  }
}
