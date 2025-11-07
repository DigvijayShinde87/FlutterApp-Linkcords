import 'package:flutter/material.dart';
import 'package:linkcordsapplication/JOBportal/jobLink.dart';
import 'package:url_launcher/url_launcher.dart';

class Jobs1 extends StatefulWidget {
  const Jobs1({super.key});

  @override
  State<StatefulWidget> createState() => _jobsState();
}

class _jobsState extends State {
  List<Joblink> companyLink = [
    Joblink(
        compName: "Wipro",
        link: "https://careers.wipro.com/careers-home/jobs",
        compImag:
            "https://upload.wikimedia.org/wikipedia/commons/a/a0/Wipro_Primary_Logo_Color_RGB.svg",
        postTime: "Posted 2 days ago",
        companyPlace: null),
    Joblink(
        compName: "Tata Consultancy Services",
        link: "https://www.tcs.com/careers/india",
        compImag:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcyLmfVn46KtwJXHi3uUCoKLWoCrxWqeGGBA&s",
        postTime: "Posted 3 days ago",
        companyPlace: null),
    Joblink(
        compName: "Johnson Control",
        link:
            "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjNyIjf4fGJAxVICnsHHURaK7MYABABGgJ0bQ&co=1&ase=2&gclid=CjwKCAiA9IC6BhA3EiwAsbltOPjYdS_XaO1dn1oU3fLKjvo7sA9BuPUBfQIPmOmy-jjbBO-2z4r6VhoCjWEQAvD_BwE&ohost=www.google.com&cid=CAESV-D2GOQySNSx7n1KubgQRM5g3EeGv3NmyND1v1vHj2UgVRSvl5arB93PSFO5mSNgByU5d1QvBzpqHDqTv7k1hZbEuTLkba8VypyU014kPO0JK9vj5-x-mA&sig=AOD64_1OHRV22OiecMCh_R5FY1dgn0Xefg&q&nis=4&adurl&ved=2ahUKEwiVwoPf4fGJAxXVja8BHYIwAY8Q0Qx6BAgKEAE",
        compImag:
            "https://upload.wikimedia.org/wikipedia/en/thumb/0/0f/Johnson_Controls.svg/1200px-Johnson_Controls.svg.png",
        postTime: "Posted 4 days ago",
        companyPlace: null),
    Joblink(
        compName: "SimplyHire",
        link:
            "https://www.simplyhired.co.in/search?q=freshers+%28it+company%29&l=pune%2C+maharashtra",
        compImag:
            "https://abzartrading.com/wp-content/uploads/2023/09/Simply-hired-300x300.webp",
        postTime: "Posted 2 days ago",
        companyPlace: null),
    Joblink(
        compName: "Indeed",
        link:
            "https://in.indeed.com/q-top-company-freshers-l-pune,-maharashtra-jobs.html",
        compImag:
            "https://logos-world.net/wp-content/uploads/2021/03/Indeed-Logo-2004.png",
        postTime: "Posted 5 days ago",
        companyPlace: null),
    Joblink(
        compName: "Accenture",
        link: "https://www.accenture.com/in-en/careers/local/technology-grads",
        compImag:
            "https://crystalpng.com/wp-content/uploads/2024/09/Accenture-Logo.png",
        postTime: "Posted 20 days ago",
        companyPlace: null),
    Joblink(
        compName: "Jobeka.com",
        link:
            "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjNyIjf4fGJAxVICnsHHURaK7MYABACGgJ0bQ&co=1&ase=2&gclid=CjwKCAiA9IC6BhA3EiwAsbltOFLAG_APlKK95_aM20_NCdgwzPPH0LNq48i5YqemQRI5bfSPwOIAjRoCv4kQAvD_BwE&ohost=www.google.com&cid=CAESV-D2GOQySNSx7n1KubgQRM5g3EeGv3NmyND1v1vHj2UgVRSvl5arB93PSFO5mSNgByU5d1QvBzpqHDqTv7k1hZbEuTLkba8VypyU014kPO0JK9vj5-x-mA&sig=AOD64_0fsY84IAz8JuIhScDDRC77DwATfw&q&nis=4&adurl&ved=2ahUKEwiVwoPf4fGJAxXVja8BHYIwAY8Q0Qx6BAgLEAE",
        compImag:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN1qznN8gGgIM6c6snVmGrB7cJG2fK-nEvFjd9vpRDZvkl2Zgn1JPsScs50cOH_X3pXr0&usqp=CAU",
        postTime: "Posted 12 days ago",
        companyPlace: null)
  ];
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
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    // Uri abcd = Uri.parse(
    //     "https://www.simplyhired.co.in/search?q=freshers+%28it+company%29&l=pune%2C+maharashtra");
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
        body: Stack(
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
                      itemCount: companyLink.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 243, 240, 240),
                              Color.fromARGB(255, 188, 212, 249),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    companyLink[index].compName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text('Tech Co.'),
                                  const SizedBox(height: 8.0),
                                  const Text('San Francisco, CA'),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 16),
                                      const SizedBox(width: 4.0),
                                      Text(companyLink[index].postTime),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await _launchyoutUbe(Uri.parse(
                                          companyLink[index].link
                                          //"https://www.simplyhired.co.in/search?q=freshers+%28it+company%29&l=pune%2C+maharashtra&job=e-dY6iee3lkULjXZOS9uyQlg2zKsvh66Kw0SCOt0NLIFSfNt_x47vA"
                                          ));
                                      setState(() {});
                                    },
                                    child: const Text('Apply'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 180,
                                  width: 130,
                                  child: Image.network(
                                      companyLink[index].compImag))
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ));
  }
}
