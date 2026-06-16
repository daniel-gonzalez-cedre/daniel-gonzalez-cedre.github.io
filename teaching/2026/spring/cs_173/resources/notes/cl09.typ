#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 9",
  number: 9,
  date: datetime(year: 2026, month: 03, day: 23),
)

= The Theory of Numbers

At this point now, having covered the material from the previous set of notes,
we can take for granted all of the _"grade school"_ arithmetic and algebraic properties of $NN$ and $ZZ$.

#theorem(name: "Strong Induction")[
  For any wff $phi$ with at most one free variable, the following equivalence holds.
  $
    (forall n in NN)(phi(n)) & iff phi(0) and (forall k in NN)((forall ell in NN)(ell lt k space arrow.r.double space phi(ell)) space arrow.r.double space phi(k)) \
                             & iff phi(0) and (forall k in NN)((forall ell in NN)(ell lt.eq k space arrow.r.double space phi(ell)) space arrow.r.double space phi(k + 1)) \
  $
  #v(- 1.0em)
]

== The Fundamentals

#definition(name: "Divisibility")[
  Given two integers $x, y in ZZ$,
  we say that #define[$x$ divides $y$] when $y$ is an integer multiple of $x$.
  #marginalis[
    It is important to note $x divides y$ is a _sentence,_ as opposed to an _object_ like the quotient $x / y$.
  ]
  #apostille[divides]
  $
    x divides y deff (exists z in ZZ)(x dot z = y)
    #apostille[$x divides y$]
  $
  When $x divides y$, we typically call $x$ the #define[divisor] and $y$ the #define[dividend] in the relationship.
]

// This definition has several immediate consequences.
It should be clear that $x divides y implies -x divides y$ and $x divides y implies x divides -y$ for any $x, y in ZZ$, so sign does not impact divisibility relationships.
Further, the integer $1$ divides every other integer.

#lemma(name: "One is a Universal Divisor")[
  $(forall x in ZZ)(1 divides x)$.
]
#proof[
  Let $x in ZZ$ and notice $1 dot x = x$.
  Since $x in ZZ$, we can conclude $1 divides x$ by definition.
]

// In another example of _duality,_ the integer $0$ is divisible by any other integer.
This establishes $1$ as a _universal divisor_ in $ZZ$.
#marginalis[
  In the language of category theory, this property makes $1$ an _initial object._
]
The integer $0$ plays a role _"dual"_ to $1$ with respect to divisibility;
whereas $1$ is a universal divisor, $0$ is a _universal dividend._
#marginalis[
  In the language of category theory, this property makes $0$ a _terminal object._
]

#lemma(name: "Zero is a Universal Dividend")[
  $(forall x in ZZ)(x divides 0)$.
]
#proof[
  Let $x in ZZ$ and observe that $x dot 0 = 0$.
  Since $0 in ZZ$, we have that $x divides 0$ by definition.
]

We will soon see that the relation established by divisibility on $NN$ has all of the same properties that the $lt.eq$ ordering on $NN$ did.
Divisibility gives us a different perspective from which we can think about _ordering_ the integers.


#theorem(name: "Divisibility is Absolutely Monotonic")[
  $(forall x, y in ZZ)((x divides y and y eq.not 0) implies abs(x) lt.eq abs(y))$.
]

As a consequence of this theorem, whenever $x, y in NN_+$ such that $x divides y$, we know $x lt y$.
This is an incredibly useful fact to keep in mind as we develop our understanding of divisibility---we don't yet know too much about what $x divides y$ means, but we know a few things about what $x lt.eq y$ means by this point.
Let's learn some more about divisibility.

#lemma[
  $(forall x in ZZ)(0 divides x implies x = 0)$.
]
#proof[
  Let $x in ZZ$ and assume $0 divides x$.
  By definition, this means $0 dot k = x$ for some $k in ZZ$.
  Since $0 = 0 dot k$, this implies $0 = 0 dot k = x$ as desired.
]

#lemma[
  $(forall x in ZZ)(x divides 1 implies abs(x) = 1)$.
]
#proof[
  Let $x in ZZ$ and assume $x divides 1$.
  This implies $abs(x) lt.eq abs(1) = 1$ by the absolute monotonicity of divisibility.
  $abs(x) lt.eq 1$ implies that either $x lt.eq 1$ or $-x lt.eq 1$,
  #marginalis[
    This follows from the definition of the absolute value function.
  ]
  and we can see that $-x lt.eq 1 iff -1 lt.eq x$.
  Thus, we have $x in {-1, 0, 1}$.
  Now, towards a contradiction, assume that $x = 0$.
  Then, $0 divides 1$, which implies $1 = 0$ by _Lemma 9.3,_ contradicting the fact that we know $1 eq.not 0$.
  #contradiction
  Therefore, $x eq.not 0$, implying $x in {-1, 1}$, so that $abs(x) = 1$.
]

