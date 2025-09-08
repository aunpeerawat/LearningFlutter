import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/models/person.dart';
import 'package:myproject/screens/addForm.dart';

class LV extends StatefulWidget {
  const LV({super.key});

  @override
  State<LV> createState() => _ItemState();
}

class _ItemState extends State<LV> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: data[index].job.color,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].name,
                          style: GoogleFonts.k2d(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Age ${data[index].age} years, Job: ${data[index].job.title}",
                          style: GoogleFonts.k2d(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(data[index].job.image, width: 70, height: 70),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => const Addform()),
              );
            },
            icon: Icon(Icons.add, size: 40, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
