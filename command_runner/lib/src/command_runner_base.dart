import 'dart:io';
import 'package:http/http.dart' as http;

class CommandRunner {
  /// Runs the command-line application logic with the given arguments.
  Future<void> run(List<String> input) async {
    print('CommandRunner received argument $input');
  }
}