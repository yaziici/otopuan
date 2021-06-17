

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:otopuan/profil.dart';
import 'detay.dart';
import 'filtreleme.dart';
import 'markaSecim.dart';
class anasayfa extends StatefulWidget {
  @override
  _anasayfaState createState() => _anasayfaState();
  String marka,model,groupValue;
  int kisi;
  int modell;
  anasayfa({this.marka,this.model,this.kisi,this.groupValue,this.modell});
}

double genelort;
FirebaseAuth _auth=FirebaseAuth.instance;
FirebaseFirestore _firestore=FirebaseFirestore.instance;

class _anasayfaState extends State<anasayfa> {

  var docs;

  @override
  Widget build(BuildContext context) {


    return  WillPopScope(
      onWillPop: geriTusu,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.cyanAccent.shade700.withOpacity(0.9),

          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>filtreleme()));
                    },
                    child: Column(
                      children: [
                        Icon(Icons.filter_list_alt,size:23),
                        SizedBox(height: 2,),
                        Text("Filtrele",style: TextStyle(fontSize: 13),),


                      ],
                    )),
              ),
            ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>markaSecim()));
                    },
                    child: Column(
                      children: [


                        Icon(Icons.add_box_rounded,size:23),
                        SizedBox(height: 2,),
                        Text("Değerlendir",style: TextStyle(fontSize: 13),),
                      ],
                    )),
              ),
            ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>profil()));
                    },
                    child:Column(
                      children: [
                        Icon(Icons.person,size:23),
                        SizedBox(height: 2,),
                        Text("Profil",style: TextStyle(fontSize: 13),),


                      ],
                    )),
              ),
            ),
            SizedBox(width: 15,),


          ],

        ),
        body: widget.modell==5?marka():ana(),

    ));

  }

  Widget paylasim(String marka, String model,double puan,String foto,int kisi){
    if(puan!=null && foto!=null){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,


            ),
            child: Row(

              children: [
                SizedBox(width: 15,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 3),
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.3))
                    ],
                  ),
                  width: 90,
                  height: 90,
                  child: Image.asset(foto),
                ),
                SizedBox(width: 25,),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 90,
                    child: Column(
                      children: [
                        Container(width:  MediaQuery.of(context).size.width*0.41,child: Text(marka+" / "+model,style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w300),)),
                        SizedBox(height: 20,),
                        Container(

                          width: MediaQuery.of(context).size.width*0.41,
                          child: Row(

                            children: [
                              Icon(Icons.star,color: Colors.orangeAccent,),
                              SizedBox(width: 5,),
                              Text(puan.toString(),style: TextStyle(color: Colors.black87,fontSize: 14)),
                              SizedBox(width: 5,),
                              Text(" - ",style: TextStyle(color: Colors.grey.shade500,fontSize: 14)),
                              SizedBox(width: 5,),
                              Text("($kisi)",style: TextStyle(color: Colors.grey.shade500,fontSize: 14)),
                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> detay(marka: marka,model: model,oto: foto,puan: puan,)));
                  },
                child : Container(
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    color: Colors.tealAccent.shade700.withOpacity(0.9),
                  ),

                      child: Center(child: Text("İncele",style: TextStyle(color: Colors.white,fontSize: 15),))),

                )
              ],
            )
          ),
        ),
        Center(
          child: Container(
            height: 0.7,
            color: Colors.grey,
            width: MediaQuery.of(context).size.width*0.80,
          ),

        ),


      ],
    );}
    else{
      return Container(child: Center(
        child: CircularProgressIndicator(),
      ));
    }
  }
  Future<bool> geriTusu() {
    return SystemNavigator.pop();

  }
  Widget ana(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder(stream: FirebaseFirestore.instance.collection("anasayfada").orderBy(widget.groupValue==null?"ortalama":widget.groupValue,descending: true ).snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.data!= null  ) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot doc = snapshot.data
                        .docs[index];
                    return paylasim(doc["marka"], doc["model"], doc["ortalama"],doc["pp"],doc["kisi"]);
                  });
            }else{
              return Container(child: Center(
                child: CircularProgressIndicator(),
              ));
            }
          }
      ),

    );
  }
  Widget marka(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder(stream: FirebaseFirestore.instance.collection("anasayfada").where("marka", isEqualTo: widget.groupValue).orderBy("ortalama",descending: true ).snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.data!= null  ) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot doc = snapshot.data
                        .docs[index];
                    return paylasim(doc["marka"], doc["model"], doc["ortalama"],doc["pp"],doc["kisi"]);
                  });
            }else{
              return Container(child: Center(
                child: CircularProgressIndicator(),
              ));
            }
          }
      ),

    );
  }

}
