import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const DetailPage({super.key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerTitle = TextEditingController(text: widget.data['title']);
    controllerNote = TextEditingController(text: widget.data['note']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          IconButton(
              onPressed: () {
                Get.back(result: widget.data);
              },
              icon: const Icon(Icons.edit_document)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: controllerTitle,
              onChanged: (value) => widget.data['title'] = value,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), label: Text("Title")),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerNote,
              onChanged: (value) => widget.data['note'] = value,
              decoration: const InputDecoration(
                  border: InputBorder.none, label: Text("Note")),
            )
          ],
        ),
      ),
    );
  }
}
