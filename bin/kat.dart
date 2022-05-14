import 'dart:io';

import 'package:args/args.dart';
import 'package:kat/kat.dart';

const lineNumber = "line-number";

void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  cat(paths, showLineNumbers: argResults[lineNumber] as bool);
}
