class Solution {
  String simplifyPath(String path) {
    List<String> res = ['/'];
    for (int i = 0; i < path.length; i++) {
      if (path[i] == '/') {
        if (res.last == '/.') {
          res.removeLast();
          if (res.isEmpty) res.add('/');
        }
        if (res.last == '/..') {
          res.removeLast();
          if (res.isEmpty) res.add('/');
          res.removeLast();
          if (res.isEmpty) res.add('/');
        }

        if (res.last != '/') {
          res.add('/');
        }
        continue;
      }

      res.last += path[i];
    }

    if (res.last == '/.') {
      res.removeLast();
      if (res.isEmpty) res.add('/');
    }
    if (res.last == '/..') {
      res.removeLast();
      if (res.isEmpty) res.add('/');
      res.removeLast();
      if (res.isEmpty) res.add('/');
    }
    if (res.length > 1 && res.last == '/') res.removeLast();

    return res.join();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.simplifyPath('/home//...//.//'));
  print(solution.simplifyPath('/h/o/m/../e/..'));
  print(solution.simplifyPath('/a/../../c/'));
}
