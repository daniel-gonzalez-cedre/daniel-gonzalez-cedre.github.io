#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 6",
  number: 6,
  date: datetime(year: 2026, month: 03, day: 08),
)

= The Inductive Nature of Arithmetic

Recall that we introduced a new, compact notation for expressing a common class of first-order sentences.
We will now generalize this notation to any finite number of variables that are _all quantified the same way._
#definition(name: "Restricted Quantifier Notation")[
  Given a set $X$ and a positive integer $n$, we make the following definitions.
  #marginalis[
    We are using the phrase "positive integer" here in an _intuitive_ way to denote the number of variables being quantified.
    The numbers appearing in subscripts---such as $x_1$ and $x_2$---are just ways of distinguishing variables from each other.
  ]
  $
    (forall x_1, ..., x_n in X)(phi(x)) & deff forall x_1 ... forall x_n ((x_1 in X and ... and x_n in X) implies phi(x)) \
    (exists x_1, ..., x_n in X)(phi(x)) & deff exists x_1 ... exists x_n ((x_1 in X and ... and x_n in X) and phi(x))
  $
]

== The Least Element Principle

#definition(name: "Order on " + $NN$)[
  Given $x, y in NN$, we define what it means for $x$ to be #define[(strictly) less than] $y$ as follows.
  $
    x lt y deff x in y
    #apostille[$lt$]
  $
  Similarly, for any $x, y in NN$, we define what it means for $x$ to be #define[less than or equal to] $y$.
  #marginalis[
    Whenever we define a _strict_ order $lt$ on a set $X$,
    we can always define a _weak_ version $lt.eq$ of that order by saying
    $x lt.eq y deff x lt y or x = y$ for all $x, y in X$.
  ]
  $
    x lt.eq y deff (x lt y) or (x = y)
    #apostille[$lt.eq$]
  $
]
We further define $x gt y deff y lt x$ and $x gt.eq y deff y lt.eq x$
#apostille[$gt$ $gt.eq$]
for every $x in NN$ and $y in NN$ as you might expect.
These definitions establish a _strict total order_ $lt$ on $NN$,
along with a corresponding _weak total order_ $lt.eq$,
as we will see in the theorem below.

#theorem(name: "The Natural Numbers are Linearly Ordered by " + $lt.eq$)[
  The order $lt.eq$ defined on the set $NN$ has the following four properties.
  // , making it a #define[linear order]_._

  1. $(forall x in NN)(x lt.eq x)$. #h(1.0fr) _Reflexivity_
  2. $(forall x, y in NN)((x lt.eq y and y lt.eq x) implies x = y)$. #h(1.0fr) _Antisymmetry_
  3. $(forall x, y, z in NN)((x lt.eq y and y lt.eq z) implies x lt.eq z)$. #h(1.0fr) _Transitivity_
  4. $(forall x, y in NN)(x lt.eq y or y lt.eq x)$. #h(1.0fr) _Totality_

  The first three properties make $NN$ with $lt.eq$ a #define[partially ordered] set;
  #marginalis[
    We say a relation $lt.eq$ on a set $X$ is a #define[partial order] by definition iff the relation is _reflexive,_ _antisymmetric,_ and _transitive;_
    i.e., the relation $lt.eq$ satisfies the first three properties listed in _*Theorem 6.1*._
  ]
  the inclusion of the last property makes $NN$ with $lt.eq$ a #define[linearly ordered] set.
]

In fact, the order $lt.eq$ we just defined has one more remarkable property:
whenever we look at a nonempty set of natural numbers---call it $M$, where $M subset NN$ and $M eq.not emptyset$---we can always find an element $m in M$ that is _smallest_ according to the order $lt.eq$ we defined.
To say that $m$ is the _smallest element of $M$_ formally, we would say that $m$ is _"smaller than anything else in $M$,"_ which we could express as $(forall n in M)(m lt.eq n)$.
// A total order, like $lt.eq$, that also has this property 

#theorem(name: "Least Element Property of " + $NN$)[
  $forall M ((M subset NN and M eq.not emptyset) implies (exists m in M)(forall n in M)(m lt.eq n))$.
]
// #proof[
//   // Left as an exercise for the reader.
// ]

// In English, this says that every nonempty set of natural numbers has a _least element._
This theorem is written with our new notation.
To be clear, this theorem is equivalent to the following sentence:
$forall x ((x subset NN and x eq.not emptyset) implies exists y (y in x and forall z (z in x implies y lt.eq z)))$.
This immensely important theorem tells us that $NN$ is #define[well-ordered] by $lt.eq$,
and that makes it possible for us to prove properties of natural numbers in an _interesting_ way.
// and _that_ is what makes it possible to perform _induction_ on the set of natural numbers.

#pagebreak()

// hmm