#lemma[
  $(forall n, x, y, a, b in ZZ)((n divides x and n divides y) implies n divides a x + b y)$.
]
#proof(exercise: true)[
  This proof is left as an exercise to the reader.
]

The next three theorems establish that divisibility is _almost_ a partial order on the integers.
In fact, if we restated the next three theorems for $NN$ instead of for $ZZ$, then we would see that divisibility _is_ a partial order on the _natural numbers._

#lemma(name: "Divisibility is Almost a Partial Order on the Integers")[
  The following three statements are _true._
  1. $(forall x in ZZ)(x divides x)$.
    #marginale[_Reflexivity_]
  2. $(forall x, y in ZZ)(x divides y and y divides x implies abs(x) = abs(y))$.
    #marginale[_Antisymmetry (almost)_]
  3. $(forall x, y, z in ZZ)((x divides y and y divides z) implies x divides z)$.
    #marginale[_Transitivity_]
]
#proof[
  1. Let $x in ZZ$ and recall that $x dot 1 = x$.
    Since $1 in ZZ$, we know $x divides x$ by definition.

  2. Let $x, y in ZZ$.
    Assume $x divides y$ and $y divides x$.
    We can see that $x divides y$ implies $abs(x) lt.eq abs(y)$. \
    Similarly, since $y divides x$, we know $abs(y) lt.eq abs(x)$.
    We can then conclude that $abs(x) = abs(y)$.

  3. Let $x, y, z in ZZ$.
    Assume $x divides y$ and $y divides z$.
    Then, we know there exist $k_1 in ZZ$ and $k_2 in ZZ$ such that $x dot k_1 = y$ and $y dot k_2 = z$ by definition.
    // Since $x divides y$, we know there exists $k_1 in ZZ$ such that $x dot k_1 = y$ by definition.
    // Since $y divides z$, we know there exists $k_2 in ZZ$ such that $y dot k_2 = z$.
    // Combining these facts, we can observe the following.
    We can then observe.
    $
      y dot k_2 = (x dot k_1) dot k_2 = x dot (k_1 dot k_2) = z
    $
    Since $k_1 in ZZ$ and $k_2 in ZZ$, we know $k_1 dot k_2 in ZZ$, so that $x divides z$ by definition.
]

// #lemma(name: "Divisibility is Reflexive")[
//   $(forall x in ZZ)(x divides x)$.
// ]
// #proof[
//   Let $x in ZZ$ and recall that $x dot 1 = x$.
//   Since $1 in ZZ$, we now know $x divides x$ by definition.
// ]

// #lemma(name: "Divisibility is Absolutely Antisymmetric")[
//   $(forall x, y in ZZ)((x divides y and y divides x) implies abs(x) = abs(y))$.
//   #marginalis[
//     Note: restricting ourselves to $NN$,
//     we could prove that $(x divides y and y divides x) implies x = y$ for all $x, y in NN$,
//     which would _actually_ be _antisymmetry;_
//     however, this is not _true_ over $ZZ$.
//     For example, $-1 divides 1$ and $1 divides -1$, but $-1 eq.not 1$.
//   ]
// ]
// #proof[
//   Let $x, y in ZZ$ and assume that $x divides y$ and $y divides x$.
//   Since $x divides y$, we know $abs(x) lt.eq abs(y)$ by _Theorem 9.1._
//   Similarly, since $y divides x$, we know $abs(y) lt.eq abs(x)$.
//   We can then conclude that $abs(x) = abs(y)$.
// ]

// #lemma(name: "Divisibility is Transitive")[
//   $(forall x, y, z in ZZ)((x divides y and y divides z) implies x divides z)$.
// ]
// #proof[
//   Let $x, y, z in ZZ$ and assume that $x divides y$ and $y divides z$.
//   Since $x divides y$, we know by definition that there exists $k_1 in ZZ$ such that $x dot k_1 = y$.
//   Similarly, since $y divides z$, we know there exists $k_2 in ZZ$ such that $y dot k_2 = z$.
//   Combining these facts, we can observe the following.
//   $
//     y dot k_2 = (x dot k_1) dot k_2 = x dot (k_1 dot k_2) = z
//   $
//   Since $k_1 in ZZ$ and $k_2 in ZZ$, we know $k_1 dot k_2 in ZZ$, letting us conclude $x divides z$ by definition.
// ]

