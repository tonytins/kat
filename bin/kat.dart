import 'dart:io';

import 'package:args/args.dart';
import 'package:kat/kat.dart';

const lineNumber = 'line-number';

void main(List<String> arguments) {
  exitCode = 0; // presume success

  // Parse the command-line arguments.
  final parser = ArgParser();
  parser.addFlag(lineNumber, negatable: false, abbr: 'n');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  cat(paths, showLineNumbers: argResults[lineNumber] as bool);
}
