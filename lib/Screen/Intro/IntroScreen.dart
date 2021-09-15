import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Screen/auth/Login/LoginScreen.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  SwiperController _controller = SwiperController();
  int _currentIndex = 0;

  final List<String> subtitles = [
    "نقدم لك خدمات التسويق العقاري الشاملة",
    "مستشارك العقاري الخاص",
    "إعلانات مبوبة من جميع مناطق المملكة"
  ];
  final List<String> titles = [
    "منصة متخصصة في بيع وشراء وتاجير العقارات لحساب الغير",
    "استشارات عقارية متوافقه مع الانظمة الصادرة من الهيئة العامة العقار",
    "لا تشيل هم الوساطة، نقدملك إعلانات تغطي جميع إحتياجاتك"
  ];
  final List<String> imageUrl = [
        "assets/rent.png",
        "assets/sold.png",
        "assets/sale.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          SizedBox(
            height: 25,
          ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 12,right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _currentIndex<2?InkWell(
                    onTap: ()=>Get.to(LoginScreen()),
                    child: Text("تخطي",style: TextStyle(
                      color: HexColor("#0D0E10"),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                  ):const SizedBox()
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child:  Swiper(
                  loop: false,
                  index: _currentIndex,
                  onIndexChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  controller: _controller,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: HexColor("#1B2B5D"),
                      color: Colors.grey,
                      activeSize: 10.0,
                    ),
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return IntroItem(
                      title: titles[index],
                      subtitle: subtitles[index],
                      imageUrl: imageUrl[index],
                    );
                  },
                ),
              ),
            const SizedBox(height: 20.0),

            _currentIndex==2?
                    InkWell(
                      onTap: ()=>Get.to(LoginScreen()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: const Color(0xff33d6d7),
                          ),
                          child: Center(
                            child:  Text(
                              'ابدأ الآن',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                :Container()

          ],
        ),
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String ?title;
  final String? subtitle;
  final String? imageUrl;

  const IntroItem(
      {Key? key,this.title, this.subtitle, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
          child: Column(
            children: <Widget>[
              if (subtitle != null) ...[
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(
                    subtitle!,
                    style: TextStyle(color: HexColor("#1B2B5D"), fontSize: 28.0,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: 20.0),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child:Image.asset(
                        imageUrl.toString(),
                    ),
                  ),
                ),
              ),
              if (title != null) ...[
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Text(
                      title!,
                      style: TextStyle(color: HexColor("#1B2B5D"), fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                ),
                const SizedBox(height: 30.0),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