#definition(name: "Primality")[
  We call a natural number $n in NN$ #define[prime] when $n > 1$ and $n$ has as few divisors as possible.
  #apostille[prime]
  $
    prime(n) deff (n > 1) and (forall p in NN)(p divides n implies p in {1, n})
  $
  // We say that $n$ is #define[composite] when $n$ is not prime.
  If $n$ is not prime, then we usually say that $n$ is #define[composite]_._
]

#theorem(name: "Fundamental Lemma of Arithmetic")[
  $(forall n in NN)(n gt.eq 2 implies (exists p in NN)(prime(p) and p divides n))$.
]
#proof[
  // We will prove every natural number has a prime divisor by _strong induction._
  We show every natural number after $1$ has a prime divisor by _strong induction._
  #case-basis[
    Let $x in NN$ such that $x divides 2$.
    This implies $abs(x) lt.eq abs(2)$, so that $x lt.eq 2$, meaning $x in {0, 1, 2}$.
    Towards a contradiction, suppose $x = 0$;
    then, since $x divides 2$, we know $0 divides 2$, so that $2 = 0$,
    contradicting the fact that $2 eq.not 0$.
    #contradiction
    Thus, $x eq.not 0$, so that $x in {1, 2}$.
    From all of this, we now know that $prime(2)$ by definition.
    We conclude by recalling $2 divides 2$.
  ]
  #case-inductive[
    Let $k in NN without {0, 1}$.
    Assume $(forall ell in NN)(ell lt k implies (exists p in NN)(prime(p) and p divides ell))$.
    #marginalis[This sentence is our _strong inductive hypothesis._]
    We now take two cases based on whether or not $k$ is prime.
    #case[
      Suppose that $prime(k)$.
      Recalling $k divides k$ since $(forall x in ZZ)(x divides x)$, we are done.
    ]
    #case[
      Suppose that $composite(k)$.
      By definition, this means that there exists $m in NN$ such that $m divides k$ and $m eq.not 1$ and $m eq.not k$ by definition.

      Towards a contradiction, suppose that $m = 0$;
      this would imply $0 divides k$, so that $k = 0$, contradicting the fact that $k > 1$.
      #contradiction
      Thus, we also know $m eq.not 0$;
      recalling that $m eq.not 1$, we can then deduce $m > 1$.

      Now, remembering $m divides k$, we can see that $abs(m) lt.eq abs(k)$, so that $m lt.eq k$.
      Combined with the fact that $m eq.not k$, we now know $m lt k$.

      This all means that we can apply our _inductive hypothesis_ to realize there exists $p in NN$ such that $prime(p)$ and $p divides m$.
      If we recall that $m divides k$ by assumption, then transitivity of divisibility yields $p divides k$ as we wanted.
    ]
  ]
  Therefore, $(forall n in NN)(n gt 1 implies (exists p in NN)(prime(p) and p divides n))$.
]

#theorem(name: "Fundamental Theorem of Arithmetic")[
  For every $n in NN$ such that $n gt.eq 2$,
  there exists a _unique_ $k in NN$,
  and there exist _unique_ $p_0, ..., p_k in NN$,
  and there exist _unique_ $alpha_0, ..., alpha_k in NN_+$
  such that the following hold.

  // satisfying the following three conditions.
  - $(forall i, j in k)(i eq.not j implies p_i eq.not p_j)$.

  // - $(forall i, j in {x in NN st 0 lt.eq x lt.eq k})(i eq.not j implies p_i eq.not p_j)$.
  - $(forall i in k)(prime(p_i))$.

  // - $(forall i in {x in NN st 0 lt.eq x lt.eq k})(prime(p_i))$.
  - $display(n = product_(i = 1)^(k) p_i^(alpha_i))$
]
// #proof[
//   We leave this proof 
// ]

#v(1.0em)

