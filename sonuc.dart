

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class sonuc extends StatefulWidget {
  @override
  _sonucState createState() => _sonucState();
  double ort;
  String marka,model;
  sonuc({this.ort,this.marka,this.model});
}
double ortalamaa;
FirebaseFirestore _firestore=FirebaseFirestore.instance;
FirebaseAuth _auth=FirebaseAuth.instance;
int kisi=0;
class _sonucState extends State<sonuc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  color: Colors.grey)
            ],
          ),
          width: MediaQuery.of(context).size.width*0.80,
          height: MediaQuery.of(context).size.height*0.70,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(200)
                  ),

                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Genel Puan",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 25),),

                      SizedBox(height: 10,),
                      Text(widget.ort.toString(),style: TextStyle(color: Colors.white.withOpacity(1),fontSize: 50,fontWeight: FontWeight.bold),),
                    ],
                  ))),
            SizedBox(height: 60,),
              InkWell(
                  onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>anasayfa()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                      width: 200,
                      height: 50,

                      child: Center(child: Text("Devam Et",style: TextStyle(color: Colors.white,fontSize: 20),))))
            ],
          )),
        ),
      ),
    );
  }
  /*void genelOrt()async{
    await _firestore.collection("anasayfada").doc(widget.model).get().then((value) {

          _firestore.collection("anasayfada").doc(widget.model).update({'kisi':value.data()["kisi"]+1});

    });
  }*/



}
