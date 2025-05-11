extension DotRemover on String {
  int removeDot() {
    final versionNum = replaceAll('.', '');
    return int.parse(versionNum);
  }
}
