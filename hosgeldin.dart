
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:otopuan/giris.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'anasayfa2.dart';
class hosgeldin extends StatefulWidget {
  @override
  _hosgeldinState createState() => _hosgeldinState();
}
int groupValue=-1;
FirebaseAuth _auth=FirebaseAuth.instance;
class _hosgeldinState extends State<hosgeldin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent.shade700.withOpacity(0.9),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.70,
            height: MediaQuery.of(context).size.height*0.50,
            child: Image.asset("assets/images/logo.png",color: Colors.white),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>giris()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.45,
                    height: MediaQuery.of(context).size.height*0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                      children: [
                        Container(
                            width:120,
                            height: 140,
                            child: Image.asset("assets/images/otopuanla.png")),
                        SizedBox(height: 10,),
                        Text("Sen de Oyla!",style: TextStyle(color: Colors.grey.shade500.withOpacity(1),fontSize: 18,fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 17,),
                InkWell(
                  onTap: (){
                    if(_auth.currentUser!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>anasayfa()));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>anasayfa2()));
                    }

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.45,
                    height: MediaQuery.of(context).size.height*0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child:  Column(
                  children: [
                  Container(
                  width:130,
                      height: 150,
                      child: Image.asset("assets/images/gor.png")),

                  Text("Oylananları Gör!",style: TextStyle(color: Colors.grey.shade500.withOpacity(1),fontSize: 18,fontWeight: FontWeight.w300),)
              ],
            ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50,),
          Text("OTOPUAN",style: TextStyle(letterSpacing: 4,fontSize: 30,fontWeight:FontWeight.w300 ,color: Colors.white),)
        ],
      ),
      ),

    );
  }
}
