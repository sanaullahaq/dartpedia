import 'package:cli/cli.dart';
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) async {
  final errorLogger = initFileLogger('errors');
  /**
   * .. lets you call multiple methods/set multiple properties on the same object, without repeating the variable name. It always returns the original object, not the result of the method call.
   */
  final app =
      CommandRunner(
          onOutput: (String output) async {
            await write(output);
          },
          onError: (Object error) {
            if (error is Error) {
              errorLogger.severe(
                '[Error] ${error.toString()}\n${error.stackTrace}',
              );
              throw error;
            }
            if (error is Exception) {
              errorLogger.warning(error);
            }
          },
        )
        ..addCommand(HelpCommand())
        ..addCommand(SearchCommand(logger: errorLogger))
        ..addCommand(GetArticleCommand(logger: errorLogger));

  app.run(arguments);
}