#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 10",
  number: 10,
  date: datetime(year: 2026, month: 04, day: 13),
)

// #set math.lr(size: 110%)

= Learning How to Count

#definition(name: sym.circle.dotted + "-jections")[
  Let $X$ and $Y$ be sets and consider a function $f: X to Y$.
  When $x in X$ and $y in Y$ such that $f(x) = y$, we usually call $y$ #define[the image of $x$ (under $f$)]_,_ and $x$ as #define[a preimage for $y$ (under $f$)].

  An injective function always maps distinct inputs to distinct outputs,
  so that there is _at most one preimage_ for any image under $f$.
  Formally, we say that $f$ is an #define[injection] #emph[iff] $(forall x_1, x_2 in X)(x_1 eq.not x_2 implies f(x_1) eq.not f(x_2))$.
  This is equivalent to the contrapositive statement $(forall x_1, x_2 in X)(f(x_1) = f(x_2) implies x_1 = x_2)$.

  A surjective function maps onto its _entire_ codomain,
  so every element of the codomain _has at least one preimage._
  Formally, $f$ is a #define[surjection] #emph[iff] $(forall y in Y)(exists x in X)(f(x) = y)$.

  A #define[bijective] function, as the name implies, is one that is both injective and surjective.
]

#lemma[
  For any codomain $Y$, there is a _unique_ function $phi: emptyset to Y$.
  This function $phi$ is the empty set $emptyset$ (sometimes called the _"empty function"_), and $phi$ is necessarily injective.
]

#lemma[
  For any nonempty domain $X eq.not emptyset$, there are _*no*_ functions $psi: X to emptyset$.
]

#definition(name: "Relative Cardinalities")[
  Let $X$ and $Y$ be sets.
  We measure the relative sizes of sets based on the kinds of functions definable between them.
  We will refer to the _"size"_ of a set as its _"cardinality."_

  If it is possible to define an injection between $X$ and $Y$, then there must be enough room within $Y$ to _spread out_ the elements of $X$ without overlapping them.
  In this situation, we will say that the cardinality of $X$ is no greater than the cardinality of $Y$.
  Formally, we define $card(X) lt.eq card(Y)$ #emph[iff] there exists an injective function $f: X to Y$.
  #apostille[$card(X) lt.eq card(Y)$]

  If it is possible to define a surjection between $X$ and $Y$, then there must be enough elements in $X$ to cover all of $Y$ without having to send anything to two different places.
  In this situation, we will say that the cardinality of $Y$ is no greater than the cardinality of $X$.
  However, we must make a special exception here when $X eq.not emptyset$ and $Y = emptyset$; in this situation, there do not exist _any_ functions from $X$ to $Y$, but we would still like to be able to say that the nonempty set $X$ forming the domain is _"larger"_ than the empty set $Y$ forming the codomain.
  Therefore, we will formally define $card(X) gt.eq card(Y)$ by cases.
  #apostille[$card(X) gt.eq card(Y)$]
  When $Y eq.not emptyset$, we will define $card(X) gt.eq card(Y)$ to mean that there exists a surjective function $f: X to Y$.
  However, when $Y = emptyset$, we will simply say that $card(X) gt.eq card(emptyset)$ is always _true_ by definition.

  Now, when we can find a function between two sets that is _simultaneously_ injective and surjective, it should be intuitive by the above reasoning that the sets _"have the same size."_
  Thus, we define $card(X) = card(Y)$ #emph[iff] there exists a bijective function $f: X to Y$.
  #apostille[$card(X) = card(Y)$]

  We will introduce strict versions of the above relations in the normal expected way. \
  Define $card(X) lt card(Y) deff card(X) lt.eq card(Y) and card(X) eq.not card(Y)$, and
  define $card(X) gt card(Y) deff card(X) gt.eq card(Y) and card(X) eq.not card(Y)$.
  #apostille[$card(X) lt card(Y) \ card(X) gt card(Y)$]
]

#definition(name: "Composition")[
  Let $X$, $Y$, and $Z$ be sets.
  Given two compatible
  #marginalis[
    We say functions are _compatible_ when the codomain of one is equal to the domain of the other.
  ]
  functions $f: X to Y$ and $g: Y to Z$,
  we define the #define[composition] $g compose f: X to Z$ by $(g compose f)(x) = g(f(x))$ for all $x in X$.
]

#pagebreak()

