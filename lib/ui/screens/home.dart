
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
       DateTime now = DateTime.now();
      String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
      createData(){
    
     DocumentReference documentReference=Firestore.instance.collection("DateTime").document(formattedDate);
    //  print("******document id******* "+ds.documentID);
      Map<String, dynamic> date={
      "Date":formattedDate,
};
documentReference.setData(date).whenComplete((){
  print("$formattedDate created");
});
}
return MaterialApp(
  home: DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.access_alarm),text: "Alarm",),
            Tab(icon: Icon(Icons.access_time),text:"Clock" ,),
            Tab(icon: Icon(Icons.timer),text:"Timer"),
          ],
        ),
        title: Text('Tabs Demo'),backgroundColor: Colors.black,
      ),
      body: TabBarView(
        children: [
          Icon(Icons.access_alarm),
          Center(child:
          Column(children:<Widget>[
          Text(formattedDate,textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),

              SizedBox(
              width: 100.0,
                height: 50.0,
               child:RaisedButton(
                       
                      textColor: Colors.white,
              color: Colors.blue,   
  //            //  padding: const EdgeInsets.all(8.0),
              child: Text("Done"),
              onPressed: (){
                createData();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Player()));             
              }
            ),
      ),
      
        ])),
          Icon(Icons.timer),
        ],
        
      ),
    ),
  ),
);
  }
}
