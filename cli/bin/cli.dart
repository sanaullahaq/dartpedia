// import 'package:cli/cli.dart' as cli;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  /**
   * .. lets you call multiple methods/set multiple properties on the same object, without repeating the variable name. It always returns the original object, not the result of the method call.
   */
  var commandRunner = CommandRunner(
    onOutput: (String output) async {
      await write(output);
    },
    onError: (Object error) {
      if (error is Error) {
        throw error;
      }
      if (error is Exception) {
        print(error);
      }
    },
  )..addCommand(HelpCommand());   // .. Cascade Operator skips the below line.
  // commandRunner.addCommand(HelpCommand());
  commandRunner.run(arguments);
}