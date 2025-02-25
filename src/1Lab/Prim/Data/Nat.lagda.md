```agda
open import 1Lab.Prim.Data.Bool
open import 1Lab.Prim.Extension
open import 1Lab.Prim.Interval
open import 1Lab.Prim.Type
open import 1Lab.Prim.Kan

module 1Lab.Prim.Data.Nat where
```

# Primitive: Natural numbers

The [natural numbers](Data.Nat.html) are the h-initial type generated by
a point and an endomorphism.

```agda
data Nat : Type where
  zero : Nat
  suc  : Nat → Nat
{-# BUILTIN NATURAL Nat #-}
```

## Optimised functions on Nat

Agda lets us define the following functions on natural numbers, which
are computed more efficiently when bound as `BUILTIN`s.

```agda
infix  4 _==_ _<_
infixl 6 _+_ _-_
infixl 7 _*_

_+_ : Nat → Nat → Nat
zero  + m = m
suc n + m = suc (n + m)

{-# BUILTIN NATPLUS _+_ #-}

_-_ : Nat → Nat → Nat
n     - zero = n
zero  - suc m = zero
suc n - suc m = n - m

{-# BUILTIN NATMINUS _-_ #-}

_*_ : Nat → Nat → Nat
zero  * m = zero
suc n * m = m + n * m

{-# BUILTIN NATTIMES _*_ #-}

_==_ : Nat → Nat → Bool
zero  == zero  = true
suc n == suc m = n == m
_     == _     = false

{-# BUILTIN NATEQUALS _==_ #-}

_<_ : Nat → Nat → Bool
_     < zero  = false
zero  < suc _ = true
suc n < suc m = n < m

{-# BUILTIN NATLESS _<_ #-}
```