#theorem(name: "Euclid's Division Lemma")[
  $(forall x, y in ZZ)(y eq.not 0 implies (exists ! q, r in ZZ)(x = q y + r space and space 0 lt.eq r lt abs(y)))$.
]
#proof[
  We first prove existence and then uniqueness.
  Let $x, y in ZZ$ such that $y eq.not 0$.
  #case[
    Suppose $y gt 0$ and observe the following deductions.
    $
      x gt.eq 0 & implies x = 0 dot y + x \
      x lt    0 & implies x = x dot y + (x - x dot y) \
    $
    Thus, in either case, we know $(exists q, r in ZZ)(x = q dot y + r and r gt.eq 0)$.
    Now, consider $R := {r in NN st (exists q in ZZ)(x = q dot y + r)}$.
    As we just saw, $R eq.not emptyset$, and we can also clearly see $R subset NN$.
    Therefore, there exists $r_0 in R$ such that $(forall s in R)(r_0 lt.eq s)$.

    Towards a contradiction, assume $r_0 lt.not abs(y)$,
    so that $r_0 gt.eq abs(y)$,
    implying $r_0 - abs(y) gt.eq 0$.
    Since $r_0 in R$, we know there exists $q_0 in ZZ$ such that $x = q_0 dot y +  r_0$ by definition.
    $
      x & = q_0 dot y + r_0 \
        & = q_0 dot y + (r_0 - abs(y) + abs(y)) \
        & = (q_0 dot y + abs(y)) + (r_0 - abs(y)) \
        & = (q_0 dot y + y) + (r_0 - y) && quad #say[since we assumed] y gt 0 \
        & = (q_0 + 1) dot y + (r_0 - y) \
    $
    Now, notice $q_0 + 1 in ZZ$.
    Since we assumed $r_0 gt.eq abs(y)$, and $abs(y) = y$ because $y gt 0$, we also now know $0 lt.eq r_0 - y lt r_0$.
    All this means that $r_0 - y in R$ by definition;
    however, $r_0 - y lt r$ contradicts the fact that $(forall s in R)(r_0 lt.eq s)$.
    #contradiction
    Thus, $r_0 lt abs(y)$.
    We therefore conclude $(exists q, r in ZZ)(x = q dot y + r and 0 lt.eq r lt abs(y))$.
    This proves existence.

    To prove uniqueness, suppose that $x = q_1 dot y + r_1$ and $x = q_2 dot y + r_2$ for some $q_1, r_1, q_2, r_2 in ZZ$ such that $0 lt.eq r_1 lt abs(y)$ and $0 lt.eq r_2 lt abs(y)$.
    Combining information from these two inequalities and recalling $y gt 0$ shows us the following.
    $
      0 lt.eq r_1 lt abs(y) & implies r_1 lt y \
                            & implies r_1 - r_2 lt y - r_2 \
                            & implies r_1 - r_2 lt y - r_2 lt.eq y \
                            & implies r_1 - r_2 lt y \
    $
    $
      0 lt.eq r_2 lt abs(y) & implies r_2 lt y \
                            & implies r_2 - r_1 lt y - r_1 \
                            & implies r_2 - r_1 lt y - r_1 lt.eq y \
                            & implies r_2 - r_1 lt y \
                            & implies -(r_1 - r_2) lt y \
    $
    From our results $r_1 - r_2 lt y$ and $-(r_1 - r_2) lt y$ above, we can see $abs(r_1 - r_2) lt y$.
    Now, towards a contradiction, suppose $r_1 eq.not r_2$, so that $r_1 - r_2 eq.not 0$.
    By subtracting one equation from the other, we can infer that $y$ divides $abs(r_1 - r_2)$ as shown below.
    $
      x - x = (q_1 - q_2) dot y + (r_1 - r_2) & implies 0 = (q_1 - q_2) dot y + (r_1 - r_2) \
                                              & implies - (q_1 - q_2) dot y = r_1 - r_2 \
                                              & implies abs(q_1 - q_2) dot y = abs(r_1 - r_2) \
                                              & implies y divides abs(r_1 - r_2) \
                                              & implies abs(y) lt.eq abs(r_1 - r_2)
                                              #marginale[... since $r_1 - r_2 eq.not 0$.] \
                                              & space implies y lt.eq abs(r_1 - r_2)
    $
    However, $y lt.eq abs(r_1 - r_2)$ contradicts our earlier result $abs(r_1 - r_2) lt y$.
    #contradiction
    Thus, $r_1 = r_2$.
    Knowing this, we can return to our earlier equation and prove $q_1 = q_2$ as follows.
    $
      0 = (q_1 - q_2) dot y + (r_1 - r_2) & implies 0 = (q_1 - q_2) dot y + 0 \
                                          & implies 0 = (q_1 - q_2) dot y \
                                          & implies q_1 - q_2 divides 0 \
                                          & implies q_1 - q_2 = 0 \
                                          // & implies q_1 = q_2 \
    $
    Therefore, $q_1 = q_2$ and $r_1 = r_2$, so the claimed integers are unique.
  ]
  #case[
    Suppose $y lt 0$.
    This case is left as an exercise for the reader.
  ]
]

