void main() {
  String s = "Los_Angeles";
  print(s.split('_').reduce((value, element) => value + " " + element));
}
git merge test1