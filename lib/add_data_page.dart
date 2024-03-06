import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {'title': '', 'note': ''};
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Notes",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit_note_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back(result: data);
              },
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 16, right: 20, left: 20),
          child: Column(
            children: [
              TextField(git 
                maxLength: 30,
                maxLines: 1,
                onChanged: (value) => data['title'] = value,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Title'),
              ),
              TextField(
                maxLines: 10,
                onChanged: (value) => data['note'] = value,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note'),
              )
            ],
          ),
        ));
  }
}
