import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otopuan/hosgeldin.dart';

import 'giris.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home: hosgeldin(),
  ));
}



