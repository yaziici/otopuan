import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:otopuan/sonuc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class sorular extends StatefulWidget {
  @override
  _sorularState createState() => _sorularState();
  String marka, model;
  String oto;
  int kisiler;
  sorular({this.marka,this.model,this.oto,this.kisiler});
}
FirebaseFirestore _firestore=FirebaseFirestore.instance;
FirebaseAuth _auth=FirebaseAuth.instance;
double yolTutusu=0;
double sehirici=0;
double sehirdisi=0;
double suruss=0;
double yolcuu=0;
double icc=0;
double diss=0;
double hizz=0;
double guvenlikk=0;
double ortalama=0;
double genelGuvenlik=0;
double enGenel=0;
double genelYol=0;
double enGenelYol=0;
double genelSurus=0;
double enGenelSurus=0;
double genelHizlanma=0;
double enGenelHizlanma=0;
double genelOrt=0;
double enGenelOrt=0;
double genelYakit=0;
double enGenelYakit=0;
///////
double genelIcDizayn=0;
double enGenelIcDizayn=0;
double genelDisDizayn=0;
double enGenelDisDizayn=0;
double genelSehirDisi=0;
double enGenelSehirDisi=0;
double genelYolcu=0;
double enGenelYolcu=0;

int t=0;
int y=0;
class _sorularState extends State<sorular> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     yolTutusu=0;
    sehirici=0;
    sehirdisi=0;
    suruss=0;
    yolcuu=0;
    icc=0;
    diss=0;
    hizz=0;
    guvenlikk=0;
    ortalama=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
        child: ListView(
          children: [
            Column(
              children: [
                yoltutus(),
                sehiriciYakit(),
                sehirDisiYakit(),
                surus(),
                yolcu(),
                ic(),
                dis(),
                hiz(),
                guvenlik(),
                SizedBox(height: 30,),
                puan(),
                SizedBox(height: 20,),


              ],
            )
          ],
        ),
        ),
      ),
    );
  }

  Widget yoltutus(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
        Padding(
        padding: const EdgeInsets.only(left:20),
        child: Container(
          height: 60,
          width: 60,

              child: Image.asset("assets/images/yol.png"),
            ),),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Yol Tutuşu", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: yolTutusu,
                        onRated: (value) {
                          setState(() {
                            yolTutusu = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(yolTutusu.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget sehiriciYakit(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
        Padding(
        padding: const EdgeInsets.only(left:20),
        child: Container(
          height: 60,
          width: 60,

              child: Image.asset("assets/images/yakit.png"),
            ),),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Şehir İçi Yakıt", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: sehirici,
                        onRated: (value) {
                          setState(() {
                            sehirici = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(sehirici.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget sehirDisiYakit(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/yk2.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Şehir Dışı Yakıt", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: sehirdisi,
                        onRated: (value) {
                          setState(() {
                            sehirdisi = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(sehirdisi.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget surus(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/knf.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Sürüş Konforu", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: suruss,
                        onRated: (value) {
                          setState(() {
                            suruss = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(suruss.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget yolcu(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/ylc.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Yolcu Konforu", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: yolcuu,
                        onRated: (value) {
                          setState(() {
                            yolcuu = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(yolcuu.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget ic(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/ic.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("İç Dizayn", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: icc,
                        onRated: (value) {
                          setState(() {
                            icc = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(icc.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget dis(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/car.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Dış Dizayn", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: diss,
                        onRated: (value) {
                          setState(() {
                            diss = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(diss.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget hiz(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/sp.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Hızlanma", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: hizz,
                        onRated: (value) {
                          setState(() {
                            hizz = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(hizz.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget guvenlik(){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.6))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Container(
                height: 60,
                width: 60,

                child: Image.asset("assets/images/kaza.png"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Güvenlik", style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                          color: Colors.black87),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: SmoothStarRating(
                        spacing: 5,
                        size: 25,
                        borderColor: Colors.blue,
                        color: Colors.blue,
                        rating: guvenlikk,
                        onRated: (value) {
                          setState(() {
                            guvenlikk = value;
                          });
                        },

                      ),
                    ),

                  ],
                ),

              ),

            ),
            SizedBox(width:20 ,),
            Container(
              child: Text(guvenlikk.toString(),style: TextStyle(fontSize: 25,color: Colors.orangeAccent),),
            )
          ],
        ),
      ),
    );
  }
  Widget puan(){
    return Center(


      child: InkWell(
        onTap: (){

          setState(() {
            ortalama=(sehirici+sehirdisi+yolTutusu+suruss+yolcuu+icc+diss+hizz+guvenlikk)/9;
            ortalama=double.tryParse(ortalama.toStringAsFixed(1));
          });
          puanlama();
          guvenlikOrt();
          anaPuan();
          kisiSay();


          Navigator.push(context, MaterialPageRoute(builder: (
              BuildContext context) => sonuc(ort:ortalama,marka: widget.marka,model: widget.model,)));
        },
        child: Container(
          width: 170,
          height: 50,

          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(30)
          ),
        child: Center(child: Text("Paylaş",style: TextStyle(color: Colors.white,fontSize: 17),)),
        ),
      ),

    );
  }

  void puanlama() async {
    try {
      Map<String, dynamic> puanlama = Map();
      puanlama["kullanici"]=_auth.currentUser.displayName;
      puanlama["kisiPp"]=_auth.currentUser.photoURL;
      puanlama["pp"]=widget.oto;
      puanlama["marka"]=widget.marka;
      puanlama["model"]=widget.model;
      puanlama["ortalama"]=ortalama;
      puanlama["yolTutuş"]=yolTutusu;
      puanlama["sehirIci"]=sehirici;
      puanlama["sehirDisi"]=sehirdisi;
      puanlama["surus"]=suruss;
      puanlama["yolcu"]=yolcuu;
      puanlama["icDizayn"]=icc;
      puanlama["disDizayn"]=diss;
      puanlama["hiz"]=hizz;
      puanlama["guvenlik"]=guvenlikk;

      FirebaseFirestore.instance.collection("puanlama").doc(widget.model+_auth.currentUser.email).set(puanlama, SetOptions(merge: true));
    } catch (e) {
      debugPrint("hataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+e.toString());
    }

  }
  void anaPuan() async {
    try {
      Map<String, dynamic> puanlama = Map();
      puanlama["kullanici"]=_auth.currentUser.displayName;
      puanlama["kisiPp"]=_auth.currentUser.photoURL;
      puanlama["pp"]=widget.oto;
      puanlama["marka"]=widget.marka;
      puanlama["model"]=widget.model;
      puanlama["ortalama"]=enGenelOrt;
      puanlama["yolTutuş"]=enGenelYol;
      puanlama["sehirIci"]=enGenelYakit;
      puanlama["sehirDisi"]=sehirdisi;
      puanlama["surus"]=enGenelSurus;
      puanlama["yolcu"]=yolcuu;
      puanlama["icDizayn"]=icc;
      puanlama["disDizayn"]=diss;
      puanlama["hiz"]=enGenelHizlanma;
      puanlama["guvenlik"]=enGenel;
      puanlama["kisi"]=0;

     await FirebaseFirestore.instance.collection("anasayfada").doc(widget.model).set(puanlama, SetOptions(merge: true));
    } catch (e) {
      debugPrint("hataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+e.toString());
    }

  }
  void kisiSay() async{
  await _firestore.collection("puanlama").where("model", isEqualTo: widget.model).get().then((value) {
     _firestore.collection("anasayfada").doc(widget.model).update({'kisi':value.docs.length});
    });
  }
  void guvenlikOrt()async{
    await _firestore.collection("puanlama").where("model", isEqualTo: widget.model).get().then((value) {
        for(var i in value.docs){
          setState(() {
            genelGuvenlik=(i.data()["guvenlik"]+genelGuvenlik);
            enGenel=genelGuvenlik/value.docs.length;

            genelYol=(i.data()["yolTutuş"]+genelYol);
            enGenelYol=genelYol/value.docs.length;

            genelHizlanma=(i.data()["hiz"]+genelHizlanma);
            enGenelHizlanma=genelHizlanma/value.docs.length;

            genelSurus=(i.data()["surus"]+genelSurus);
            enGenelSurus=genelSurus/value.docs.length;

            genelYakit=(i.data()["sehirIci"]+genelYakit);
            enGenelYakit=genelYakit/value.docs.length;

            genelSehirDisi=(i.data()["sehirDisi"]+genelSehirDisi);
            enGenelSehirDisi=genelSehirDisi/value.docs.length;

            genelYolcu=(i.data()["yolcu"]+genelYolcu);
            enGenelYolcu=genelYolcu/value.docs.length;

            genelIcDizayn=(i.data()["icDizayn"]+genelIcDizayn);
            enGenelIcDizayn=genelIcDizayn/value.docs.length;

            genelDisDizayn=(i.data()["disDizayn"]+genelDisDizayn);
            enGenelDisDizayn=genelDisDizayn/value.docs.length;

            genelOrt=(i.data()["ortalama"]+genelOrt);
            enGenelOrt=genelOrt/value.docs.length;
          });
        }
        debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+genelGuvenlik.toString());
          _firestore.collection("anasayfada").doc(widget.model).update({'icDizayn':enGenelIcDizayn,'disDizayn':enGenelDisDizayn,
            'sehirDisi':enGenelSehirDisi,'yolcu':enGenelYolcu,'guvenlik':enGenel,'yolTutuş':enGenelYol, 'hiz':enGenelHizlanma,
            'surus':enGenelSurus,'sehirIci':enGenelYakit,
            'ortalama':double.tryParse(enGenelOrt.toStringAsFixed(1))});
          setState(() {
            genelYakit=0;
            genelGuvenlik=0;
            genelYol=0;
             genelSurus=0;
            genelHizlanma=0;
            genelOrt=0;
            genelIcDizayn=0;
            genelDisDizayn=0;
            genelSehirDisi=0;
            genelYolcu=0;
          });
    });

  }


}
