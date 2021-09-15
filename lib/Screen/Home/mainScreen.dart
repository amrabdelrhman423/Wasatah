
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Controller/MainController.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<String> categories=[
    "شقق للإيجــــــار",
    "شقق للبيع",
    "اراضي للإيجــــــار",
    "فيلا للبيع"
  ];
  List<String>imagesartic=[
    "assets/art1.png",
    "assets/art2.png"
  ];
  List<String>imagescate=[
    "assets/cate1.png",
    "assets/cate2.png",
    "assets/cate1.png",
    "assets/cate2.png",
  ];
  List<String>imagesads=[
    "assets/ads2.png",
    "assets/adsv.png",
    "assets/ads2.png",
    "assets/adsv.png",
    "assets/ads2.png",
    "assets/adsv.png",
    "assets/ads2.png",
    "assets/adsv.png",
    "assets/ads2.png",
    "assets/adsv.png",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<MainController>(
          init: MainController(),
          builder:(controller) =>  Column(
            children: [
              SizedBox(
                height: 10,
              ),
             Container(
                  height: MediaQuery.of(context).size.height*0.28,
                  child: Swiper(
                    physics: BouncingScrollPhysics(),
                    loop: false,
                    pagination: SwiperPagination(
                      builder: RectSwiperPaginationBuilder(
                          activeColor: HexColor("#1B2B5D"),
                          color: HexColor("#BABFCE"),
                          size: Size(20, 9),
                          activeSize: Size(20,9),
                      ),
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.95,
                            height: MediaQuery.of(context).size.height*0.24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:AssetImage("assets/home1.png")
                                )
                            ),
                          ),
                        ],
                      );
                    },
                  ),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.95,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الأقسام الرئيسية',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontSize: 17,
                            color: const Color(0xff1b2b5d),
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          'عرض الكل',
                          style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xff33d6d7),
                            fontWeight: FontWeight.w600,
                          ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),


                      ],
                    ),
                ),
                ),

            Container(
                   padding: EdgeInsets.all(0),
                    height: MediaQuery.of(context).size.height*0.19,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:  ListView.builder(
                        controller: controller.controllerSwiper,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                            itemCount: 4,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                  height: MediaQuery.of(context).size.height*0.16,
                                  width: 210,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:AssetImage(imagescate[index]),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: HexColor("#1B2B5D").withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20)

                                    ),
                                    child: Center(
                                      child:  Text(
                                        categories[index],
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )

                        ),
                    ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int index=0;index<4;index++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index==controller.currentSwiper?HexColor("#1B2B5D"):HexColor("#BABFCE"),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: 14,
                      height: 3,
                    ),
                  )
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),

                child: Row(
                  children: [

                    Text(
                      'أحدث الإعلانات',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 17,
                        color: const Color(0xff1b2b5d),
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),

                  ],
                ),
              ),
              for(int i=0;i<3;i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.45,
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

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.17,
                                    width: MediaQuery.of(context).size.height*0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(imagesads[0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 8,
                                    child: InkWell(
                                      onTap: (){
                                        controller.changelikeAds(i, 0);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                          color:controller.likesAds[i][0]?Colors.redAccent: const Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x29000000),
                                              offset: Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset("assets/fav.svg"),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                child: Text(
                                  'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: const Color(0xff1b2b5d),
                                  ),
                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      '1,500,000',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xff1b2b5d),
                                        fontWeight: FontWeight.w700,
                                      ),
                                     // textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.45,
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

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.17,
                                    width: MediaQuery.of(context).size.height*0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(imagesads[1]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 8,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                        color:controller.likesAds[i][1]?Colors.redAccent: const Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: ()=>controller.changelikeAds(i, 1),
                                          child: SvgPicture.asset("assets/fav.svg"),
                                        )
                                      ),
                                    ),
                                  )

                                ],
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                child: Text(
                                  'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: const Color(0xff1b2b5d),
                                  ),
                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.end,
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
                                      '1,500,000',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xff1b2b5d),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      // textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Text(
                      "أحدث المقالات",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 17,
                        color: const Color(0xff1b2b5d),
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'عرض الكل',
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xff33d6d7),
                        fontWeight: FontWeight.w600,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              for(int i=0;i<2;i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.31,
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

                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image:  AssetImage(imagesartic[i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 8,
                              child: InkWell(
                                onTap: ()=>controller.changelikearticle(i),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                    color:controller.likeArticle[i]?Colors.redAccent: const Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child:SvgPicture.asset("assets/fav.svg"),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'لجنة معالجة أخطاء تسجيل الملكية العقارية " ملكية " تستقبل 4056 اعتراضاً خلال عام 2020',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xff1b2b5d),
                              height: 1.3846153846153846,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'قراءة المزيد',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xff33d6d7),
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),

                      ],
                    ),
                  ),
                ),

              SizedBox(height: 10,),
              Text(
                'جميع الحقوق محفوظة © وساطة عقارية 2021',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0x990d0e10),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 40,
              )

            ],
          ),
        ),
      ),
    );
  }
}
