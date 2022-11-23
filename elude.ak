use aiken/builtin
use elude/types.{Option, None, Some}

// self-explanatory
fn foldl(f: fn(b, a) -> b, base: b, list: List(a)) -> b {
  let empty = builtin.nullList(list)
  if empty {
    base
  }else{
    foldl(f, f(base, builtin.headList(list)), builtin.tailList(list))
  }
}

// if f(a) is true for any a in list, return true
fn any(f: fn(a)->Bool, list: List(a))-> Bool {
  let empty = builtin.nullList(list)
  if empty {
    False
  }else{
    if f(builtin.headList(list)) {
      True
    }else{
      any(f, builtin.tailList(list))
    }
  }
}

// return first occurance where f(a) is true for a in list
fn where(f: fn(a)->Bool, list: List(a))-> Option(a) {
  let empty = builtin.nullList(list)
  if empty {
    None
  }else{
    let head = builtin.headList(list)
    if f(head) {
      Some(head)
    }else{
      where(f, builtin.tailList(list))
    }
  }
}

// placeholder
fn mkCons(a: a, l: List(a))->List(a) {
  todo
}

// does not work because the builtin does not exist
fn filter(f: fn(a)->Bool, list: List(a))-> List(a) {
  let empty = builtin.nullList(list)
  if empty {
    []
  }else{
    let head = builtin.headList(list)
    let nextTail = filter(f, builtin.tailList(list))
    if f(head) {
      mkCons(head, nextTail)
    }else{
      nextTail
    }
  }
}

// does not work because the builtin does not exist
fn map(f: fn(a)->b, list: List(a))-> List(b) {
  let empty = builtin.nullList(list)
  if empty {
    []
  }else{
    mkCons(f(builtin.headList(list)), map(f, builtin.tailList(list)))
  }
}

fn empty(l: List(a)){
    builtin.nullList(l)
}

fn tail(l: List(a)){
    builtin.tailList(l)
}

// returns true if list has exactly one element
fn singletonList(list: List(a))->Bool {
  if !empty(list) {
    empty(tail(list))
  }else {
    False
  }
}