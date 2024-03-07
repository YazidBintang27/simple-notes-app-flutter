import 'package:basic_notes_app/add_data_page.dart';
import 'package:basic_notes_app/data_source.dart';
import 'package:basic_notes_app/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DataSource dataSource = DataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                "Notes App",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 20),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.to(const AddDataPage());
            setState(() {
              dataSource.dataList.add(result);
            });
          },
          backgroundColor: Colors.blue.shade400,
          child: const Icon(
            Icons.edit_note_rounded,
            color: Colors.white,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    label: Text(
                      "Search",
                      style: GoogleFonts.inter(),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: dataSource.dataList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () async {
                              final result = await Get.to(
                                  DetailPage(data: dataSource.dataList[index]));
                              setState(() {
                                dataSource.dataList[index] = result;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(100, 33, 33, 33),
                                        blurRadius: 6.0,
                                        offset: Offset(0.0, 2.0))
                                  ],
                                  color: Colors.white),
                              margin: const EdgeInsets.all(4),
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    dataSource.dataList[index]['title'],
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Text(
                                      dataSource.dataList[index]['note'],
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text(
                                                    "Delete note?",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  content: Text(
                                                    "This will delete your note permanently.",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text("Cancel")),
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            dataSource.dataList
                                                                .removeAt(
                                                                    index);
                                                          });
                                                          Get.back();
                                                        },
                                                        child: Text("Delete"))
                                                  ],
                                                )),
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                            ));
                      }))
            ],
          ),
        ));
  }
}
