(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (func $sum (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 66560))
  (export "memory" (memory 0))
  (export "sum" (func $sum)))