#definition(name: "Greatest Common Divisor")[
  Given $x, y in ZZ$, we say that $d in NN$ is the #define[greatest common divisor] of $x$ and $y$ iff the following three conditions hold.
  1. $d divides x$.
  2. $d divides y$.
  3. $(forall z in ZZ)((z divides x and z divides y) implies z divides d)$.
  It is a theorem that such a number always exists and is unique for any given $x, y in ZZ$.
  We denote this number---_the_ greatest common divisor of $x$ and $y$---by $gcd(x, y)$.
  #apostille[$gcd(square.stroked.dotted, square.stroked.dotted)$]
]

#definition(name: "Least Common Multiple")[
  Given $x, y in ZZ$, we say that $m in NN$ is the #define[least common multiple] of $x$ and $y$ iff the following three conditions hold.
  1. $x divides m$.
  2. $y divides m$.
  3. $(forall z in ZZ)((x divides z and y divides z) implies m divides z)$.
  It is a theorem that such a number always exists and is unique for any given $x, y in ZZ$.
  We denote this number---_the_ least common multiple of $x$ and $y$---by $lcm(x, y)$.
  #apostille[$lcm(square.stroked.dotted, square.stroked.dotted)$]
  #marginale[
    For any integers $x$ and $y$, we can clearly see that $gcd(x, y) = gcd(y, x)$ and $lcm(x, y) = lcm(y, x)$.
  ]
]

#exercise[
  For any $x in ZZ$, we have $gcd(x, 0) = abs(x)$ and $gcd(x, 1) = 1$.
]

#exercise[
  $(forall x, y in ZZ)((x = 0 and y = 0) iff gcd(x, y) = 0)$.
]

#exercise[
  // For any $x, y in ZZ$, if $x eq.not 0$ or $y eq.not 0$, then $gcd(x, y) gt.eq 1$.
  $(forall x, y in ZZ)((x eq.not 0 or y eq.not 0) iff gcd(x, y) gt.eq 1)$
]

#definition(name: "Coprimality")[
  We say two integers $x, y in ZZ$ are #define[coprime] iff $gcd(x, y) = 1$.
  #apostille[coprime]
]

#theorem[
  $(forall x, y in ZZ)(gcd(x, y) = 1 iff (forall p in NN)(prime(p) implies (p divides.not x or p divides.not y)))$.
]

#exercise[
  $(forall a, b, c in ZZ)(a = b + c implies gcd(a, b) = gcd(b, c) = gcd(a, c))$.
]

#algorithm(name: "Euclid's Division Algorithm")[
  $
    gcd(x, y) = cases(
      x         & space #say[if] y = 0,
      gcd(y, r) & space #say[if] y eq.not 0#say[, where]
                        r in ZZ #say[such that],
                & space space 0 lt.eq r lt abs(y)
                        #say[and] (exists q in ZZ)(x = q y + r)
      // gcd(y, r) & space #say[if] y eq.not 0#say[, where] r #say[satisfies],
      //           & space (0 lt.eq r lt abs(y)) and (exists q in ZZ)(x = q dot y + r)
    )
  $
]

#theorem[
  For any $x, y in ZZ$, we have $abs(x dot y) = gcd(x, y) dot lcm(x, y)$.
]

#theorem(name: "Bezout's Identity")[
  $(forall x, y in ZZ)(exists a, b in ZZ)(gcd(x, y) = a x + b y)$.
]
// #proof(exercise: true)[
//   This proof was discussed in class and will be written up soon.
// ]

#theorem(name: "Euclid's Lemma")[
  $(forall p in NN)(forall x, y in NN)((prime(p) and p divides a dot b) implies (p divides a or p divides b))$.
]
// #proof(exercise: true)[
//   This proof was not discussed in class, but is provided the _"reference"_ notes.
// ]

#corollary[
  $(forall x, y, z in ZZ)((gcd(x, y) = 1 and x divides y dot z) implies x divides z)$.
]
