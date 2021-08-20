import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';

class Fire {
  static fb.Database database = FirebaseHelper.initDatabase();
}

class FirebaseHelper{
  static fb.Database initDatabase() {
    try{
      if(fb.apps.isEmpty){
        fb.initializeApp(
          apiKey: "AIzaSyB2xNsk_0LAnuP-RiwoeQzOQ1Cbgk7yHY0",
          authDomain: "inprogress-cd5f3.firebaseapp.com",
          databaseURL: "https://inprogress-cd5f3-default-rtdb.firebaseio.com",
          projectId: "inprogress-cd5f3",
          storageBucket: "inprogress-cd5f3.appspot.com",
          messagingSenderId: "574916733681",
          appId: "1:574916733681:web:c453b2c9687b7542de1750",
          measurementId: "G-LSF0M6E3LC"
        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e){
      print(e);

    }
    return fb.database();
  }
}

Future<String> getOnce(fb.DatabaseReference AdsRef) async {
  String aux;
  await AdsRef.once('value').then((value) => {aux = value.snapshot.val()});
  return aux;
}

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value')
      .then((value) => {list = result(value.snapshot, list)});
  return list;
}

List result(DataSnapshot dp, List list) {
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}