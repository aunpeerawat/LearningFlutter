import 'package:flutter/material.dart';
import 'package:myproject/models/person.dart';

class Addform extends StatefulWidget {
  const Addform({super.key});

  @override
  State<Addform> createState() => _AddformState();
}

class _AddformState extends State<Addform> {
  final _fromkey = GlobalKey<FormState>();
  String _name='';
  int _age=20;
  Job _job = Job.police;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mt Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(15),
        child: Form(child: Column(
          children: [
            TextFormField(
              key: _fromkey,
              maxLength: 20,
              decoration: InputDecoration(
                label: Text("Name",style: TextStyle(fontSize: 20),)
              ),
              onSaved: (value){
                _name=value!;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Age",style: TextStyle(fontSize: 20),)
              ),
              onSaved: (value){
                _age=int.parse(value.toString());
              },
            ),
            SizedBox(height: 20,),
            DropdownButtonFormField(
              value: _job,
              decoration: InputDecoration(
                label: Text("Job",style: TextStyle(fontSize: 20),)
              ),
              items: Job.values.map((key){
              return DropdownMenuItem(value: key,child: Text(key.title),);
            }).toList(), onChanged: (value){
              setState(() {
                _job=value!;
              });
            }),
            FilledButton(onPressed: (){}, child: Text("SAVE",style: TextStyle(fontSize: 20),),style: FilledButton.styleFrom(backgroundColor: Colors.blue),)
          ],
        )),),
      ),
    );
  }
}