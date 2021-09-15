import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wasatah/Screen/auth/Register/SucessRegisterScreen.dart';
import 'package:get/get.dart';



class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool secure=true;
  bool secureconfirm=true;
  var _formKey = GlobalKey<FormState>();
  String password="",confirmPassword="";
  String _title="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:  InkWell(
              onTap: ()=>Get.back(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
                child: SvgPicture.asset("assets/arrow.svg"),
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
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
        
body: SingleChildScrollView(
  physics: BouncingScrollPhysics(),
  child: Form(
    key: _formKey,
    child: Column(
        children: [

          const  SizedBox(height: 50,),
          Center(
            child: Container(
                height: 100,
                width: 100,
                child: Center(child: Image.asset("assets/wstlogo.png"))),
          ),
SizedBox(
    height: 15,
),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(

                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
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
                  ),

                  validator: (value){
                    if (value!.isEmpty) {
                      return 'هذا الحقل فارغ ';
                    } else if (value.length < 3 ||
                        value.length > 8 ||
                        !RegExp('[a-zA-Z]').hasMatch(value)) {
                      return 'يجب ان يتكون الاسم بين 3 احرف الي 8';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(

                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    hintText: "رقم الجوال",
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
                  ),
                  validator: (value){
                    if(!GetUtils.isPhoneNumber(value!)){
                      return "هذا الحقل فارغ ";
                    }else{
                      return null;
                    }
                  },
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    hintText: "البريد الالكتروني ' اختياري'",
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
                  ),
                  validator: (value){
                    if(value!.isEmpty||value==""){
                      return null;
                    }else if(!GetUtils.isEmail(value)){
                      return "برجاء ادخال البريد الالكتروني صحيح";                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),

            child: Container(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButtonFormField<String>(
                  icon: Icon(Icons.arrow_forward_ios,color: HexColor("#B7B7B7"),size: 20,),

                     decoration: InputDecoration(

                border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(28),
                     borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                   ),
                   contentPadding: EdgeInsets.all(15),
                    ),
                  items: ["بائع","مشتري"]
                      .map((label) => DropdownMenuItem(
                    child: Text(label.toString()),
                    value: label,
                  ))
                      .toList(),
                  hint: Text('نوع المستخدم',style:TextStyle(
                    fontSize: 15,
                    color: const Color(0x800d0e10),
                  ) ,),
                  onChanged: (value) {
                  },
                  validator: (val) {
                    if(val==null){
                      return "هذا الحقل فارغ";
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),

            child: Container(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButtonFormField<String>(
                  icon: Icon(Icons.arrow_forward_ios,color: HexColor("#B7B7B7"),size: 20,),

                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  items: ["القاهرة","المنصورة","المحلة الكبري", "الاسماعيلية","الاسكندرية"]
                      .map((label) => DropdownMenuItem(
                    child: Text(label.toString()),
                    value: label,
                  ))
                      .toList(),
                  hint: Text('المدينة',style:TextStyle(
                    fontSize: 15,
                    color: const Color(0x800d0e10),
                  ),
                    ) ,
                  onChanged: (value) {
                  },
                  validator: (val) {
                    if(val==null){
                      return "هذا الحقل فارغ";
                    }
                  },

                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  validator: (value){
                    if(_title.isEmpty){
                      return "هذا الحقل فارغ ";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    hintText: _title.isEmpty?'السجل التجاري':_title,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: const Color(0x800d0e10),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                    ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                      errorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                    ) ,
                    hintTextDirection: TextDirection.rtl,
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                    suffixIcon: InkWell(
                      onTap: ()async{
                        try {
                          FilePickerResult ?result =
                              await FilePicker.platform.pickFiles(type: FileType.image);
                          if (result != null) {
                            File file = File(result.files.single.path);
                            setState(() {
                              _title = result.files.first.name;
                            });
                          } else {
                            // User canceled the picker
                          }
                        } on Exception catch (e) {
                          print("message error " + e.toString());
                        }
                      },
                      child: Container(
                        width: 120,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                              color: HexColor("#9A9A9A"),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical:7),
                          child: // Adobe XD layer: 'Login' (text)
                          Center(
                            child: Text(
                              'ارفاق صورة',
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                height: 0.75,
                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: secure,
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      hintText: 'كلمة المرور',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: const Color(0x800d0e10),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                      errorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                      ) ,
                      hintTextDirection: TextDirection.rtl,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        icon: Icon(secure?Icons.visibility:Icons.visibility_off ,color:HexColor("#B7B7B7"),),
                        onPressed: (){
                          setState(() {
                            secure=!secure;
                          });
                        },
                      )
                  ),
                  onChanged: (value){
                    password=value;
                  },
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'هذا الحقل اجباري';
                      }
                      if (value.length < 5) {
                        return 'يجب ان تكون اكثر من 5 حروف او ارقام ';
                      }

                      return null;
                    }
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Container(
              child:  Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: secureconfirm,
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      hintText: 'تاكيد كلمة المرور',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: const Color(0x800d0e10),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                      errorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color:  Colors.red),
                      ) ,
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: const Color(0xffe6e8ea)),
                      ) ,
                      hintTextDirection: TextDirection.rtl,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        icon: Icon(secureconfirm?Icons.visibility:Icons.visibility_off,color:HexColor("#B7B7B7")),
                        onPressed: (){
                         setState(() {
                           secureconfirm=!secureconfirm;
                         });
                        },
                      )
                  ),
                    onChanged: (value){
                    confirmPassword=value;
                    },
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'هذا الحقل اجباري';
                      }
                      if (value.length < 5) {
                        return 'يجب ان تكون اكثر من 5 حروف او ارقام ';
                      }
                      if (password!=confirmPassword) {
                        return 'كلمة المرور غير متطابقان';
                      }

                      return null;
                    }
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
              child: InkWell(
              onTap: ()
              {

                if(_formKey.currentState!.validate()){
                  Get.offAll(SucessRegisterScreen());
                }

              },child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xff33d6d7),
                ),
                child: Center(
                  child: // Adobe XD layer: 'Get started' (text)
                  Text(
                    'تسجيل',
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

          SizedBox(
            height: 10,
          ),
          Text(
                'تسجيلك لدينا يعني موافقتك على',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0x660d0e10),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
           SizedBox(
             height: 7,
           ),

           Text(
                'شروط الإستخدام وسياسة الخصوصية',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff33d6d7),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
          SizedBox(
            height: 30,
          )
        ],
    ),
  ),
),
      ),
    );
  }
}
