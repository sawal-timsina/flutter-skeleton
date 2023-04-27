import 'dart:io';

import 'package:git_hooks/git_hooks.dart';

void main(List arguments) {
  var params = {Git.preCommit: preCommit};
  GitHooks.call(arguments as List<String>, params);
}

Future<bool> preCommit() async {
  try {
    var result = await Process.run('dart', ['analyze']);
    if (result.exitCode != 0) {
      print(result.stderr);
      return false;
    }
    result = await Process.run('dart', ['fix', '--apply']);
    if (result.exitCode != 0) {
      print(result.stderr);
      return false;
    }
    result = await Process.run('dart', ['format', '.']);
    if (result.exitCode != 0) {
      print(result.stderr);
      return false;
    }
    return true;
  } catch (e) {
    return false;
  }
}
