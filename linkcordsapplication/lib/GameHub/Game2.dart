// import 'dart:async';
// import 'dart:convert';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MaterialApp(home: QuizApp()));
// }

// class QuizApp extends StatefulWidget {
//   const QuizApp({super.key});

//   @override
//   State<QuizApp> createState() => _QuizAppState();
// }

// class _QuizAppState extends State<QuizApp> {
//   List<Map<String, dynamic>> questions = [];
//   int currentQuestionIndex = 0;
//   int? selectedAnswerIndex;
//   int score = 0;
//   bool quizCompleted = false;
//   Timer? timer;
//   int timeLeft = 10;

//   @override
//   void initState() {
//     super.initState();
//     fetchQuestions();
//   }

//   Future<void> fetchQuestions() async {
//     const url = 'https://opentdb.com/api.php?amount=5&type=multiple';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       List<Map<String, dynamic>> fetchedQuestions = [];

//       for (var item in data['results']) {
//         List<String> options = List<String>.from(item['incorrect_answers']);
//         options.add(item['correct_answer']);
//         options.shuffle();
//         fetchedQuestions.add({
//           'question': Uri.decodeFull(item['question']),
//           'options': options,
//           'correct': item['correct_answer'],
//         });
//       }

//       setState(() {
//         questions = fetchedQuestions;
//       });

//       startTimer();
//     }
//   }

