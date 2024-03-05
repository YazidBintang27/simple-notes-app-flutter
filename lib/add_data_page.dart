import 'package:basic_notes_app/main_page.dart';
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
          title: const Text("Add Notes"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.note_add_outlined,
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
              TextField(
                onChanged: (value) => data['title'] = value,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), label: Text("Title")),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => data['note'] = value,
                decoration: const InputDecoration(
                    border: InputBorder.none, label: Text("Note")),
              )
            ],
          ),
        ));
  }
}
