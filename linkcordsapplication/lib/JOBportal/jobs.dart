import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<StatefulWidget> createState() => _jobsState();
}

class _jobsState extends State {
  Future<void> _launchyoutUbe(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
    //  late Future _launched;
  }

  // ignore: unused_element
  /*Widget _launchStatus(BuildContext context, AsyncSnapshot snapshot){
    if()
  }*/
  @override
  Widget build(BuildContext context) {
    Uri abcd = Uri.parse(
        "https://www.simplyhired.co.in/search?q=freshers+%28it+company%29&l=pune%2C+maharashtra");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jobs'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Expanded(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 249, 246, 245),
                        Color.fromARGB(249, 190, 219, 224),
                      ]),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Recommended for you',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 2, // How much the shadow spreads
                                blurRadius: 5, // How blurred the shadow is
                                offset: const Offset(0,
                                    3), // The shadow's position relative to the container
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            // Optional: rounded corners
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'SimplyHired',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8.0),
                                const Text('Tech Co.'),
                                const SizedBox(height: 8.0),
                                const Text('San Francisco, CA'),
                                const SizedBox(height: 16.0),
                                const Row(
                                  children: [
                                    Icon(Icons.access_time, size: 16),
                                    SizedBox(width: 4.0),
                                    Text('Posted 2 days ago'),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    await _launchyoutUbe(Uri.parse(
                                        "https://www.simplyhired.co.in/search?q=freshers+%28it+company%29&l=pune%2C+maharashtra&job=e-dY6iee3lkULjXZOS9uyQlg2zKsvh66Kw0SCOt0NLIFSfNt_x47vA"));
                                    setState(() {});
                                  },
                                  child: const Text('Apply'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
