final List<String> keywords = [
  //1
  'assist',
  //2
  'what is flutter',
  //3
  'what is java and its uses',
  //4
  'data type in java',
  //5
  'what is pointer in c',
  //6
  'program of pointer in c',
  //7
  'thank you',
  //8
  'internship',
  //9
  'engineering',
  //10
  'linkedin profile',
  //11
  'interview ',
];

final List<String> responses = [
  //1
  'I am your friendly chatbot, Create by Digvijay Shinde and Team,I can assist you in several ways, depending on what you are looking for.',
  //2
  'Flutter is an open-source framework from Google that allows developers to build applications for multiple platforms using a single codebase',
  //3
  'Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.',
  //4
  '''
    In Java, primitive data types are the most basic types of data that are directly supported by the language. These types are not objects, and they represent simple values such as numbers, characters, and boolean values. There are eight primitive data types in Java-:
    1. byte   (Size: 1 bytes)
    2. short  (Size: 2 bytes)
    3. char   (size; 2 bytes)
    4. bool   (size: 1 bit)
    5. int    (size: 4 bytes)
    6. long   (size: 8 bytes)
    7. Float  (size: 4 bytes)
    8. Double (size: 8 bytes)
  ''',
  //5
  'In C programming, a pointer is a variable that stores the memory address of another variable. Instead of holding data directly, a pointer holds the location in memory where the data is stored. This allows for efficient manipulation of memory and more control over how data is accessed and modified.',
  //6
  '''
    #include <stdio.h>
    void updateValue(int *ptr) {
        *ptr = 20;  // Dereference pointer and update the value at the address
    }
    int main() {
        int x = 10;
        printf("Before: %d\n", x);
        
        updateValue(&x);  // Pass the address of x to the function
        
        printf("After: %d\n", x);  // x is updated to 20 by the function
        
        return 0;
    }
  ''',
  //7
  'welcome',
  //8
  'Of course! The first step is to narrow down what kind of internship you are looking for. What field are you interested in? For example: \n1.marketing, \n2.engineering, \n3.finance, \n4.something else',
  //9
  'Great! There are many platforms you can use to search for internships in marketing and Websites like LinkedIn and Indeed are great places to start. You could also check company websites directly for internship opportunities.',
  //10
  'A strong LinkedIn profile is key for standing out. Make sure to include a professional photo, a compelling headline and a summary that highlights your skills and what you are looking for. List any relevant courses, projects, or volunteer experiences.',
  //11
  '1.Tell me about yourself. \n 2.What are your strengths and weaknesses? \n 3.Why did you choose this field/industry? \n 4.Why should we hire you? \n 5.What are your technical skills? \n 6.Can you explain a project or assignment',
];