#theorem(name: "Weak Induction")[
  For any wff $phi$ with at most one free variable, the following equivalence holds.
  $
    (forall n in NN)(phi(n)) iff phi(0) and (forall k in NN)(phi(k) implies phi(suc(k)))
  $
]
#proof[
  Let $phi$ be a wff.
  We will prove the equivalence by showing both directions.
  #fragment(name: "Forwards")[
    Assume $(forall n in NN)(phi(n))$.
    This immediately implies $phi(0)$ since $0 in NN$.
    For the rest of the proof, let $k in NN$ and assume $phi(k)$.
    Observe that $phi(suc(k))$ because we assumed $(forall n in NN)(phi(n))$.
    Therefore, $phi(k) implies phi(suc(k))$,
    and we can thus conclude $(forall n in NN)(phi(n) implies phi(suc(n)))$ as desired.
  ]
  #fragment(name: "Backwards")[
    Assume $phi(0)$ and $(forall k in NN)(phi(k) implies phi(suc(k)))$.
    Towards a contradiction, suppose there exists $n in NN$ such that $not phi(n)$.
    Consider $M := {x st x in NN and not phi(x)}$, the set of all counterexamples to $phi$.
    Because we assumed $not phi(n)$ and $n in NN$, we know that $n in M$ by definition, so $M eq.not emptyset$.
    Further, $M subset NN$ because every element of $M$ must be a natural number.
    Thus, we know that there exists some $m in M$ such that $(forall x in M)(m lt.eq x)$ by _*Theorem 6.1*._
    Since $m in M$, we know $m in NN$
    #marginalis[
      Recall there are two kinds of natural numbers:
      _zero_ and the ones that are _successors._
    ]
    and $not phi(m)$.
    #case[
      Suppose $m = 0$ and recall that $not phi(m)$ because $m in M$.
      We know $phi(0)$ by assumption, which means we know $phi(m)$, contradicting $not phi(m)$.
      #contradiction
    ]
    #case[
      Suppose that there exists $ell in NN$ such that $m = suc(ell)$.
      // By definition, this means $m = suc(ell) = ell union {ell}$.
      // Because $ell in {ell}$, we know $ell in ell union {ell}$, so $ell in m$.
      // Since we know $forall x (x in.not x)$, we can say $ell eq.not m$.
      // We should now consider two cases based on whether $phi$ is _true_ about $ell$.
      We now take two cases.
      #case(number: 2.1)[
        Suppose $phi(ell)$.
        Recall $(forall k in NN)(phi(k) implies phi(suc(k)))$,
        so that we have $phi(ell) implies phi(suc(ell))$, which implies $phi(ell) implies phi(m)$.
        By _modus ponens,_ we obtain $phi(m)$.
        This contradicts $not phi(m)$, which we know because $m in M$.
        #contradiction
      ]
      #case(number: 2.2)[
        Suppose $not phi(ell)$, telling us that $ell in M$ by definition.
        Since $m$ is the _least element_ of $M$,
        we know $m lt.eq ell$, implying $(m in ell) or (m = ell)$ by definition.
        // Recalling $ell eq.not m$, we now know $m lt ell$, meaning $m in ell$ by definition.
        Now, recall that $m = suc(ell)$, meaning $m = ell union {ell}$ by definition.
        Because $ell in {ell}$, we know $ell in ell union {ell}$, and thus $ell in m$.
        Since we know $forall x (x in.not x)$, we can say $ell eq.not m$.
        Combining all of these facts together, we realize that $m in ell$ and $ell in m$,
        contradicting the theorem $forall x forall y (x in y implies y in.not x)$.
        #contradiction
      ]
    ]
    We have contradictions in both cases, so we instead conclude $phi(n)$ as desired.
  ]
  Having proven both directions, we are now burdened with the weight of knowing that
  $(forall n in NN)(phi(n)) iff phi(0) and (forall k in NN)(phi(k) implies phi(suc(k)))$.
]


#lemma[
  $(forall x in NN)(suc(x) eq.not 0)$.
]
#proof[
  Let $x in NN$.
  // Note $x in {x}$, so $x in x union {x}$, so $x in suc(x)$ by definition, so $suc(x) eq.not emptyset$.
  Notice that $x in {x}$, so that $x in x union {x}$, so that $x in suc(x)$ by definition.
  Therefore, $suc(x) eq.not emptyset$, which means $suc(x) eq.not 0$ by definition.
]

