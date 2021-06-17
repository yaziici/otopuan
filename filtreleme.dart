import 'package:flutter/material.dart';
import 'package:otopuan/anasayfa.dart';
import 'package:otopuan/markaSecim.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'anasayfa2.dart';
class filtreleme extends StatefulWidget {
  @override
  _filtrelemeState createState() => _filtrelemeState();
}
FirebaseAuth _auth=FirebaseAuth.instance;
List<String> markalar=["Audi","BMW","Mercedes","Volkswagen","Renault","Hyundai","Opel","Ferrari","AstonMartin","Cadillac"];
List<List> modeller=[Audi,BMW,Mercedes,Volkswagen,Renault,Hyundai,Opel,Ferrari,AstonMartin,Cadillac];
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

int width,height;
String secilen="Audi";
int groupValue=-1;
class _filtrelemeState extends State<filtreleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtre Oluştur"),
        elevation: 0,
        backgroundColor: Colors.cyanAccent.shade700.withOpacity(0.9),
      ),
      body:  Container(
    child: Center(
      child: Container(
        width: 300,
        height: 500,
        child: Column(

          children: [
            _radio(
                0, "Vazgeç", (yeniDeger){setState(() {groupValue=yeniDeger;});
            }),
            _radio(
                1, "En Güvenli Otomobilleri Filtrele", (yeniDeger){setState(() {groupValue=yeniDeger;
                debugPrint("yeniiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"+groupValue.toString());
                });
            }),
            _radio(
                2, "En Rahat Otomobilleri Filtrele", (yeniDeger){setState(() {groupValue=yeniDeger;});
            }),
            _radio(
                3, "En Hızlı Otomobilleri Filtrele", (yeniDeger){setState(() {groupValue=yeniDeger;});
            }),
            _radio(
                4, "Yol Tutuşu En İyi Otomobilleri Filtrele", (yeniDeger){setState(() {groupValue=yeniDeger;});
            }),

            _radio(
                5, "Markaya Göre Filtrele", (yeniDeger){setState(() {groupValue=yeniDeger;});
            }),
            Container(
              width: MediaQuery.of(context).size.width,
              height: groupValue==5?100:0,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                                          items: markalar.map((e){
                                        return DropdownMenuItem<String>(
                                        child: new Text(e),
                                        value:e);
                                        }).toList(),

                      hint: Text("Marka"),
                      value: secilen,
                      onChanged: (newValue) {
                        setState(() {
                          secilen = newValue;
                        });
                      },



                  ),



                ],
              ),

            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                if(_auth.currentUser!=null) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) =>
                          anasayfa(groupValue: fitre(), modell: groupValue,)));
                }else{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) =>
                          anasayfa2(groupValue: fitre(), modell: groupValue,)));
                }

              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.teal
                ),
                child: Center(child: Text("Seçimi Tamamla",style: TextStyle(color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    ),
    ),
    );
  }
  Widget _radio(int value, String title, Function onChanged){
    return RadioListTile(
      activeColor: Colors.teal,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),);
  }

  Object fitre(){
    if(groupValue==0){
      return "ortalama";
    }
    if(groupValue==1){
      return "guvenlik";
    }
    if(groupValue==2){
      return "surus";
    }
    if(groupValue==3){
      return "hiz";
    }
    if(groupValue==4){
      return "yolTutuş";

    }
    if(groupValue==5){
      return secilen;}
    else{
      return "ortalama";
    }
  }
}
