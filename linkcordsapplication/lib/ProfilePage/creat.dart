import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget{
  const Profile2({super.key});
  
  @override
  State<StatefulWidget> createState() =>_profileState();
  
}
// ignore: camel_case_types
class _profileState extends State{
  @override
  Widget build(BuildContext context){
   return Scaffold(
   body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
             Row(
              children: [
               Container(
               height: 50,
               width: 55,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
               color: Colors.black
                ),
              ),
              const Text(" sneha gadade",
                                  style:TextStyle(
                                    color: Color.fromARGB(255, 14, 3, 3),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ) ,),

                const Spacer(),
                IconButton(onPressed: (){},
                 icon: const Icon(Icons.image_outlined)),
                 const SizedBox(width: 10,),
                IconButton(onPressed: (){},
                 icon: const Icon(Icons.watch_later_outlined)),
                
                                            
                      ],
                    ),
                    const SizedBox(height: 50,),
                    const TextField(
                          decoration: InputDecoration(
                            hintText: "Share your thoughts...",
                          ),
                         )  ,
                        const SizedBox(height: 50,),
                   ElevatedButton(onPressed: (){},
                                               style: ElevatedButton.styleFrom(
                                          side: const BorderSide(
                                            color: Colors.blue,
                                          )
                                                                         
                                           ),
                                          // child: const Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                           child:  const Text(
                                           "Post",
                                           style: TextStyle(
                                          color: Color.fromARGB(255, 24, 38, 230)
                                           ),
                                             )
                                          ),     
                  ]
        ),
      )
     );
  }
}