// #lemma[
//   $(forall x in NN)(x eq.not 0 implies (exists y in NN)(suc(y) = x))$.
// ]
// #proof[
//   We will prove $(forall x in NN)(x eq.not 0 implies (exists y in NN)(suc(y) = x))$ by _weak induction._
//   #case-basis[
//     Assume that $0 eq.not 0$.
//     However, we know that $0 = 0$.
//     We therefore conclude that $(exists y in NN)(suc(y) = 0)$ by the _principle of explosion._
//   ]
//   #case-inductive[
//     Let $k in NN$ and assume $k eq.not 0 implies (exists y in NN)(suc(y) = k)$.
//     Assume $suc(k) eq.not 0$; we want to prove that $(exists y in NN)(suc(y) = suc(k))$.
//     Observe that $k in NN$ and that $suc(k) = suc(k)$.
//     Therefore, $(exists y in NN)(suc(y) = suc(k)$.
//   ]
//   Therefore, we conclude that $(forall x in NN)(x eq.not 0 implies (exists y in NN)(suc(y) = x))$ as desired.
// ]

#pagebreak()

== Addition

#definition(name: "Addition on the Natural Numbers")[
  // For any natural number $n in NN$, we define what it means to add $n$ with another natural number recursively as follows.
  We define how to #define[add] a natural number $n in NN$ with another one as follows.
  #apostille[$+$]
  $
    n & + 0      && := n \
    n & + suc(m) && := suc(n + m) && quad #say[if] m in NN
  $
]

#lemma[
  $1 + 1 = 2$.
]
#proof[
  Observe the following sequence of equalities.
  $
    1 + 1 & = 1 + suc(0) && quad #say[by definition of] 1 \
          & = suc(1 + 0) && quad #say[by definition of] + \
          & = suc(1)     && quad #say[by definition of] + \
          & = 2          && quad #say[by definition of] 2
  $
  Therefore, $1 + 1 = 2$.
  Rejoice.
]

#lemma[
  $(forall x in NN)(x + 0 = x)$.
]
#proof[
  Let $x in NN$ and observe that $x + 0 = x$ by definition of addition on $NN$.
]

#lemma[
  $(forall x in NN)(0 + x = x)$.
]
#proof[
  We will show $(forall n in NN)(0 + n = n)$ by _weak induction._
  #case-basis[
    Observe that $0 + 0 = 0$ by definition of addition on $NN$.
  ]
  #case-inductive[
    Let $k in NN$, and assume that $0 + k = k$.
    We will show $0 + suc(k) = suc(k)$.
    Observe.
    $
      0 + suc(k) & = suc(0 + k) && quad #say[by definition of] + \
                 & = suc(k)     && quad #say[by the _inductive hypothesis_] \
    $
  ]
  Therefore, we can conclude $(forall n in NN)(0 + n = n)$ as desired.
]

#lemma[
  $(forall x in NN)(x + 1 = suc(x))$.
]
#proof[
  Let $x in NN$.
  Observe the following.
  $
    x + 1 & = x + suc(0) && quad #say[by definition of] 1 \
          & = suc(x + 0) && quad #say[by definition of] + \
          & = suc(x)     && quad #say[by definition of] +
  $
  Therefore, $x + 1 = suc(x)$ as desired.
]

// #pagebreak()

#theorem(name: "Associativity of Addition")[
  $(forall x, y, z in NN)(x + (y + z) = (x + y) + z)$.
]
#proof[
  Let $x, y in NN$.
  We prove $(forall z in NN)(x + (y + z) = (x + y) + z)$ by _weak induction._
  #case-basis[
    Notice that $x + (y + 0) = x + y = (x + y) + 0$ by definition of addition on $NN$.
    // $
    //   x + (y + 0) & = x + y       && quad #say[by definition of] + \
    //               & = (x + y) + 0 && quad #say[by definition of] +
    // $
  ]
  #case-inductive[
    Let $k in NN$ and assume that $x + (y + k) = (x + y) + k$.
    Observe now the following.
    $
      x + (y + suc(k)) & = x + suc(y + k)    && quad #say[by definition of] + \
                       & = suc(x + (y + k))  && quad #say[by definition of] + \
                       & = suc((x + y) + k)  && quad #say[by the _inductive hypothesis_] \
                       & = (x + y) + suc(k)  && quad #say[by definition of] +
    $
    We thus have $x + (y + suc(k)) = (x + y) + suc(k)$.
  ]
  We can therefore conclude that $(forall z in NN)(x + (y + z) = (x + y) + z)$ as desired.
]

#theorem(name: "Commutativity of Addition")[
  $(forall x, y in NN)(x + y = y + x)$.
]
#proof(exercise: true)[
  This proof is left as an exercise to the reader.
]

== Multiplication

#definition(name: "Multiplication on the Natural Numbers")[
  We define how to #define[multiply] a natural number $n in NN$ with another one as follows.
  #apostille[$dot$]
  $
    n & dot 0      && := 0 \
    n & dot suc(m) && := (n dot m) + n && quad #say[if] m in NN
  $
]

