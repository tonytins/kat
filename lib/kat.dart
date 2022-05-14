import 'dart:convert';
import 'dart:io';

Future<void> cat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    // No files provided as arguments, read from stdin and print to stdout.
    await stdin.pipe(stdout);
  } else {
    for (final path in paths) {
      var lineNumber = 1;
      // Open the file and read its contents.
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            // Write the line number before the output.
            stdout.write('${lineNumber++} ');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  // If the file does not exist, print an error message.
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('$path: error: failed to read file');
  } else {
    exitCode = 2;
  }
}
