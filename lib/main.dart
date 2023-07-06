import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future:_initialization,builder: (context,snapshot){
      if(snapshot.hasError){
        print('Something Went Wrong');
      }
      //once completed Show application
      if(snapshot.connectionState==ConnectionState.done){
        return  MaterialApp(
          title: 'Firestore Crud',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Homepage(),
        );
      }
      return CircularProgressIndicator();
    },);


  }
}

