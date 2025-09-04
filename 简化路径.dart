class Solution {
  String simplifyPath(String path) {
    List<String> res = [];
    for (int i = 0; i <= path.length; i++) {
      if (res.isEmpty) res.add('');
      if (i == path.length || path[i] == '/') {
        if (res.last == '.') res.removeLast();
        if (res.isNotEmpty && res.last == '..')
          res.length > 2
              ? res.removeRange(res.length - 2, res.length)
              : res.clear();
        if (res.isNotEmpty && res.last != '') res.add('');
        continue;
      }
      res.last += path[i];
    }
    if (res.isNotEmpty) res.removeLast();

    return '/' + res.join('/');
  }
}

void main() {
  Solution solution = Solution();
  print(solution.simplifyPath('/e/./././e/.'));
  print(solution.simplifyPath('/.'));
  print(solution.simplifyPath('/../../c/'));
}
