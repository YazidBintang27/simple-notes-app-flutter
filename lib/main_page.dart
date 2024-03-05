import 'package:basic_notes_app/add_data_page.dart';
import 'package:basic_notes_app/data_source.dart';
import 'package:basic_notes_app/detail_page.dart';
import 'package:flutter/material.dart';
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
            final coba = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDataPage()));
            setState(() {
              dataSource.dataList.add(coba);
            });
          },
          backgroundColor: Colors.orange.shade300,
          child: const Icon(
            Icons.add,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          data: dataSource.dataList[index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dataSource.dataList[index]['title'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade400,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      dataSource.dataList[index]['note'],
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