#definition(name: sym.circle.dotted + "-morphisms")[
  Recall that there is a special function $id_S: S to S$ defined on any set $S$ by the mapping $id_S(s) := s$ for all $s in S$.
  Keep this in mind; let $X$ and $Y$ be sets, and consider $f: X to Y$.

  We call $f$ a #define[monomorphism] when, for any set $Z$ and any pair of functions $g_1: X to Z$ and $g_2: X to Z$, we have $f compose g_1 = f compose g_2 implies g_1 = g_2$.
  In this case, we may denote $f: X monic Y$.
  #apostille[$monic$]
  #marginalis[
    We say that $f$ is _left-invertible_ when there exists $g: Y to X$ such that $g compose f = id_X$.
    Left-invertible functions are necessarily monomorphisms.
  ]

  We call $f$ an #define[epimorphism] when, for any set $Z$ and any pair of functions $g_1: Y to Z$ and $g_2: Y to Z$, we have $g_1 compose f = g_2 compose f implies g_1 = g_2$.
  In this case, we may denote $f: X epic Y$.
  #apostille[$epic$]
  #marginalis[
    We say that $f$ is _right-invertible_ if there exists $g: Y to X$ such that $f compose g = id_Y$.
    Right-invertible functions are necessarily epimorphisms.
  ]

  We say that $f$ is an #define[isomorphism] when it has a two-sided inverse;
  this means there exists a single function $g: Y to X$ such that $g compose f = id_X$ and $f compose g = id_Y$.
  In this case, the function $g$ is _unique_ for $f$, and we refer to it as _the inverse_ of $f$, denoting it by $f^(-1)$.
]

We now have a very important axiom, which is---as it turns out---equivalent to the infamous _"axiom of choice"_ (assuming the other axioms of Zermelo-Fraenkel set theory).

#axiom(name: "Trichotomy of Cardinality", number: 7)[
  For any sets $A$ and $B$, we have $card(A) lt card(B)$ and $card(A) gt card(B)$ or $card(A) = card(B)$.
]

As a result of this axiom, we have several important theorems (though not all of the following theorems necessarily rely on this axiom).

#theorem(name: "Cantor-Schroder-Bernstein")[
  $forall X forall Y ((card(X) lt.eq card(Y) and card(Y) lt.eq card(X)) implies card(X) = card(Y))$.
]

#theorem[
  Every injection has a surjective left-inverse (and is therefore a monomorphism).
]

#corollary[
  $forall X forall Y (card(X) lt.eq card(Y) implies card(Y) gt.eq card(X))$.
]

#theorem[
  Every surjection has an injective right-inverse (and is therefore an epimorphism).
]

#corollary[
  $forall X forall Y (card(X) gt.eq card(Y) implies card(Y) lt.eq card(X))$.
]

#theorem[
  Every bijection has a unique two-sided inverse (and is therefore an isomorphism).
]

#corollary[
  $forall X forall Y (card(X) = card(Y) implies card(Y) = card(X))$.
]

#theorem[
  $forall X forall Y (X subset Y implies card(X) lt.eq card(Y))$.
]

#corollary[
  $forall X (card(X) = card(X))$.
]

#theorem(name: "Pigeonhole Principle")[
  Given arbitrary sets $A$ and $B$, the following hold.
  - If $card(A) gt card(B)$, then there are no injective functions from $A$ to $B$.
  - If $card(A) lt card(B)$, then there are no surjective functions from $A$ to $B$.
  Finally, if $A$ and $B$ are both finite with cardinalities $n := card(A)$ and $k := card(B)$, then, for any function $f: A to B$, there exists $b in B$ such that $card({a in A st f(a) = b}) gt.eq ceil(n/k) = floor((n - 1)/k) + 1$.
]

== Finite Combinatorics

#definition(name: "Finity")[
  We say that a set $F$ is #define[finite] #emph[iff] there exists $n in NN$ such that $card(F) = card(n)$.
  In such a situation, we define the #define[cardinality of $F$] to be the natural number $n$ that $F$ is in bijection with: $card(F) := n$.
  #apostille[$card(F)$]
]

#lemma[
  Every natural number is a finite set.
  Further, $card({z in NN st 1 lt.eq z lt.eq n}) = card(n)$ for all $n in NN$.
]

#lemma[
  For any finite set $A$ and any set $B$, if $B subset A$, then $B$ is finite.
]

#lemma[
  For any finite sets $A$ and $B$, we have $card(A times B) = card(A) dot card(B)$.
]

#theorem[
  If $A$ and $B$ are finite sets, then $card(A union B) = card(A) + card(B) - card(A inter B)$.
]

