import 'dart:collection';
import 'dart:io';
import 'arguments.dart';

class CommandRunner {
  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(<Command>{..._commands.values});


  /// Runs the command-line application logic with the given arguments.
  Future<void> run(List<String> input) async {
    final ArgResults results = parse(input);
    if(results.command != null) {
      Object? output = await results.command!.run(results);           // ! - Null assertion — "I guarantee .command is not null, trust me"
      print(output.toString());
    }
  }

  void addCommand(Command command){
    // TODO: handle error (Commands can't have names that conflict)
    _commands[command.name] = command;
    command.runner = this;
  }

  ArgResults parse(List<String> input) {
    var results = ArgResults();
    // print(_commands[input.first]);
    results.command = _commands[input.first];
    return results;
  }

  // Returns usage for executable only.
  // Should be overridden if you aren't using [HelpCommand]
  // or another means of printing usage

  String get usage {
    final exeFile = Platform.script.path.split('/').last;
    return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
}
