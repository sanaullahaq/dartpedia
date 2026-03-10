// import 'package:cli/cli.dart' as cli;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  var commandRunner = CommandRunner()..addCommand(HelpCommand());
  commandRunner.run(arguments);
  // // print('Hello Dart!');
  // if (arguments.isEmpty || arguments.first == 'help') {
  //   // print('Hello Dart!');
  //   printUsage();
  // } else if (arguments.first == 'version') {
  //   print('Dartpedia CLI version $version');
  // } else if (arguments.first == 'wikipedia') {
  //   // Pass all arguments *after* 'wikipedia' to searchWikipedia
  //   final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
  //   searchWikipedia(inputArgs);
  // } else {
  //   printUsage();
  // }
}

// void printUsage() {
//   print(
//     "The following commands are valid: 'help', 'version', 'wikipedia <ARTICLE TITLE>'",
//   );
// }

// Future<void> searchWikipedia(List<String>? arguments) async {
//   final String articleTitle;

//   // If the user didn't pass in arguments, request an article title.
//   if (arguments == null || arguments.isEmpty) {
//     print('Please provide an article title.');
//     // Await input and provide a default empty string if the input is null.
//     final inputFromStdin = stdin.readLineSync();
//     if(inputFromStdin == null || inputFromStdin.isEmpty){
//       print('No article title provided. Exiting');
//       return;   //Exiting the function, if no valid input
//     }
//     articleTitle = inputFromStdin;

//   } else {
//     articleTitle = arguments.join(' ');
//   }

//   print('Looking up articles about "$articleTitle". Please wait.');

//   // Call the API and await the results
//   var articleContent = await getWikipediaArticle(articleTitle);
//   print(articleContent);
// }

// Future<String> getWikipediaArticle(String articleTitle) async {
//   final url = Uri.https(
//     'en.wikipedia.org',                                        // Wikipedia API domain
//     '/api/rest_v1/page/summary/$articleTitle'                  // API ath for article summary
//   );
//   final response = await http.get(url);   // Make the HTTP request

//   if(response.statusCode==200){
//     return response.body;                 // Return the response body if successful 
//   }
  
//   // Return an error message if the request failed
//   return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
// }