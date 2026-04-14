
import std/typeinfo

import auditfunc


import std/unittest
#template test(name, body) = body
#template check(b) = assert b
const
  Name = "Name"

template mycheck(b) = assert b
proc cb(name: string, args: varargs[Any]) =
  mycheck name == Name
  mycheck args[0].getInt == 1
  mycheck args[1].getString == "hi"

test "test1":
  when not defined(js):
    addaudithook(cb)

  audit(Name, 1, "hi")


