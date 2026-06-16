#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "ms",
  number: 2,
  version: 0,
  date: datetime(year: 2026, month: 05, day: 01),
  paper_color: "bleached"
)

#let option = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: none))
#let answer = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: color.off.black))

= Answer each of the following questions by marking True or False but not both.

1. If $X$ and $Y$ are finite and $f: X to Y$ is a surjection, then $f$ is injective.

  #option _True_ \
  #answer _False_

2. $forall x forall y forall z ((x without {z} = y without {z}) implies (x = y))$.

  #option _True_ \
  #answer _False_

3. For any set $X$, the mapping ${(x, {x}) st x in X}$ is a function from $X$ to $PP(X)$.

  #answer _True_ \
  #option _False_

// 4. If $f: NN to NN$ and $g: NN to NN$ are injective, then ${(x, (f(x), g(x))) st x in NN}$ is injective.
// 4. If $f$ is a function, then $card(f) = card(dom(f))$.
4. If $X$ and $Y$ are sets and $lambda: X to Y$, then $card(lambda) = card(X)$.

  #answer _True_ \
  #option _False_

5. $forall x exists y (card(x) gt card(y))$.

  #option _True_ \
  #answer _False_

6. If $A$ and $B$ are sets such that $A subset B$ and $A eq.not emptyset$, then $card(B without A) lt card(B)$.

  #option _True_ \
  #answer _False_

7. It is possible to construct a graph $G$ such that $(forall v in V(G))(deg(G, v) = 1)$.

  #answer _True_ \
  #option _False_

// 8. It is possible to construct a graph $G$ such that $#box(baseline: 0.4325em)[$display(sum_(v in V(G)))$] deg(G, v) = 13$.
8. It is possible to construct a graph $G$ with $n$ nodes and $2^n$ edges for every $n in NN$.

  #option _True_ \
  #answer _False_

9. The set of all finite binary strings is uncountably infinite.

  #option _True_ \
  #answer _False_

10. If $X$ and $Y$ satisfy $card(X) = card(Y)$ and $f: X to Y$ is an injection, then $f$ is also a surjection.

  #option _True_ \
  #answer _False_

#pagebreak()

// = Carefully prove the following statement under the given constraints.

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Consider the recursively defined function $f: {2^x st x in NN} to NN$ described below.
$
  // f(0) & := 1 \
  // f(n) & := 2 dot f(frac(n, 2, style: "skewed")) + n quad #say[for] n in NN_+ \
  f(n) := cases(
    space 1            & quad #say[if] n = 1,
    space 2 dot f(n / 2) + n & quad #say[if] n > 1,
  )
$
Prove that $f(n) = n dot log_2(n) + n$ for all $n in {2^x st x in NN}$.

#proof[
  We will prove $(forall n in NN)(f(2^n) = 2^n log_2(2^n) + 2^n)$ by weak induction.
  #case-basis[
    Observe that $f(2^0) = f(1) = 1 = 1 dot 0 + 1 = 2^0 dot log_2(2^0) + 2^0$.
  ]
  #case-inductive[
    Let $k in NN$ and assume $f(2^k) = 2^k dot log_2(2^k) + 2^k$.
    We now observe the following.
    $
      f(2^(k + 1))
        & = 2 dot f(2^(k + 1)/2) + 2^(k + 1)   && quad #say[by the definition of] f \
        & = 2 dot f((2 dot 2^k)/2) + 2^(k + 1) \
        & = 2 dot f(2^k) + 2^(k + 1) \
        & = 2 dot (2^k dot log_2(2^k) + 2^k) + 2^(k + 1) && quad #say[by the _inductive hypothesis_] \
        & = 2 dot 2^k dot log_2(2^k) + 2 dot 2^k + 2^(k + 1) \
        & = 2^(k + 1) dot log_2(2^k) + 2^(k + 1) + 2^(k + 1) \
        & = 2^(k + 1) (log_2(2^k) + 1) + 2^(k + 1) \
        & = 2^(k + 1) (log_2(2^k) + log_2(2^1)) + 2^(k + 1) \
        & = 2^(k + 1) dot log_2(2^k dot 2) + 2^(k + 1) \
        & = 2^(k + 1) dot log_2(2^(k + 1)) + 2^(k + 1) \
    $
    Therefore, $f(2^(k + 1)) = 2^(k + 1) dot log_2(2^(k + 1)) + 2^(k + 1)$ as desired.
  ]
  We therefore conclude that $f(2^n) = 2^n dot log_2(2^n) + 2^n$ for all $n in NN$.

  Now, for each $n in {2^x st x in NN}$, we know there exists $x in NN$ such that $n = 2^x$.
  We just proved that $f(2^x) = 2^x dot log_2(2^x) + 2^x$.
  That now means $f(n) = n dot log_2(n) + n$ as was initially required.
]

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Consider the function $f: NN times NN to NN$ given by $f(x, y) := 3^x 5^y$ for $(x, y) in NN times NN$. \
Prove that $f$ is injective.

