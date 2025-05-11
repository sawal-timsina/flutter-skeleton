import 'dart:developer' show log;
import 'dart:io' show Process, ProcessResult;

import 'package:git_hooks/git_hooks.dart'
    show Git, GitHooks, UserBackFun, Utils;

void main(List arguments) {
  Map<Git, UserBackFun> params = {
    Git.commitMsg: commitMsg,
    Git.preCommit: preCommit,
  };
  GitHooks.call(arguments as List<String>, params);
}

Future<bool> commitMsg() async {
  // String rootDir = Directory.current.path;
  String commitMsg = Utils.getCommitEditMsg();
  if (isAllowedCommitType(commitMsg)) {
    return true; // you can return true let commit go
  } else {
    return false;
  }
}

Future<bool> preCommit() async {
  try {
    // Use Git diff to get the changes between the HEAD and the index
    var gitDiff = await Process.run('git', ['diff', '--cached', '--name-only']);
    if (gitDiff.exitCode != 0) {
      return false;
    }

    // Filter out any files that are not Dart files
    var dartFiles = gitDiff.stdout
        .toString()
        .split('\n')
        .where((filename) => filename.endsWith('.dart'));
    ProcessResult result;
    bool showWarning = false;
    // Run the pre-commit checks on each Dart file
    for (var dartFile in dartFiles) {
      result = await Process.run('dart', ['fix', '--apply', dartFile]);
      if (result.exitCode != 0) {
        return false;
      }

      result = await Process.run('dart', ['format', dartFile]);
      if (result.exitCode != 0) {
        return false;
      }

      result = await Process.run('dart', ['analyze', dartFile]);
      if (result.exitCode != 0) {
        return false;
      }
      result =
          await Process.run('dart', ['analyze', '--fatal-infos', dartFile]);
      if (result.exitCode != 0) {
        log("Non-Fatal errors in $dartFile Please check");
        showWarning = true;
      }
    }
    if (showWarning) {
      log(
        "Please check:\n"
        "1. Unused imports\n"
        "2. Unused variables\n"
        "3. Redundant null checks\n"
        "4. Unused methods\n"
        "5. Inconsistent return types\n"
        "6. Missing required parameters",
      );
    }
    result =
        await Process.run('dart', ['pub', 'outdated', '--no-dev-dependencies']);
    if (result.exitCode == 0) {
      List<String> lines = (result.stdout as String).split('\n');
      List<String> outdatedPackages = [];
      for (var i = 2; i < lines.length; i++) {
        if (lines[i].startsWith('- ')) {
          outdatedPackages.add(lines[i].substring(2).split(' ')[0]);
        }
      }
    }
    return true;
  } catch (e) {
    return false;
  }
}

bool isAllowedCommitType(String commitMsgType) {
  List<String> allowedCommitTypes = [
    "feat", // A new feature is introduced with the changes
    "fix", // A bug fix or correction is made
    "chore", // Routine tasks, maintenance, or chores
    "refactor", // Code refactoring without changing its external behavior
    "docs", // Documentation-related changes
    "style", // Code style changes (formatting, indentation, etc.)
    "test", // Adding or modifying tests
    "pref", // Performance-related changes
    "ci", // Changes to the continuous integration configuration
    "build", // Changes that affect the build system or external dependencies
    "revert", // Reverting a previous commit
  ];

  return allowedCommitTypes.any((prefix) => commitMsgType.startsWith(prefix));
}
