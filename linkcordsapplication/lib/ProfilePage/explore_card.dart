import 'package:flutter/material.dart';
// import 'package:flutter_application_1/network.dart';
import 'package:linkcordsapplication/ProfilePage/network.dart';

class SingleNetworkUserWidget extends StatefulWidget {
  final NetworkEntity network;
  const SingleNetworkUserWidget({super.key, required this.network});

  @override
  State<SingleNetworkUserWidget> createState() =>
      _SingleNetworkUserWidgetState();
}

class _SingleNetworkUserWidgetState extends State<SingleNetworkUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(202, 204, 206, 1)),
                child: Image.asset(
                  "assets/${widget.network.userBgImage}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${widget.network.username}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${widget.network.userBio}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(86, 86, 91, 1)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.group),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "${widget.network.mutualConnections} mutual connections",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: Color.fromRGBO(86, 86, 91, 1)),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Connect",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(86, 86, 91, 1), shape: BoxShape.circle),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/${widget.network.userProfileImage}",
                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