#lemma(name: "One is the Multiplicative Identity")[
  $(forall x in NN)((x dot 1 = x) and (1 dot x = x))$.
]
#proof[
  First, let $n in NN$ and observe that
  $n dot 1 = n dot suc(0) = (n dot 0) + n = 0 + n$ by the definition of multiplication.
  Recalling that addition is commutative, we can then see $0 + n = n + 0 = n$ by the definition of addition.
  Thus, $(forall x in NN)(1 dot x = x)$. \
  Next, we will prove $(forall x in NN)(1 dot x = x)$ by _weak induction._
  #case-basis[
    Observe that $1 dot 0 = 0$ by the definition of multiplication.
  ]
  #case-inductive[
    Let $k in NN$ and assume $1 dot k = k$.
    We will now show $1 dot suc(k) = suc(k)$.
    Observe.
    $
      1 dot suc(k) & = (1 dot k) + 1 && quad #say[by definition of multiplication] \
                   & = k + 1         && quad #say[by the _inductive hypothesis_] \
                   & = suc(k)        && quad #say[because $(forall x in NN)(suc(x) = x + 1)$] \
    $
    // Thus, we have $1 dot suc(k) = suc(k)$ as desired.
  ]
  Therefore, we can conclude that $(forall x in NN)(1 dot x = x)$.
]

#lemma(name: "Zero is the Multiplicative Annihilator")[
  $(forall x in NN)((x dot 0 = 0) and (0 dot x = 0))$.
]
#proof[
  First, let $n in NN$ and observe that $n dot 0 = 0$ by the definition of multiplication.
  Thus, $(forall x in NN)(x dot 0 = 0)$.
  Next, we will show $(forall x in NN)(0 dot x = 0)$ by _weak induction._
  #case-basis[
    Observe that $0 dot 0 = 0$ by the definition of multiplication.
  ]
  #case-inductive[
    Let $k in NN$ and assume $0 dot k = 0$.
    We will now show $0 dot suc(k) = 0$.
    Observe.
    $
      0 dot suc(k) & = (0 dot k) + 0 && quad #say[by definition of multiplication] \
                   & = 0 + 0         && quad #say[by the _inductive hypothesis_] \
                   & = 0             && quad #say[by definition of addition] \
    $
    Thus, we have that $0 dot suc(k) = 0$ as desired.
  ]
  Therefore, we can conclude that $(forall x in NN)(0 dot x = 0)$.
]

#theorem(name: "Distributivity of Multiplication over Addition")[
  $(forall x, y, z in NN)(x dot (y + z) = (x dot y) + (x dot z))$.
]
#proof(exercise: true)[
  Left as an exercise for the reader.
]

#theorem(name: "Associativity of Multiplication")[
  $(forall x, y, z in NN)(x dot (y dot z) = (x dot y) dot z)$.
]
#proof[
  Let $x, y in NN$.
  We will prove $(forall z in NN)(x dot (y dot z) = (x dot y) dot z)$ by _weak induction._
  #case-basis[
    Notice that $x dot (y dot 0) = x dot 0 = 0$ by the definition of multiplication on $NN$.
    Similarly, we can see that $(x dot y) dot 0 = 0$ by the same definition.
    Thus, $x dot (y dot 0) = (x dot y) dot 0$.
  ]
  #case-inductive[
    Let $k in NN$, and assume $x dot (y dot k) = (x dot y) dot k$.
    We now observe with our eyeballs.
    $
      x dot (y dot suc(k)) & = x dot ((y dot k) + y)     && quad #say[by definition of] dot \
                           & = x dot (y dot k) + x dot y && quad #say[by _distributivity_ of] dot #say[over] + \
                           & = (x dot y) dot k + x dot y && quad #say[by the _inductive hypothesis_] \
                           & = (x dot y) dot suc(k)      && quad #say[by definition of] dot \
    $
    As a result, we have that $x dot (y dot suc(k)) = (x dot y) dot suc(k)$.
  ]
  Therefore, we can conclude $(forall z in NN)(x dot (y dot z) = (x dot y) dot z)$ as desired.
]

#theorem(name: "Commutativity of Multiplication")[
  $(forall x, y in NN)(x dot y = y dot x)$.
]
#proof[
  This proof is left as an exercise to the reader.
]

== Higher-Order Operations

#definition(name: "Exponentiation")[
  We define how to #define[exponentiate] any $n in NN$ with a natural number exponent as follows.
  #apostille[$arrow.t$]
  $
    n^0      & := 1 \
    n^suc(m) & := n^m dot n && quad #say[if] m in NN
  $
]

#theorem[
  $(forall x, y, z in NN)(x^y dot x^z = x^(y + z))$.
]

#definition(name: "Tetration")[
  We define how to raise any $n in NN$ to a natural number exponent recursively below.
  #apostille[$arrows.tt$]
  $
    n & arrows.tt 0      && := 1 \
    n & arrows.tt suc(m) && := n^(n arrows.tt m) && quad #say[if] m in NN
  $
]
