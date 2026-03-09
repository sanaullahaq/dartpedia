enum OptionType {flag, option}

abstract class Arguments {
  String get name;
  String? get help;

  Object? get defaultValue;
  String? get valueHelp;

  String? get usage;
}

class Option {}

class Command {}