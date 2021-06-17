
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otopuan/paylasimDetay.dart';

import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'giris.dart';
class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}
PickedFile _secilenResim;
PickedFile _kameradanSecilenResim;
String gelenUrl;
Random random = new Random();
int randomNumber;
FirebaseStorage _storage =FirebaseStorage.instance;
FirebaseAuth _auth=FirebaseAuth.instance;
FirebaseFirestore _firestore=FirebaseFirestore.instance;
class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!=null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent.shade700.withOpacity(0.9),
          title: Text("Profil"),
        ),
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.18,
                child: Row(
                  children: [
                    SizedBox(width: 7,),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            _auth.currentUser.photoURL, errorBuilder: (
                              BuildContext context, Object exception,
                              StackTrace stackTrace) {
                            return Icon(Icons.account_circle, size: 90,);
                          }, fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 60),
                          child: InkWell(
                            onTap: () {
                              _showDialog();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.settings_outlined),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10,),
                    Container(
                      child: Text(_auth.currentUser.displayName==null?"Bilgileriniz Yükleniyor":_auth.currentUser.displayName,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 25),),


                    )
                  ],
                ),
              ),
              Container(
                color: Colors.tealAccent.shade700.withOpacity(0.9),
                height:40,
                child: Center(child: Text("Puanladığın Otomobiller",style: TextStyle(color: Colors.white),))
              ),
              Container(
                height: 0.7,
                color: Colors.grey.shade400,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.63,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("puanlama")
                        .where(
                        "kullanici", isEqualTo: _auth.currentUser.displayName)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data != null) {
                        return GridView.builder(

                          itemCount: snapshot.data.docs.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot doc = snapshot.data.docs[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        paylasimDetay(marka: doc["marka"],
                                          model: doc["model"],
                                          oto: doc["pp"],
                                          puan: doc["ortalama"],)));
                              },
                              child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Image.asset(doc["pp"]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Container(
                                          height: 35,


                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: FractionalOffset
                                                    .bottomCenter,
                                                end: FractionalOffset
                                                    .topCenter,
                                                colors: [
                                                  Colors
                                                      .black.withOpacity(0.5),
                                                  Colors
                                                      .transparent
                                                ]

                                            ),),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 5,),
                                              Icon(Icons.star,
                                                color: Colors.orangeAccent,),
                                              SizedBox(width: 5,),
                                              Text(doc["ortalama"].toString()==null?"-":doc["ortalama"].toString(),
                                                style: TextStyle(
                                                    color: Colors.white),),
                                              SizedBox(width: 5,),

                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            );
                          },

                        );
                      } else {
                        return Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      );
    }else{
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }


  void _showDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(

        title: Container(

          child: Column(
            children: [
              InkWell(
                onTap: (){

                  Navigator.pop(context);
                  _showDialog2();
                },
                child: Container(
                  child: Center(child: Text("Profil Fotoğrafını Değiştir"),),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height:1,
                width: 230,
                color: Colors.blueGrey.withOpacity(0.4),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: ()async{
                  Navigator.pop(context);
                  await _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>giris()));

                },
                child: Container(
                  child: Center(child: Text("Çıkış Yap"),),
                ),
              )
            ],
          )
        ),

      );
    });
  }
  void _showDialog2() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(

        title: Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Kamera();
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.camera_alt_outlined, color: Colors.black87, size: 60,),
                ),
              ),
              SizedBox(width: 35,),
              Container(
                height: 85,
                width: 1,
                color: Colors.blueGrey.withOpacity(0.4),
              ),
              SizedBox(width: 35,),
              InkWell(
                onTap: () {
                  Galeri();
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.broken_image_outlined, color: Colors.black87, size: 60,),
                ),
              ),
            ],
          ),
        ),

      );
    });
  }

  void Galeri() async {
    var resim = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 30);
    setState(() {
      _secilenResim = resim;
    });
    yukleme();
    Reference ref = _storage.ref().child(_auth.currentUser.email);
    var _upload = await ref.putFile(File(_secilenResim.path));
    var gln = await (_upload.ref.getDownloadURL());
    gelenUrl = gln.toString();

      await _auth.currentUser.updatePhotoURL(gelenUrl);

    Navigator.pop(context);

    print("url alındı" + gelenUrl);

  }


  void Kamera() async {
    var resim = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 30);
    setState(() {
      _kameradanSecilenResim = resim;
    });
    yukleme();
    Reference ref = _storage.ref().child(_auth.currentUser.email);
    var _upload = await ref.putFile(File(_kameradanSecilenResim.path));
    var gln = await _upload.ref.getDownloadURL();
    gelenUrl = gln.toString();
      await _auth.currentUser.updatePhotoURL(gelenUrl, );
    Navigator.pop(context);

    print("url alındı" + gelenUrl);

  }

  void yukleme() {
    showDialog(
      context: context,
      builder: (context) =>
          Center(
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoActivityIndicator(),
              ),
            ),
          ),
    );
  }
}
