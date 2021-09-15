import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Screen/Home/HomeScreen.dart';
import 'package:wasatah/Screen/auth/Register/RegisterScreen.dart';
import 'package:get/get.dart';

class LoginScreen  extends StatelessWidget {
  bool _remmber=false;
  var _formKey = GlobalKey<FormState>();
  bool secure=false;


  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:  InkWell(
              onTap: ()=>Get.back(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 17),
                child: SvgPicture.asset("assets/arrow.svg"),
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [


                const  SizedBox(height: 40,),
                  Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Center(child: Image.asset("assets/wstlogo.png"))),
                  ),
                 SizedBox(
                   height: 15,
                 ),
                 Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff1b2b5d),
                        fontWeight: FontWeight.w700,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  //username field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child:  Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
                            hintText: 'اسم المستخدم',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: const Color(0x800d0e10),
                            ),
                            focusedErrorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color:  Colors.red),
                        ) ,
                            errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color:  Colors.red),
                            ) ,
                            enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                           ),
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                            ) ,
                            hintTextDirection: TextDirection.rtl,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                             prefixIcon:Icon(Icons.person_pin,color:HexColor("#C1C1C1") ,),
                          ),

                          validator: (value){
                            if (value!.isEmpty) {
                              return 'هذا الحقل فارغ';
                            } else if (value.length < 3 ||
                                value.length > 8 ||
                                !RegExp('[a-zA-Z]').hasMatch(value)) {
                              return ' يجب ان يكون الاسم بين 3الي 8 حروف';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                          //password field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child:  Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          autocorrect: false,
                          enableSuggestions: false,
                          obscureText: !secure,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
                            hintText: 'كلمة المرور',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: const Color(0x800d0e10),
                            ),
                            focusedErrorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color:  Colors.red),
                            ) ,
                            errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color:  Colors.red),
                            ) ,
                            enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                            ) ,
                            hintTextDirection: TextDirection.rtl,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                              prefixIcon:Icon(Icons.https,color:HexColor("#C1C1C1") ,),
                           suffixIcon : IconButton(
                              icon: Icon(secure?Icons.visibility_off:Icons.visibility,color: HexColor("#C1C1C1"),),
                              onPressed: (){
                                secure=!secure;
                                currentFocus.unfocus();
                              },
                            ),
                          ),
                          validator: (value){
                                     if (value!.isEmpty) {
                                          return 'هذا الحقل فارغ ';
                                         }
                                      if (value.length < 5) {
                                          return 'يجب ان تكون كلمة المرور اكبر من 5 حروف او ارقام';
                                        }

                                   return null;
                                      }
                        ),
                      ),
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                            width: 20,
                            child: StatefulBuilder(
                              builder: (context,setState)=>Checkbox(
                                side: BorderSide(
                                    width: 1.0, color: const Color(0xffd7d8da)
                                ),
                                value: _remmber,
                                activeColor: HexColor("#33D6D7"),
                                onChanged: (value) {
                                  setState(() {
                                    _remmber=value!;
                                  });
                                },
                              ),
                            )
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'تذكرني',
                          style: TextStyle(
                            fontSize: 14,
                            color: HexColor("#1B2B5D"),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),

                        Spacer(),

                        GestureDetector(
                          onTap: () {

                          },
                          child:
                          Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor("#1B2B5D"),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),


                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 InkWell(
                      onTap: () {

                        if(_formKey.currentState!.validate()){
                          Get.offAll(HomeScreen());
                        }

                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: const Color(0xff33d6d7),
                        ),
                        child: Center(
                          child:
                          Text(
                            'دخول',
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
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: ()=>Get.to(RegisterScreen()),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: const Color(0xff1b2b5d),
                        ),
                        child: Center(
                          child: // Adobe XD layer: 'Get started' (text)
                          Text(
                            'تسجيل جديد',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Adobe XD layer: 'Checkbox' (shape)