#theorem(name: "Inclusion-Exclusion")[
  Let $n in NN_+$ and consider a set $cal(A) = {A_i st i in NN and 1 lt.eq i lt.eq n}$ consisting only of _finite_ sets (i.e., $A_i$ is finite for each $i in {j in NN st 1 lt.eq j lt.eq n}$).
  Then, the following inequality holds.
  $
    card(unions cal(A))
      = card(union.big_(i = 1)^(n) A_i)
      = sum_(k = 1)^(n) (-1)^(k + 1) #h(- 1.0em) sum_(1 lt.eq i_1 lt ... lt i_k lt.eq n) card(A_(i_1) inter ... inter A_(i_k))
      lt.eq sum_(i = 1)^(n) card(A_i)
  $
]

#theorem[
  For any finite $X$, we have $card(PP(X)) = 2^(card(X))$.
  This implies finite sets have finite power sets.
]

#definition(name: "Binomial Coefficients")[
  For any natural numbers $n, k in NN$, we define $binom(n, k)$ to be the number of subsets of cardinality $k$ taken from a set of cardinality $n$.
  Formally, we define this in the following way.
  $
    binom(n, k) := card({A st A subset n and card(A) = k})
  $
  However, this definition is not sensitive to the _identity_ of the set the subsets are taken from; all that matters is that ambient set's _size._
  Therefore, for any finite set $X$ such that $card(X) = n$, we have the following.
  $
    binom(n, k) = card({A st A subset X and card(A) = k})
  $
]

#lemma[
  The binomial coefficients satisfy the following recurrence.
  For all $n, k in NN$,
  we have $binom(n, 0) = 1 = binom(n, n)$, and $binom(n, 1) = n$, and $binom(n + 1, k + 1) = binom(n, k + 1) + binom(n, k)$.
]

#lemma[
  For all $n, k in NN$ such that $k lt.eq n$, we have $binom(n, k) = binom(n, n - k)$.
]

#theorem(name: "Binomial Theorem")[
  For any real numbers $x, y in RR$ and any natural number $n$, we have the following.
  $
    (x + y)^n = sum_(k = 0)^(n) binom(n, k) x^(k) y^(n - k)
  $
]

== Infinite Combinatorics

#definition(name: "Infinity")[
  We say that a set $I$ is #define[infinite] when $I$ is not finite, meaning $(forall n in NN)(card(I) eq.not card(n))$.
]

#theorem[
  $NN$ is infinite.
]

#theorem[
  $card(NN) = card(NN_+) = card(ZZ) = card(QQ) = card(NN times NN)$.
]

#theorem[
  Let $X$ be an infinite set and let $Y$ be a set.
  Then, the following hold.
  - $card(X union Y) = max(card(X), card(Y))$.
  - $card(X times Y) = max(card(X), card(Y))$.
  - If $2 lt.eq card(Y) lt.eq card(X)$, then $card({f st f: X to Y}) = card({f st f: X to {0, 1}}) = card(PP(X))$
]

#definition(name: "Countability")[
  We say a set $A$ is #define[countable] when $card(A) lt.eq card(NN)$; otherwise, we say $A$ is #define[uncountable].
  If a countable set $A$ is also infinite, we call it #define[countably infinite] and denote its cardinality by the special symbol $aleph_0 := card(A)$.
]

#lemma[
  Every subset of $NN$ is countable.
]

#corollary[
  Every finite set is countable.
]

#theorem[
  If $A$ is a countably infinite set, then $card(A) = card(NN)$.
]

#theorem(name: "Countable Unions of Countable Sets are Countable")[
  Consider a countable collection $cal(A) := {A_i st i in NN}$ such that $card(A_i) lt.eq card(NN)$ for each $i in NN$.
  Then, $card(unions cal(A)) = card(union.big_(i in NN) A_i) lt.eq card(NN)$.
  // This means a union of countably many countable sets is countable.
]

#definition(name: "Dedekind Infinity")[
  Given a set $X$, we say that $X$ is #define[Dedekind finite]
  #emph[iff] $forall W ((W subset X and W eq.not X) implies card(W) lt card(X))$.
  Alternatively, we say $X$ is #define[Dedekind infinite] #emph[iff] $exists W (W subset X and W eq.not X and card(W) = card(X))$.
]

#theorem[
  Being finite is equivalent to being Dedekind finite, and being infinite is equivalent to being Dedekind infinite.
]

#corollary[
  The set of natural numbers is the _smallest infinite set._
  Formally, $card(NN) lt.eq card(I)$ for any infinite $I$.
]

#theorem(name: "Cantor's Theorem")[
  For any set $X$, we have $card(X) lt card(PP(X))$.
]