//   void startTimer() {
//     timer?.cancel();
//     timeLeft = 10;
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (timeLeft > 0) {
//         setState(() {
//           timeLeft--;
//         });
//       } else {
//         moveToNext();
//       }
//     });
//   }

//   void moveToNext() {
//     timer?.cancel();
//     if (currentQuestionIndex < questions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//         selectedAnswerIndex = null;
//         timeLeft = 10;
//       });
//       startTimer();
//     } else {
//       setState(() {
//         quizCompleted = true;
//       });
//     }
//   }

//   Color? getColor(String option, int index) {
//     if (selectedAnswerIndex == null) return null;
//     String correctAnswer = questions[currentQuestionIndex]['correct'];
//     if (questions[currentQuestionIndex]['options'][index] == correctAnswer) {
//       return Colors.green;
//     } else if (index == selectedAnswerIndex) {
//       return Colors.red;
//     }
//     return null;
//   }

//   void onSelect(int index) {
//     if (selectedAnswerIndex != null) return;

//     setState(() {
//       selectedAnswerIndex = index;
//       if (questions[currentQuestionIndex]['options'][index] ==
//           questions[currentQuestionIndex]['correct']) {
//         score++;
//       }
//     });

//     Future.delayed(const Duration(seconds: 1), moveToNext);
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (quizCompleted) {
//       return Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF00C9FF),
//                 Color(0xFF92FE9D),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextLiquidFill(
//                   text: 'Your Score',
//                   waveColor: Colors.blue,
//                   boxBackgroundColor: Colors.transparent,
//                   textStyle: GoogleFonts.lobster(
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   boxHeight: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "$score / ${questions.length}",
//                   style: GoogleFonts.poppins(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       currentQuestionIndex = 0;
//                       selectedAnswerIndex = null;
//                       score = 0;
//                       quizCompleted = false;
//                     });
//                     fetchQuestions();
//                   },
//                   child: const Text("Restart"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }

//     if (questions.isEmpty) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF00C9FF),
//               Color(0xFF92FE9D),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 80),
//             AnimatedTextKit(
//               animatedTexts: [
//                 TypewriterAnimatedText(
//                   'Quiz Game',
//                   textStyle: GoogleFonts.ubuntu(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 200),
//                 ),
//               ],
//               repeatForever: false,
//               totalRepeatCount: 1,
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Q ${currentQuestionIndex + 1}/${questions.length}",
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "⏳ $timeLeft s",
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Text(
//               questions[currentQuestionIndex]['question'],
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 40),
//             ...List.generate(4, (index) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: getColor(
//                         questions[currentQuestionIndex]['options'][index],
//                         index),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                   ),
//                   onPressed: () => onSelect(index),
//                   child: Text(
//                     questions[currentQuestionIndex]['options'][index],
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class QuizApp extends StatefulWidget {
//   const QuizApp({super.key});

//   @override
//   State<QuizApp> createState() => _QuizAppState();
// }

// class _QuizAppState extends State<QuizApp> {
//   List<Map<String, dynamic>> questions = [];
//   int currentQuestionIndex = 0;
//   int? selectedOption;
//   bool showResult = false;
//   int score = 0;
//   int timer = 15;
//   Timer? countdownTimer;
//   String? selectedCategory;
//   String? selectedDifficulty;
//   bool quizStarted = false;

//   final categories = {
//     'General Knowledge': '9',
//     'Science & Nature': '17',
//     'History': '23',
//     'Sports': '21',
//   };

//   final difficulties = ['easy', 'medium', 'hard'];

//   Future<void> fetchQuestions() async {
//     final url =
//         'https://opentdb.com/api.php?amount=5&category=$selectedCategory&difficulty=$selectedDifficulty&type=multiple';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       List<Map<String, dynamic>> fetchedQuestions = [];

//       for (var item in data['results']) {
//         if (item['question'] == null ||
//             item['correct_answer'] == null ||
//             item['incorrect_answers'] == null) {
//           continue;
//         }

//         List<String> options = List<String>.from(item['incorrect_answers']);
//         options.add(item['correct_answer']);
//         options.shuffle();

//         fetchedQuestions.add({
//           'question': Uri.decodeFull(item['question']),
//           'options': options,
//           'correct': item['correct_answer'],
//         });
//       }

//       setState(() {
//         questions = fetchedQuestions;
//         currentQuestionIndex = 0;
//         selectedOption = null;
//         showResult = false;
//         score = 0;
//         quizStarted = true;
//       });

//       startTimer();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to fetch questions')),
//       );
//     }
//   }

//   void startTimer() {
//     countdownTimer?.cancel();
//     timer = 15;

//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timerTick) {
//       setState(() {
//         if (timer > 0) {
//           timer--;
//         } else {
//           timerTick.cancel();
//           showAnswer(-1);
//         }
//       });
//     });
//   }

//   void showAnswer(int selected) {
//     countdownTimer?.cancel();
//     setState(() {
//       selectedOption = selected;
//       showResult = true;
//       if (selected != -1 &&
//           questions[currentQuestionIndex]['options'][selected] ==
//               questions[currentQuestionIndex]['correct']) {
//         score++;
//       }
//     });
//   }

//   void nextQuestion() {
//     if (currentQuestionIndex < questions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//         selectedOption = null;
//         showResult = false;
//       });
//       startTimer();
//     } else {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text('Quiz Completed!'),
//           content: Text('Your score: $score / ${questions.length}'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 setState(() {
//                   quizStarted = false;
//                   selectedCategory = null;
//                   selectedDifficulty = null;
//                 });
//               },
//               child: const Text('Restart'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   Color getColor(int index) {
//     if (!showResult) return Colors.blue;

//     final option = questions[currentQuestionIndex]['options'][index];
//     final correct = questions[currentQuestionIndex]['correct'];

//     if (option == correct) return Colors.green;
//     if (index == selectedOption) return Colors.red;
//     return Colors.grey;
//   }

//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Quiz App'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: quizStarted && questions.isNotEmpty
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Time Left: $timer seconds',
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Q${currentQuestionIndex + 1}: ${questions[currentQuestionIndex]['question']}',
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                   const SizedBox(height: 20),
//                   ...List.generate(questions[currentQuestionIndex]['options'].length, (index) {
//                     return Container(
//                       width: double.infinity,
//                       margin: const EdgeInsets.symmetric(vertical: 6),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: getColor(index),
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         onPressed: showResult ? null : () => showAnswer(index),
//                         child: Text(
//                           questions[currentQuestionIndex]['options'][index],
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     );
//                   }),
//                   const SizedBox(height: 20),
//                   if (showResult)
//                     ElevatedButton(
//                       onPressed: nextQuestion,
//                       style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                           backgroundColor: Colors.deepPurple),
//                       child: const Text('Next', style: TextStyle(fontSize: 18)),
//                     )
//                 ],
//               )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Select Category:', style: TextStyle(fontSize: 16)),
//                   DropdownButton<String>(
//                     isExpanded: true,
//                     value: selectedCategory,
//                     hint: const Text('Choose Category'),
//                     items: categories.entries
//                         .map((e) => DropdownMenuItem(
//                               value: e.value,
//                               child: Text(e.key),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCategory = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   const Text('Select Difficulty:', style: TextStyle(fontSize: 16)),
//                   DropdownButton<String>(
//                     isExpanded: true,
//                     value: selectedDifficulty,
//                     hint: const Text('Choose Difficulty'),
//                     items: difficulties
//                         .map((e) => DropdownMenuItem(
//                               value: e,
//                               child: Text(e[0].toUpperCase() + e.substring(1)),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedDifficulty = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: selectedCategory != null && selectedDifficulty != null
//                           ? fetchQuestions
//                           : null,
//                       style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                           backgroundColor: Colors.deepPurple),
//                       child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: QuizApp()));

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  bool showAnswerResult = false;
  int score = 0;
  int timer = 15;
  Timer? countdownTimer;

  String? selectedCategory;
  String? selectedDifficulty;
  bool quizStarted = false;

  final categories = {
    'General Knowledge': '9',
    'Science & Nature': '17',
    'History': '23',
    'Sports': '21',
  };

  final difficulties = ['easy', 'medium', 'hard'];

  Future<void> fetchQuestions() async {
    final url =
        'https://opentdb.com/api.php?amount=5&category=$selectedCategory&difficulty=$selectedDifficulty&type=multiple';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Map<String, dynamic>> fetchedQuestions = [];

      for (var item in data['results']) {
        // Decode HTML entities
        String question = Uri.decodeFull(item['question']);
        String correctAnswer = Uri.decodeFull(item['correct_answer']);
        List<String> options = List<String>.from(
            item['incorrect_answers'].map((a) => Uri.decodeFull(a)));
        options.add(correctAnswer);
        options.shuffle();

        fetchedQuestions.add({
          'question': question,
          'options': options,
          'correct': correctAnswer,
        });
      }

      setState(() {
        questions = fetchedQuestions;
        currentQuestionIndex = 0;
        selectedOptionIndex = null;
        showAnswerResult = false;
        score = 0;
        quizStarted = true;
      });

      startTimer();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch questions')),
      );
    }
  }

  void startTimer() {
    countdownTimer?.cancel();
    timer = 15;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timerTick) {
      if (timer > 0) {
        setState(() {
          timer--;
        });
      } else {
        timerTick.cancel();
        showAnswer(-1); // Time's up, no answer selected
      }
    });
  }

  void showAnswer(int index) {
    countdownTimer?.cancel();
    setState(() {
      selectedOptionIndex = index;
      showAnswerResult = true;
      if (index != -1 &&
          questions[currentQuestionIndex]['options'][index] ==
              questions[currentQuestionIndex]['correct']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
        showAnswerResult = false;
      });
      startTimer();
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
                title: const Text('Quiz Completed!'),
                content:
                    Text('Your score is $score out of ${questions.length}'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          quizStarted = false;
                          selectedCategory = null;
                          selectedDifficulty = null;
                          questions = [];
                        });
                      },
                      child: const Text('Restart'))
                ],
              ));
    }
  }

  Color getOptionColor(int index) {
    if (!showAnswerResult) return Colors.blue;

    String optionText = questions[currentQuestionIndex]['options'][index];
    String correctAnswer = questions[currentQuestionIndex]['correct'];

    if (optionText == correctAnswer) {
      return Colors.green;
    }
    if (index == selectedOptionIndex && optionText != correctAnswer) {
      return Colors.red;
    }
    return Colors.grey.shade400;
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: quizStarted
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time Left: $timer seconds',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Q${currentQuestionIndex + 1}: ${questions[currentQuestionIndex]['question']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(
                    questions[currentQuestionIndex]['options'].length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getOptionColor(index),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed:
                            showAnswerResult ? null : () => showAnswer(index),
                        child: Text(
                          questions[currentQuestionIndex]['options'][index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (showAnswerResult)
                    Center(
                      child: ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          backgroundColor: Colors.deepPurple,
                        ),
                        child:
                            const Text('Next', style: TextStyle(fontSize: 18)),
                      ),
                    )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Category:',
                      style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCategory,
                    hint: const Text('Choose Category'),
                    items: categories.entries
                        .map((e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.key),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCategory = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Select Difficulty:',
                      style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedDifficulty,
                    hint: const Text('Choose Difficulty'),
                    items: difficulties
                        .map((diff) => DropdownMenuItem(
                              value: diff,
                              child: Text(
                                   diff[0].toUpperCase() + diff.substring(1)),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedDifficulty = val;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed:
                          selectedCategory != null && selectedDifficulty != null
                              ? fetchQuestions
                              : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        backgroundColor : Colors.deepPurple,
                      ),
                      child: const Text(
                        'Start Quiz',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
