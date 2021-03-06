

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:otopuan/anasayfa2.dart';
import 'package:otopuan/kayit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
class giris extends StatefulWidget {
  @override
  _girisState createState() => _girisState();
}
bool sifreGor=false;
User kullanici;
double deger=0;
TextEditingController mail=new TextEditingController();
TextEditingController sifre=new TextEditingController();
FirebaseAuth _auth=FirebaseAuth.instance;


class _girisState extends State<giris> {
  @override
  Widget build(BuildContext context) {

    if(_auth.currentUser!=null && _auth.currentUser.emailVerified){
        return anasayfa();

    }else{
        return WillPopScope(
          onWillPop: geriTusu,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Container(

                  child: TextField(
                  controller: mail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    hintText: ("E-Mail"),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(25)),


                  ),
                ),),
              ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40),
            child: Container(child: TextField(
              controller: sifre,
              obscureText: sifreGor==true?false:true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon:InkWell(
                    onTap: (){
                      if(sifreGor==false){
                      setState(() {
                        sifreGor=true;
                      });
                    }else{
                        setState(() {
                          sifreGor=false;
                        });
                }},
                    child: Icon(sifreGor==true?Icons.remove_red_eye_outlined:Icons.remove_red_eye)),

                hintText: ("??ifre"),
                border: new OutlineInputBorder(

                    borderSide: new BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),

            ),
          ),
          Container(
            child: Text(""),
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: ()async{
              try{

                if(_auth.currentUser==null) {
                  kullanici = (await _auth.signInWithEmailAndPassword(
                      email: mail.text, password: sifre.text)).user;

                  if(kullanici.emailVerified){

                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => anasayfa()));
                    setState(() {
                      mail.text="";
                      sifre.text="";
                    });
                  }else{

                    Toast.show("Mailiniz Onayl?? De??il. L??tfen Mail Adresinize G??derdi??imiz Linki Onaylay??n", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                     kullanici.sendEmailVerification();
                     _auth.signOut();
                  }
                }else{
                  if(_auth.currentUser.emailVerified){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => anasayfa()));
                  }
                }


            }on FirebaseAuthException catch(e){

                if(e.code=="user-not-found"){
                  return Toast.show("B??yle Bir Kullan??c?? Yok. E-Mail Adresinizi Do??ru Yazd??????n??zdan Emin Olun.", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);

                }
                if(e.code=="wrong-password"){
                  Toast.show("Girdi??iniz ??ifre Yanl????", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);


                }


              }
            },
            child: Container(
              width: 290,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orangeAccent.withOpacity(0.8)
              ),
              child: Center(child: Text("Giri?? Yap",style: TextStyle(color: Colors.white,fontSize: 17),)),
            ),
          ),
          SizedBox(height: 15,),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                height: 0.5,
                width: 90,
                color: Colors.grey,
              ),
                SizedBox(width: 5,),
                Container(

                  child: Text("Ya da"),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 0.5,
                  width: 90,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>kayit()));
            },
            child: Container( width: 290,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.withOpacity(0.8)
              ),
              child: Center(child: Text("Kaydol",style: TextStyle(color: Colors.white,fontSize: 17),)),),
          ),
          SizedBox(height: 15,),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 0.5,
                  width: 110,
                  color: Colors.grey,
                ),


                Container(
                  height: 0.5,
                  width: 110,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>anasayfa2()));
            },
            child: Container( width: 290,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal.shade300
              ),
              child: Center(child: Text("Giri?? Yapmadan ??ncele",style: TextStyle(color: Colors.white,fontSize: 17),)),),
          ),
      ],
    ),
  ),
        );}

  }
  Future<bool> geriTusu() {
    return SystemNavigator.pop();

  }



}
