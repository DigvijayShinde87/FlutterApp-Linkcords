import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikchatbot/ikchatbot.dart';
import 'package:linkcordsapplication/Bot/keywords_responce.dart';

class Chattwithbot extends StatefulWidget {
  const Chattwithbot({super.key});

  @override
  State<Chattwithbot> createState() => _ChattwithbotState();
}

class _ChattwithbotState extends State<Chattwithbot> {
  @override
  Widget build(BuildContext context) {
    final chatBotConfig = IkChatBotConfig(
      //SMTP Rating to your mail Settings

      ratingIconYes: const Icon(Icons.star),
      ratingIconNo: const Icon(Icons.star_border),
      ratingIconColor: Colors.black,
      ratingBackgroundColor: Colors.white,
      ratingButtonText: 'Submit Rating',
      thankyouText: 'Thanks for your rating!',
      ratingText: 'Rate your experience:',
      ratingTitle: 'Thank you for using the chatbot!',
      body: 'This is a test email sent from Flutter and Dart.',
      subject: 'Test Rating',
      recipient: 'recipient@example.com',
      isSecure: false,
      senderName: 'Your Name',
      smtpUsername: 'Your Email',
      smtpPassword: 'your password',
      smtpServer: 'stmp.gmail.com',
      smtpPort: 587,
      
      sendIcon: const Icon(Icons.send, color: Colors.black),
      userIcon: const Icon(Icons.person, color: Colors.white),
      botIcon: const Icon(Icons.android, color: Colors.white),
      botChatColor: const Color.fromARGB(255, 194, 67, 219),
      delayBot: 100,
      closingTime: 5, //in mmin.
      delayResponse: 2, //in sec.
      userChatColor: const Color.fromARGB(255, 194, 67, 219),
      waitingTime: 5,
      keywords: keywords,
      responses: responses,
      backgroundColor: Colors.white,
      backgroundImage:
          'https://img.freepik.com/premium-vector/dialogue-balloon-chat-bubble-icons-seamless-pattern-textile-pattern-wrapping-paper-linear-vector-print-fabric-seamless-background-wallpaper-backdrop-with-speak-bubbles-chat-message-frame_8071-58894.jpg',
      backgroundAssetimage: "assets/GemePageSplach.json",
      initialGreeting:
          "Hello! \n Welcome to Link_Cord ChatBot. \nHow can I help you today",
      defaultResponse: "Sorry, I didn't understand your response.",
      inactivityMessage: "Is there anything else you need help with?",
      closingMessage: "This conversation will now close.",
      inputHint: 'Send a message',
      waitingText: 'Please wait...',
      useAsset: false,
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "This is Link-Cords Chat Bot",
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 212, 249),
      ),
      body: ikchatbot(config: chatBotConfig),
    );
  }
}
