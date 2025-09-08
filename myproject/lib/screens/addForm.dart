import 'package:flutter/material.dart';
import 'package:myproject/main.dart';
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
        child: Form(
          key: _fromkey,
          child: Column(
          children: [
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                label: Text("Name",style: TextStyle(fontSize: 20),)
              ),
              validator: (value){
                if (value==null || value.isEmpty){
                  return "Please input name";
                }
                return null;
              },
              onSaved: (value){
                _name=value!;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Age",style: TextStyle(fontSize: 20),)
              ),
              validator: (value){
                if (value==null || value.isEmpty){
                  return "Please input age";
                }
                return null;
              },
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
            FilledButton(onPressed: (){
              _fromkey.currentState!.validate();
              _fromkey.currentState!.save();
              data.add(
                Person(name: _name, age: _age, job: _job)
              );
              _fromkey.currentState!.reset();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx) => const MyApp()),
              );
            }, child: Text("SAVE",style: TextStyle(fontSize: 20),),style: FilledButton.styleFrom(backgroundColor: Colors.blue),)
          ],
        )),),
      ),
    );
  }
}