#proof[
  Let $(a, b), (x, y) in NN times NN$ and suppose $f(a, b) = f(x, y)$, so $3^a 5^b = 3^x 5^y$.
  // Since multiplication is cancellative over $NN$, we can observe the following.
  // $
  //   3^a 5^b = 3^x 5^y implies 3^(x - a) 5^(y - b) = 1
  // $
  Towards a contradiction, suppose $(a, b) eq.not (x, y)$, so that $a eq.not x$ or $b eq.not y$.
  We take two cases.
  #case[
    Assume $a eq.not x$; without loss of generality, suppose $a lt x$.
    This implies $x - a gt 0$, so that $x - a - 1 gt.eq 0$ in particular.
    If we recall that multiplication on $NN$ is cancellative, we can observe the following.
    $
      3^a 5^b = 3^x 5^y implies 5^b = 3^(x - a) 5^y
                        implies 5^b = 3 (3^(x - a - 1) 5^y)
    $
    Since $x - a - 1 in NN$ and $y in NN$, we know $3^(x - a - 1) 5^y in ZZ$, so that $3 divides 5^b$.
    Because $3$ is prime, Euclid's lemma implies $3 divides 5$, contradicting the fact that $5$ is prime.
    #contradiction
  ]
  #case[
    Assume $b eq.not y$; without loss of generality, suppose $b lt y$.
    This implies $y - b gt 0$, so that $y - b - 1 gt.eq 0$ in particular.
    Again, recalling that multiplication is cancellative over $NN$, we can make the following observation.
    $
      3^a 5^b = 3^x 5^y implies 3^a = 3^x 5^(y - b)
                        implies 5^b = 5 (3^x 5^(y - b - 1))
    $
    Since $y - b - 1 in NN$ and $x in NN$, we know $3^x 5^(y - b - 1) in ZZ$, so that $5 divides 3^a$.
    Because $5$ is prime, Euclid's lemma tells us $5 divides 3$, implying $5 lt.eq 3$ and contradicting $3 lt 5$.
    #contradiction
  ]
]

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Prove that there are an even number of odd-degree nodes in any graph.

#proof[
  Let $G$ be a graph, and let us define the sets $epsilon := {v in V(G) st 2 divides deg(G, v)}$ and $omega := {v in V(G) st 2 divides.not deg(G, v)}$ to respectively represent the sets of even-degree and odd-degree vertices in $G$.
  Notice that $V(G) = epsilon union omega$, and also $epsilon inter omega = emptyset$.

  Since $V(G)$ is finite, we know $E(G)$ is finite, so that $epsilon$ and $omega$ are both finite sets.
  This implies there exist $n, m in NN$ such that $card(epsilon) = card(n)$ and $card(omega) = card(m)$,
  from which we know there exist two bijections $phi: n to epsilon$ and $psi: m to omega$ by definition.
  We will use these bijections as a helpful way of enumerating the elements of $epsilon$ and $omega$; specifically, we now know that $epsilon = {phi(i) st 0 lt.eq i lt n}$ and $omega = {psi(j) st 0 lt.eq j lt m}$.

  Further, since every element of $epsilon$ has even degree, we will define $k_i in ZZ$ to be the integer such that $deg(G, phi(i)) = 2 k_i$ for each $i in n$.
  Similarly, we will define $ell_j in ZZ$ to be the integer such that $deg(G, psi(j)) = 2 ell_j + 1$ for each of the vertices in $omega$, which we know have odd degree.
  We can now recall that $display(sum_(v in V(G)) deg(G, v)) = 2 dot card(E(G))$ and observe.
  $
    2 dot card(E(G)) = sum_(v in V(G)) deg(G, v)
      & = sum_(v in epsilon) deg(G, v) + sum_(v in omega) deg(G, v) \
      & = sum_(i = 0)^(n - 1) deg(G, phi(i)) + sum_(j = 0)^(m - 1) deg(G, psi(j)) \
      & = sum_(i = 0)^(n - 1) 2 k_i + sum_(j = 0)^(m - 1) 2 ell_j + 1 \
      & = sum_(i = 0)^(n - 1) 2 k_i + sum_(j = 0)^(m - 1) 2 ell_j + sum_(j = 0)^(m - 1) 1
  $
  This then implies the following.
  $
    2 (card(E(G)) - sum_(i = 0)^(n - 1) k_i - sum_(j = 0)^(m - 1) ell_j)
      = sum_(j = 0)^(m - 1) 1
      = m
      = card(omega)
  $
  Therefore, $2 divides card(omega)$, showing us that there are an even number of odd-degree nodes in $G$.
]
