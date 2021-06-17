import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:otopuan/sonuc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class paylasimDetay extends StatefulWidget {
  @override
  _paylasimDetayState createState() => _paylasimDetayState();
  String marka, model;
  String oto;
  double puan;

  paylasimDetay({this.marka,this.model,this.oto,this.puan});
}
FirebaseAuth _auth=FirebaseAuth.instance;
class _paylasimDetayState extends State<paylasimDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700.withOpacity(0.9),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Center(

              child: Container(

                height: MediaQuery.of(context).size.height*0.25,
                child: Image.asset(widget.oto),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              color: Colors.cyanAccent.shade700.withOpacity(0.9),
              height:40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.marka+" / "+widget.model,style: TextStyle(color: Colors.white,fontSize: 14)),
                  SizedBox(width: 15,),
                  Icon(Icons.star,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text(widget.puan.toString(),style: TextStyle(color: Colors.white,fontSize: 14)),

                ],
              ),
            ),
            Container(

            ),

            StreamBuilder(stream: FirebaseFirestore.instance.collection("puanlama").where("kullanici",isEqualTo: _auth.currentUser.displayName).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.data!= null  ) {
                    return Container(
                      height: MediaQuery.of(context).size.height*0.55,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot doc = snapshot.data
                                .docs[index];
                            return genel(doc["yolTutuş"], doc["sehirIci"],
                                doc["sehirDisi"], doc["surus"], doc["yolcu"], doc["icDizayn"], doc["disDizayn"], doc["hiz"], doc["guvenlik"]);
                          }),
                    );
                  }else{
                    return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget genel(double yolTutus,sehirIciYakit,sehirDisiYakit,surus,yolcu,icDizayn, disDizayn,hiz,guvenlik){
    return Container(
      height:MediaQuery.of(context).size.height*0.55,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [

                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/yol.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Yol Tutuşu",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(yolTutus.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/yakit.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Şehir İçi Yakıt",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(sehirIciYakit.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],

                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/yk2.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Şehir Dışı Yakıt",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(sehirDisiYakit.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/knf.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Sürüş Konforu",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(surus.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/ylc.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Yolcu Konforu",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(yolcu.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/ic.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("İç Dİzayn",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(icDizayn.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/car.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Dış Dizayn",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(disDizayn.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/sp.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Hızlanma",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(hiz.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 60,
                          width: 60,

                          child: Image.asset("assets/images/kaza.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Güvenlik",style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(width: 5,),
                        Icon(Icons.star,color: Colors.orangeAccent,),
                        SizedBox(width: 5,),
                        Text(guvenlik.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade400,
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.90,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
