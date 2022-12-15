use elude/types.{None, Option, Some}

pub fn foldl(f: fn(b, a) -> b, base: b, list: List<a>) -> b {
  when list is {
    [] -> base
    [x, ..xs] -> foldl(f, f(base, x), xs)
  }
}

pub fn any(f: fn(a) -> Bool, list: List<a>) -> Bool {
  when list is {
    [] -> False
    [x, ..xs] ->
      if f(x) {
        True
      } else {
        any(f, xs)
      }
  }
}

pub fn and(f: fn(a) -> Bool, list: List<a>) -> Bool {
  when list is {
    [] -> True
    [x, ..xs] ->
      if f(x) {
        and(f, xs)
      } else {
        False
      }
  }
}

pub fn or(f: fn(a) -> Bool, list: List<a>) -> Bool {
  when list is {
    [] -> False
    [x, ..xs] ->
      if f(x) {
        True
      } else {
        or(f, xs)
      }
  }
}

pub fn find(f: fn(a) -> Bool, list: List<a>) -> Option<a> {
  when list is {
    [] -> None
    [x, ..xs] ->
      if f(x) {
        Some(x)
      } else {
        find(f, xs)
      }
  }
}

pub fn filter(f: fn(a) -> Bool, list: List<a>) -> List<a> {
  when list is {
    [] -> []
    [x, ..xs] ->
      if f(x) {
        [x, ..filter(f, xs)]
      } else {
        filter(f, xs)
      }
  }
}

pub fn map(f: fn(a) -> b, list: List<a>) -> List<b> {
  when list is {
    [] -> []
    [x, ..xs] -> [f(x), ..map(f, xs)]
  }
}

pub fn empty(l: List<a>) -> Bool {
  when l is {
    [] -> True
    _ -> False
  }
}

pub fn unsafeHead(l: List<a>) -> a {
  assert [x, .._] = l
  x
}

pub fn head(l: List<a>) -> Option<a> {
  when l is {
    [x, .._] -> Some(x)
    _ -> None
  }
}

pub fn tail(l: List<a>) -> List<a> {
  when l is {
    [_, ..xs] -> xs
    _ -> []
  }
}

pub fn isSingle(list: List<a>) -> Bool {
  if !empty(list) {
    empty(tail(list))
  } else {
    False
  }
}

pub fn isSingle2(list: List<a>) -> Bool {
  when list is {
    [_] -> True
    _ -> False
  }
}

pub fn id(a: a) -> a {
  a
}

pub fn constant(x: a, _: b) -> a {
  x
}

pub fn flip(f: fn(a, b) -> c, x: b, y: a) -> c {
  f(y, x)
}

pub fn until(f: fn(a) -> Bool, g: fn(a) -> a, x: a) -> a {
  if f(x) {
    x
  } else {
    until(f, g, g(x))
  }
}
