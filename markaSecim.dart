import 'dart:core';
import 'dart:core';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otopuan/giris.dart';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:otopuan/sorular.dart';

class markaSecim extends StatefulWidget {
  @override
  _markaSecimState createState() => _markaSecimState();
}
String markaa;
String modell;
FirebaseFirestore _firestore=FirebaseFirestore.instance;
FirebaseAuth _auth=FirebaseAuth.instance;
TextEditingController marka=new TextEditingController();
TextEditingController model=new TextEditingController();
List<String> markalar=["Audi","BMW","Mercedes","Volkswagen","Renault","Hyundai","Opel","Ferrari","AstonMartin","Cadillac"];
List<String> Audi=["A4","Q7","A5"];
List<String> BMW=["X6","520d","320i"];
List<String> Mercedes=["AMG","Vito","c180"];
List<String> Volkswagen=["Caddy","Passat","Jetta"];
List<String> Renault=["Megane","Clio","Talisman"];
List<String> Hyundai=["Tucson","Accend","Getz"];
List<String> Opel=["Corsa","Astra","Insignia"];
List<String> Ferrari=["California","Roma","Portofino"];
List<String> AstonMartin=["Rapide","Vantage","Virage"];
List<String> Cadillac=["SRX","Escalade"];
List<String> secimm=[];
String scm;
int kisi=0;
class _markaSecimState extends State<markaSecim> {

@override
  void initState() {



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 20),
              child: Container(
              height: 400,
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width:170,

                      child: DropDownField(

                        itemsVisibleInDropdown: 5,
                        controller: marka,
                        items: markalar,
                        hintText: "Marka",
                        hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                        enabled: true,
                        onValueChanged: (value){
                          setState(() {
                            marka.text=value;
                          });
                        },

                      ),
                    ),

                    Container(
                      width:170,
                      height: MediaQuery.of(context).size.height,
                      child: DropDownField(

                        itemsVisibleInDropdown: 5,
                        controller: model,
                        items: secim(),
                        hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                        hintText: "Model",
                        enabled: true,
                        onValueChanged: (value){
                          setState(() {
                            model.text=value;
                          });
                        },

                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 170,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: InkWell(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>sorular(marka: marka.text,model: model.text,oto: foto(), kisiler: kisi,)));

                    },
                  child: Center(child:Text("İlerle",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),),)),
            ),
          ],
        ),
      ),
    );
  }
  List<String> secim(){
    if(marka.text=="Audi"){
      return Audi;
    }
    if(marka.text=="BMW"){
      return BMW;
    }
    if(marka.text=="Mercedes"){
      return Mercedes;
    }
    if(marka.text=="Volkswagen"){
      return Volkswagen;
    }
    if(marka.text=="Renault"){
      return Renault;
    }
    if(marka.text=="Hyundai"){
      return Hyundai;
    }
    if(marka.text=="Opel"){
      return Opel;
    }
    if(marka.text=="Renault"){
      return Renault;
    }
    if(marka.text=="Hyundai"){
      return Hyundai;
    }
    if(marka.text=="Ferrari"){
      return Ferrari;
    }
    if(marka.text=="AstonMartin"){
      return AstonMartin;
    }
    if(marka.text=="Cadillac"){
      return Cadillac;
    }else{
      return secimm;
    }

  }
  String foto(){
    if(model.text=="A4"){
      return "assets/images/a4.png";
    }
    if(model.text=="Q7"){
      return "assets/images/q7.png";
    }
    if(model.text=="A5"){
      return "assets/images/a5.png";
    }
    if(model.text=="X6"){
      return "assets/images/x6.png";
    }
    if(model.text=="520d"){
      return "assets/images/520d.png";
    }
    if(model.text=="320i"){
      return "assets/images/320i.png";
    }
    if(model.text=="AMG"){
      return "assets/images/amg.png";
    }
    if(model.text=="Vito"){
      return "assets/images/vito.png";
    }
    if(model.text=="c180"){
      return "assets/images/c180.png";
    }
    if(model.text=="Passat"){
      return "assets/images/passat.png";
    }
    if(model.text=="Caddy"){
      return "assets/images/caddy.png";
    }
    if(model.text=="Jetta"){
      return "assets/images/jetta.png";
    }
    if(model.text=="Clio"){
      return "assets/images/clio.png";
    }
    if(model.text=="Talisman"){
      return "assets/images/talisman.png";
    }
    if(model.text=="Megane"){
      return "assets/images/megane.png";
    }
    if(model.text=="Accend"){
      return "assets/images/accend.png";
    }
    if(model.text=="Getz"){
      return "assets/images/tucson.png";
    }
    if(model.text=="Tucson"){
      return "assets/images/getz.png";
    }
    if(model.text=="Astra"){
      return "assets/images/astra.png";
    }
    if(model.text=="Insignia"){
      return "assets/images/insignia.png";
    }
    if(model.text=="Corsa"){
      return "assets/images/corsa.png";
    }
    if(model.text=="California"){
      return "assets/images/california.png";
    }
    if(model.text=="Roma"){
      return "assets/images/roma.png";
    }
    if(model.text=="Portofino"){
      return "assets/images/portofino.png";
    }
    if(model.text=="Virage"){
      return "assets/images/virage.png";
    }
    if(model.text=="Rapide"){
      return "assets/images/rapide.png";
    }
    if(model.text=="Vantage"){
      return "assets/images/vantage.png";
    }
    if(model.text=="SRX"){
      return "assets/images/srx.png";
    }
    if(model.text=="Escalade"){
      return "assets/images/escalade.png";
    }else{
      return "";
    }
  }
  void sifirla(){
    setState(() {
      marka.text="";
      model.text="";
    });
  }

}
