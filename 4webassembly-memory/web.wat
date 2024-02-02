(module
 (type $0 (func (param f64) (result f64)))
 (type $1 (func (param f64 f64 f64 i32)))
 (import "env" "memory" (memory $0 0))
 (export "lch" (func $assembly/index/lch))
 (export "memory" (memory $0))
 (func $assembly/index/clamp (param $0 f64) (result f64)
  f64.const 0
  f64.const 1
  local.get $0
  local.get $0
  f64.const 1
  f64.gt
  select
  local.get $0
  f64.const 0
  f64.lt
  select
 )
 (func $~lib/math/NativeMath.mod (param $0 f64) (result f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  local.get $0
  i64.reinterpret_f64
  local.tee $2
  i64.const 52
  i64.shr_u
  i64.const 2047
  i64.and
  local.tee $4
  i64.const 2047
  i64.eq
  if
   local.get $0
   f64.const 360
   f64.mul
   local.tee $0
   local.get $0
   f64.div
   return
  end
  local.get $2
  i64.const 1
  i64.shl
  local.tee $1
  i64.const -9156662467374350336
  i64.le_u
  if
   local.get $0
   local.get $1
   i64.const -9156662467374350336
   i64.ne
   f64.convert_i32_u
   f64.mul
   return
  end
  local.get $2
  i64.const 63
  i64.shr_u
  local.set $3
  local.get $4
  i64.eqz
  if (result i64)
   local.get $2
   i64.const 1
   local.get $4
   local.get $2
   i64.const 12
   i64.shl
   i64.clz
   i64.sub
   local.tee $4
   i64.sub
   i64.shl
  else
   local.get $2
   i64.const 4503599627370495
   i64.and
   i64.const 4503599627370496
   i64.or
  end
  local.set $1
  loop $while-continue|0
   local.get $4
   i64.const 1031
   i64.gt_s
   if
    local.get $1
    i64.const 6333186975989760
    i64.ge_u
    if (result i64)
     local.get $1
     i64.const 6333186975989760
     i64.eq
     if
      local.get $0
      f64.const 0
      f64.mul
      return
     end
     local.get $1
     i64.const 6333186975989760
     i64.sub
    else
     local.get $1
    end
    i64.const 1
    i64.shl
    local.set $1
    local.get $4
    i64.const 1
    i64.sub
    local.set $4
    br $while-continue|0
   end
  end
  local.get $1
  i64.const 6333186975989760
  i64.ge_u
  if
   local.get $1
   i64.const 6333186975989760
   i64.eq
   if
    local.get $0
    f64.const 0
    f64.mul
    return
   end
   local.get $1
   i64.const 6333186975989760
   i64.sub
   local.set $1
  end
  local.get $4
  local.get $1
  i64.const 11
  i64.shl
  i64.clz
  local.tee $2
  i64.sub
  local.set $4
  local.get $3
  i64.const 63
  i64.shl
  local.get $1
  local.get $2
  i64.shl
  local.tee $1
  i64.const 4503599627370496
  i64.sub
  local.get $4
  i64.const 52
  i64.shl
  i64.or
  local.get $1
  i64.const 1
  local.get $4
  i64.sub
  i64.shr_u
  local.get $4
  i64.const 0
  i64.gt_s
  select
  i64.or
  f64.reinterpret_i64
 )
 (func $~lib/math/NativeMath.round (param $0 f64) (result f64)
  local.get $0
  f64.ceil
  local.get $0
  f64.ceil
  f64.const -0.5
  f64.add
  local.get $0
  f64.gt
  f64.convert_i32_u
  f64.sub
 )
 (func $assembly/index/lch (param $0 f64) (param $1 f64) (param $2 f64) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f64)
  (local $7 i32)
  (local $8 i32)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  loop $for-loop|0
   local.get $3
   local.get $7
   i32.gt_u
   if
    local.get $7
    i32.const 2
    i32.add
    i32.load8_u
    f64.convert_i32_u
    f64.const 255
    f64.div
    local.tee $12
    local.get $7
    i32.load8_u
    f64.convert_i32_u
    f64.const 255
    f64.div
    local.tee $13
    local.get $7
    i32.const 1
    i32.add
    i32.load8_u
    f64.convert_i32_u
    f64.const 255
    f64.div
    local.tee $14
    f64.min
    f64.min
    local.set $6
    local.get $13
    local.get $14
    f64.max
    local.get $12
    f64.max
    local.tee $9
    local.get $6
    f64.add
    local.tee $10
    f64.const 0.5
    f64.mul
    local.tee $15
    local.get $0
    f64.add
    call $assembly/index/clamp
    local.set $11
    local.get $6
    local.get $9
    f64.ne
    if (result f64)
     local.get $9
     local.get $6
     f64.sub
     local.tee $16
     local.get $10
     f64.div
     local.get $16
     f64.const 2
     local.get $9
     f64.sub
     local.get $6
     f64.sub
     f64.div
     local.get $15
     f64.const 0.5
     f64.lt
     select
    else
     f64.const 0
    end
    local.get $1
    f64.add
    call $assembly/index/clamp
    local.set $10
    local.get $14
    local.get $12
    f64.sub
    local.get $9
    local.get $6
    f64.sub
    local.tee $6
    f64.div
    local.get $12
    local.get $13
    f64.sub
    local.get $6
    f64.div
    f64.const 2
    f64.add
    local.get $13
    local.get $14
    f64.sub
    local.get $6
    f64.div
    f64.const 4
    f64.add
    f64.const 0
    local.get $9
    local.get $12
    f64.eq
    select
    local.get $9
    local.get $14
    f64.eq
    select
    local.get $9
    local.get $13
    f64.eq
    select
    f64.const 60
    f64.mul
    local.tee $6
    f64.const 360
    f64.add
    local.get $6
    local.get $6
    f64.const 0
    f64.lt
    select
    local.get $2
    f64.add
    f64.const 360
    f64.add
    call $~lib/math/NativeMath.mod
    local.set $6
    local.get $10
    f64.const 0
    f64.eq
    if
     local.get $11
     f64.const 255
     f64.mul
     call $~lib/math/NativeMath.round
     i32.trunc_sat_f64_u
     local.tee $4
     local.set $8
     local.get $4
     local.set $5
    else
     local.get $6
     f64.const 360
     f64.div
     local.tee $12
     f64.const 0.3333333333333333
     f64.add
     local.tee $6
     f64.const 1
     f64.add
     local.get $6
     local.get $6
     f64.const 0
     f64.lt
     select
     local.tee $6
     f64.const 1
     f64.gt
     if
      local.get $6
      f64.const -1
      f64.add
      local.set $6
     end
     local.get $11
     local.get $11
     f64.add
     local.get $11
     local.get $10
     f64.const 1
     f64.add
     f64.mul
     local.get $11
     local.get $10
     f64.add
     local.get $11
     local.get $10
     f64.mul
     f64.sub
     local.get $11
     f64.const 0.5
     f64.lt
     select
     local.tee $9
     f64.sub
     local.tee $10
     local.get $9
     local.get $10
     f64.sub
     local.tee $11
     f64.const 6
     f64.mul
     local.get $6
     f64.mul
     f64.add
     local.get $9
     local.get $10
     local.get $11
     f64.const 0.6666666666666666
     local.get $6
     f64.sub
     f64.mul
     f64.const 6
     f64.mul
     f64.add
     local.get $10
     local.get $6
     f64.const 3
     f64.mul
     f64.const 2
     f64.lt
     select
     local.get $6
     local.get $6
     f64.add
     f64.const 1
     f64.lt
     select
     local.get $6
     f64.const 6
     f64.mul
     f64.const 1
     f64.lt
     select
     f64.const 255
     f64.mul
     call $~lib/math/NativeMath.round
     i32.trunc_sat_f64_u
     local.set $5
     local.get $12
     f64.const 1
     f64.add
     local.get $12
     local.get $12
     f64.const 0
     f64.lt
     select
     local.tee $6
     f64.const 1
     f64.gt
     if
      local.get $6
      f64.const -1
      f64.add
      local.set $6
     end
     local.get $10
     local.get $9
     local.get $10
     f64.sub
     local.tee $11
     f64.const 6
     f64.mul
     local.get $6
     f64.mul
     f64.add
     local.get $9
     local.get $10
     local.get $11
     f64.const 0.6666666666666666
     local.get $6
     f64.sub
     f64.mul
     f64.const 6
     f64.mul
     f64.add
     local.get $10
     local.get $6
     f64.const 3
     f64.mul
     f64.const 2
     f64.lt
     select
     local.get $6
     local.get $6
     f64.add
     f64.const 1
     f64.lt
     select
     local.get $6
     f64.const 6
     f64.mul
     f64.const 1
     f64.lt
     select
     f64.const 255
     f64.mul
     call $~lib/math/NativeMath.round
     i32.trunc_sat_f64_u
     local.set $8
     local.get $12
     f64.const -0.3333333333333333
     f64.add
     local.tee $6
     f64.const 1
     f64.add
     local.get $6
     local.get $6
     f64.const 0
     f64.lt
     select
     local.tee $6
     f64.const 1
     f64.gt
     if
      local.get $6
      f64.const -1
      f64.add
      local.set $6
     end
     local.get $10
     local.get $9
     local.get $10
     f64.sub
     local.tee $11
     f64.const 6
     f64.mul
     local.get $6
     f64.mul
     f64.add
     local.get $9
     local.get $10
     local.get $11
     f64.const 0.6666666666666666
     local.get $6
     f64.sub
     f64.mul
     f64.const 6
     f64.mul
     f64.add
     local.get $10
     local.get $6
     f64.const 3
     f64.mul
     f64.const 2
     f64.lt
     select
     local.get $6
     local.get $6
     f64.add
     f64.const 1
     f64.lt
     select
     local.get $6
     f64.const 6
     f64.mul
     f64.const 1
     f64.lt
     select
     f64.const 255
     f64.mul
     call $~lib/math/NativeMath.round
     i32.trunc_sat_f64_u
     local.set $4
    end
    local.get $7
    local.get $5
    i32.store8
    local.get $7
    i32.const 1
    i32.add
    local.get $8
    i32.store8
    local.get $7
    i32.const 2
    i32.add
    local.get $4
    i32.store8
    local.get $7
    i32.const 4
    i32.add
    local.set $7
    br $for-loop|0
   end
  end
 )
)
