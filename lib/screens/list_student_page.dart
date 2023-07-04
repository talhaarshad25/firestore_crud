
import 'package:firestore_crud/screens/udpate_student_page.dart';
import 'package:flutter/material.dart';

class listStudentPage extends StatefulWidget {
  const listStudentPage({Key? key}) : super(key: key);

  @override
  State<listStudentPage> createState() => _listStudentPageState();
}

class _listStudentPageState extends State<listStudentPage> {

  deleteuser(id){
    print('user deleted $id');
  }


  @override
  Widget build(BuildContext context) {
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
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      child: Center(
                          child: Text('Talha',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      child: Center(
                          child: Text('juttt730@gmail.com',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  TableCell(
                    child: Row(
                      children: [
                        IconButton(onPressed: ()=>{Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UpdateStudentPage(),))},
                          icon: Icon(Icons.edit),color: Colors.orange,),
                        IconButton(onPressed: ()=>{deleteuser(1)},
                          icon: Icon(Icons.delete),color: Colors.red,),
                      ],
                    )
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
