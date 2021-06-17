import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otopuan/giris.dart';
import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class kayit extends StatefulWidget {
  @override
  _kayitState createState() => _kayitState();

}
bool durum;
bool sifreGor=false;
bool sifreGorTekrar=false;
TextEditingController mail=new TextEditingController();
TextEditingController sifre=new TextEditingController();
TextEditingController sifre2=new TextEditingController();
TextEditingController kullaniciAdi=new TextEditingController();
FirebaseAuth _auth=FirebaseAuth.instance;
FirebaseFirestore _firestore=FirebaseFirestore.instance;
class _kayitState extends State<kayit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    child: Container(child: TextField(
                      controller: mail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: ("E-Mail Adresiniz"),
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
                        hintText: ("Şifre"),
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
                      controller: sifre2,
                      obscureText: sifreGorTekrar==true?false:true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon:InkWell(
                            onTap: (){
                              if(sifreGorTekrar==false){
                                setState(() {
                                  sifreGorTekrar=true;
                                });
                              }else{
                                setState(() {
                                  sifreGorTekrar=false;
                                });
                              }},
                            child: Icon(sifreGorTekrar==true?Icons.remove_red_eye_outlined:Icons.remove_red_eye)),
                        hintText: ("Şifrenizi Doğrulayın"),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(25)),


                      ),
                    ),),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    child: Container(
                      child: TextField(
                      controller: kullaniciAdi,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: ("Kullanıcı Adınız"),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(25)),


                      ),
                    ),),
                  ),
                  SizedBox(height: 30,),

                  InkWell(
                    onTap: (){
                      if(mail.text==""){
                        return Toast.show("Email Alanı Boş Bırakılamaz", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }if(kullaniciAdi.text==""){
                        return Toast.show("Kullanıcı Adı Alanı Boş Bırakılamaz", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }if(sifre.text=="" || sifre2.text==""){
                        return Toast.show("Şifre Alanı Boş Bırakılamaz", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }if(sifre.text!=sifre2.text){
                        return Toast.show("Şifreler aynı değil", context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }if(sifre.text.length<7 || sifre2.text.length<7) {
                        return Toast.show("Şifreniz Ez Az 7 Karakterden Oluşmalı", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }
                        else{
                      kaydol();
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>giris()));



                      }
                    },
                    child: Container( width: 290,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.8)
                      ),
                      child: Center(child: Text("Kaydol",style: TextStyle(color: Colors.white,fontSize: 17),)),),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>giris()));

                      },
                    child: Container( width: 290,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orangeAccent.withOpacity(0.8)
                      ),
                      child: Center(child: Text("Üyeliğim Var",style: TextStyle(color: Colors.white,fontSize: 17),)),),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void kaydol() async {

      Toast.show("Lütfen Mail Adresinize Gönderidiğimiz Kodu Onaylayın", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
      await _auth.createUserWithEmailAndPassword(
          email: mail.text, password: sifre.text);
      await _auth.currentUser.updateDisplayName(kullaniciAdi.text);
      await _auth.currentUser.updatePhotoURL("https://www.pngitem.com/pimgs/m/516-5167304_transp…t-background-white-user-icon-png-png-download.png");
      await _auth.currentUser.sendEmailVerification();
      if (_auth.currentUser != null) {
        await _auth.signOut();
      }



  }




}
