import 'package:flutter/material.dart';
import 'package:linkcordsapplication/JOBportal/jobs.dart';

class Internship extends StatefulWidget {
  const Internship({super.key});

  @override
  State<StatefulWidget> createState() => _internshipState();
}

class _internshipState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 250, 238, 234),
                  Color.fromARGB(248, 230, 243, 246),
                ]),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50)),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Find your",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "     Jobs",
                        style: TextStyle(
                            color: Color.fromARGB(255, 59, 16, 16),
                            fontSize: 44,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              //prefixIcon: Icons(Icon.search),
                              hintText: "Search you're looking for",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const Text(
                          "FIND...",
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 75, 77),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 380,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 249, 246, 245),
                                    Color.fromARGB(255, 188, 212, 249),
                                  ]),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    const Text(
                                      " TRENDING AT #1",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      " Jobs for Freshers ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const Jobs();
                                          }));
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                          Color.fromARGB(255, 188, 212, 249),
                                        )),
                                        child: const Text(
                                          "view all",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 380,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 249, 246, 245),
                                    Color.fromARGB(249, 190, 158, 189),
                                  ]),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 62, 2, 50))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    const Text(
                                      " TRENDING AT #2",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      " Part time Jobs",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 66, 2, 51),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 118, 11, 81))),
                                      child: const Text(
                                        "view all",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 380,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 249, 246, 245),
                                    Color.fromARGB(249, 176, 234, 164),
                                  ]),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 101, 199, 110))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    const Text(
                                      " TRENDING AT #3",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Work from home ",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 118, 192, 142),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 86, 180, 96))),
                                      child: const Text(
                                        "view all",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 380,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 249, 246, 245),
                                    Color.fromARGB(248, 149, 195, 233),
                                  ]),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 32, 98, 146))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    const Text(
                                      " TRENDING AT #4",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      " Jobs for Women",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 12, 146, 172),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 19, 121, 184))),
                                      child: const Text(
                                        "view all",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 251, 253, 253),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class Url {}
