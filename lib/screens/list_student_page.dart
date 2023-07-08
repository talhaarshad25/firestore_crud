
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/screens/udpate_student_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class listStudentPage extends StatefulWidget {
  const listStudentPage({Key? key}) : super(key: key);

  @override
  State<listStudentPage> createState() => _listStudentPageState();
}

class _listStudentPageState extends State<listStudentPage> {

  //fetch collections from firebase firestore
  final Stream<QuerySnapshot> studentsstream = FirebaseFirestore.instance.collection('students').snapshots();

  // For deleteing user
  CollectionReference students= FirebaseFirestore.instance.collection('students');
  Future<void> deleteuser(id){
    // print('user deleted $id');
    return students.doc(id).delete().then((value) => Fluttertoast.showToast(
      msg: "User Deleted",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    ))
        .catchError((error)=>Fluttertoast.showToast(
      msg: "Failed to Delete user: $error",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    ) );
  }


  @override
  Widget build(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(stream:studentsstream,
      builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>Snapshot){
        if(Snapshot.hasError){
          print('Something went Wrong');
        }
        if(Snapshot.connectionState ==ConnectionState.waiting){
          return Center(child:CircularProgressIndicator(),);
        }
        // to fetch data from documents
        final List storedocs = [];
        Snapshot.data!.docs.map((DocumentSnapshot document){
            Map a =  document.data() as Map<String, dynamic >;
            storedocs.add(a);
            a['id']=document.id;
        }).toList();


        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int,TableColumnWidth>{
                  1:FixedColumnWidth(180),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                                child: Text('Name',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                                child: Text('Email',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                                child: Text('Name',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ]
                  ),
                  for (var i=0; i<storedocs.length; i++)...[
                  TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            child: Center(
                                child: Text(storedocs[i]['name'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            child: Center(
                                child: Text(storedocs[i]['email'],style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        TableCell(
                            child: Row(
                              children: [
                                IconButton(onPressed: ()=>{Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>UpdateStudentPage(id: storedocs[i]['id']),))},
                                  icon: Icon(Icons.edit),color: Colors.orange,),
                                IconButton(onPressed: ()=>{deleteuser(storedocs[i]['id'])},
                                  icon: Icon(Icons.delete),color: Colors.red,),
                              ],
                            )
                        ),
                      ]
                  ),

                  ]

                ],
              ),
            ),
          ),
        );
      },);

  }
}
