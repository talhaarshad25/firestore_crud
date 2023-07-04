

import 'package:firestore_crud/screens/add_student_page.dart';
import 'package:firestore_crud/screens/list_student_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('flutter FireStore Crud'),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>AddStudentPage(),));
              },
                child:Text('add',style: TextStyle(fontSize: 20.0),),
            style:ElevatedButton.styleFrom(primary:Colors.deepPurple),
            ),
          ],
        ),

      ),
      body: listStudentPage(),
    );
  }
}
