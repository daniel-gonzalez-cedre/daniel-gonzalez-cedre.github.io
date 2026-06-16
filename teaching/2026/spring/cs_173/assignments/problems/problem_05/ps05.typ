#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 5,
  date: datetime(year: 2026, month: 03, day: 23),
)

#let lemma = lemma.with(numbering: false)
#let theorem = theorem.with(numbering: false)

As always,
#marginale[
  Recall the definitions of #define[addition] and #define[multiplication]_._
  Given $n in NN$ and $m in NN$, we make the following definitions:
  #linebreak(justify: true)
  #box[
    #v(0.4em)
    $
      &cases(
        n &+ 0      &&:= n,
        n &+ suc(m) &&:= suc(n + m)
      ) \ \
      &cases(
        n &dot 0      &&:= 0,
        n &dot suc(m) &&:= n dot m + n
      )
    $
  ]
]
#marginale[
  Given $n in NN$ and $m in NN$, we also recursively define #define[exponentiation] as follows:
  #linebreak(justify: true)
  #box[
    #v(0.4em)
    $
      cases(
        n^0      &&:= 1,
        n^suc(m) &&:= n^m dot n
      )
    $
  ]
]
you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._

Recall that we have proven the following theorems about natural number arithmetic.

#lemma[
  $(forall x in NN)(suc(x) eq.not 0)$ and $(forall x in NN)(x eq.not 0 implies (exists y in NN)(suc(y) = x))$.
]

#lemma[
  $(forall x in NN)(suc(x) = x + 1)$ and $(forall x in NN)(suc(x) = 1 + x)$.
  // $(forall x in NN)(x + 1 = suc(x) and suc(x) = 1 + x)$.
]

#theorem(name: "Zero is the Additive Identity")[
  // $(forall x in NN)(x + 0 = x = 0 + x)$.
  // $(forall x in NN)((x = x + 0) and (x = 0 + x))$.
  $(forall x in NN)(x = x + 0)$  and $(forall x in NN)(x = 0 + x)$.
]

#theorem(name: "Associativity of Addition")[
  $(forall x, y, z in NN)(x + (y + z) = (x + y) + z)$.
]

#v(1.0em)

Use the theorem of _weak induction_ to prove each of the following theorems.

1. We say that a set $x$ is #define[#{math.in}-transitive] $deff forall y (y in x implies forall z (z in y implies z in x))$. \
  Prove that every natural number is #{math.in}-transitive.

2. We will work up to a proof of commutativity of addition.

  + Prove $(forall x, y in NN)(suc(x + y) = suc(x) + y)$.

  + Prove $(forall x, y in NN)(x + y = y + x)$.
    // #marginalis[
    //   _commutativity of $+$_
    // ]

3. Show that $(forall x, y in NN)(x lt y implies (exists n in NN)(x + n = y))$.

4. Prove that $(forall x, y, z in NN)(x dot.c (y + z) = (x dot.c y) + (x dot.c z))$.
  // #marginalis[
  //   _distributivity (of $dot$ over $+$)_
  // ]

5. Given a sequence of natural numbers $f: NN to NN$ and a natural number $a in NN$,
  we recursively define the #define[iterated summation] of finitely many values of $f$ as follows.
  $
    // sum_(i = a)^(b) f(i)      &:= 0                    &&quad #say[where] b in NN #say[such that] b lt a \
    // sum_(i = a)^(b) &:= f(a) &&quad #say[if] b lt a \
    sum_(i = a)^(a) f(i)      &:= f(a) \
    sum_(i = a)^(suc(b)) f(i) &:= (sum_(i = a)^(b) f(i)) + f(suc(b)) &&quad #say[where] b in NN #say[such that] a lt.eq b \
    // sum_(i = a)^(b) := cases(
    //   0     &#say[if] b lt a,
    //   f(a)  &#say[if] b = a,
    //   sum_(i = a)^() &#say[if] b = a,
    // )
  $
  For completeness, we say $sum_(i = a)^(b)f(i) := 0$ when $b in NN$ such that $b lt a$.
  For this problem, you may also assume _associativity and commutativity of multiplication_ over $NN$.

  Prove that $(forall n in NN)(1 + sum_(i = 0)^(n) 2^i = 2^(n + 1))$.

// //   + Prove $(forall x in NN)(x dot 1 = x)$.

// //   + Prove $(forall x in NN)(1 dot x = x)$.
