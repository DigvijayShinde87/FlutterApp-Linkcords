import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:linkcordsapplication/ProfilePage/profile.dart';

class Conection extends StatefulWidget {
  const Conection({super.key});

  @override
  State<StatefulWidget> createState() => _CreateState();
}

class _CreateState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Connections",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 212, 249),
      ),
      body: ListView.builder(
          itemCount: profilmodel[0].connections.length,
          itemBuilder: (context, int index) {
            return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 188, 212, 249),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text("${index + 1}.  ")),
                            Container(
                              child: Text(
                                profilmodel[0].connections[index],
                                style: const TextStyle(
                                  
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 3, 3),
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 90,
                            // ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            profilmodel[0].connections.removeAt(index);
                            log("removed");
                            setState(() {});
                          },
                          child: const Icon(Icons.delete)),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
