import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Screen/Home/HomeScreen.dart';
import 'package:wasatah/Screen/auth/Login/LoginScreen.dart';

class SucessRegisterScreen extends StatelessWidget {
  const SucessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/arrow.svg"),
                  Center(
                    child: Text(
                      'تسجيل حساب جديد',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff1b2b5d),
                        fontWeight: FontWeight.w700,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(),


                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),

            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: HexColor("#33D6D7").withOpacity(0.20),
                  borderRadius: BorderRadius.circular(90)
                ),
                child: Center(
                  child: SvgPicture.asset("assets/check.svg"),
                ),
              ),
              
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'تم تسجيل حسابكم بنجاح',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 18,
                color: const Color(0xff1b2b5d),
                letterSpacing: -0.225,
                fontWeight: FontWeight.w700,
                height: 1.6666666666666667,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'يمكنك الآن تسجيل الدخول إلى حسابكم والبدء بإستخدام خدمات وساطة عقارية',
                style: TextStyle(
                  fontSize: 17,
                  color: const Color(0xff1b2b5d),
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>Get.offAll(LoginScreen()),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color(0xff33d6d7),
                  ),
                  child: Center(
                    child: // Adobe XD layer: 'Get started' (text)
                    Text(
                      'تسجيل دخول',
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
            ),

          ],
        ),
      ),
    );
  }
}
