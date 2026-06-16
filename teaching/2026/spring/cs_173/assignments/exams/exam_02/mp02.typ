#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "mp",
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
  #option _False_

2. $forall x forall y forall z ((x without {z} = y without {z}) implies (x = y))$.

  #option _True_ \
  #option _False_

3. For any set $X$, the mapping ${(x, {x}) st x in X}$ is a function from $X$ to $PP(X)$.

  #option _True_ \
  #option _False_

// 4. If $f: NN to NN$ and $g: NN to NN$ are injective, then ${(x, (f(x), g(x))) st x in NN}$ is injective.
// 4. If $f$ is a function, then $card(f) = card(dom(f))$.
4. If $X$ and $Y$ are sets and $lambda: X to Y$, then $card(lambda) = card(X)$.

  #option _True_ \
  #option _False_

5. $forall x exists y (card(x) gt card(y))$.

  #option _True_ \
  #option _False_

6. If $A$ and $B$ are sets such that $A subset B$ and $A eq.not emptyset$, then $card(B without A) lt card(B)$.

  #option _True_ \
  #option _False_

7. It is possible to construct a graph $G$ such that $(forall v in V(G))(deg(G, v) = 1)$.

  #option _True_ \
  #option _False_

// 8. It is possible to construct a graph $G$ such that $#box(baseline: 0.4325em)[$display(sum_(v in V(G)))$] deg(G, v) = 13$.
8. It is possible to construct a graph $G$ with $n$ nodes and $2^n$ edges for every $n in NN$.

  #option _True_ \
  #option _False_

9. The set of all finite binary strings is uncountably infinite.

  #option _True_ \
  #option _False_

10. If $X$ and $Y$ satisfy $card(X) = card(Y)$ and $f: X to Y$ is an injection, then $f$ is also a surjection.

  #option _True_ \
  #option _False_

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

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Consider the function $f: NN times NN to NN$ given by $f(x, y) := 3^x 5^y$ for $(x, y) in NN times NN$. \
Prove that $f$ is injective.

// For every positive natural number $n in NN_+$ and every $cal(N) subset NN$ such that $card(cal(N)) = n + 1$,
// prove that there exist two distinct elements $a, b in cal(N)$ such that $n divides a - b$.
// // prove that there exist two distinct elements $a, b in cal(N)$ such that $a equiv b space (mod n)$.

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Prove that there are an even number of odd-degree nodes in any graph.
