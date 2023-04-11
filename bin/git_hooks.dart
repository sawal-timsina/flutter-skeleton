import 'dart:io';

import 'package:git_hooks/git_hooks.dart';

void main(List arguments) {
  var params = {Git.commitMsg: commitMsg, Git.preCommit: preCommit};
  GitHooks.call(arguments as List<String>, params);
}

Future<bool> commitMsg() async {
  print("here");
  return true;
}

Future<bool> preCommit() async {
  try {
    var result = await Process.run('dart', ['analyze']);
    if (result.exitCode != 0) return false;
    return true;
  } catch (e) {
    return false;
  }
}
