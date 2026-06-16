#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "mp",
  number: 1,
  version: 0,
  date: datetime(year: 2026, month: 04, day: 01),
  paper_color: "bleached"
)

#let option = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: none))
#let answer = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: color.off.black))

= Answer each of the following questions by marking True or False but not both.

1. $(forall n in NN)(phi(n)) arrow.r.l.double (forall k in NN)((forall ell in NN)((ell lt k) arrow.double phi(ell)) arrow.double phi(k))$ for any wff $phi$.

  #option _True_ \
  #option _False_

2. Every positive natural number has a prime divisor.

  #option _True_ \
  #option _False_

3. If $p$ is prime, then $(forall x in ZZ)(x divides p implies x in {1, p})$.

  #option _True_ \
  #option _False_

4. $(forall cal(Z) subset ZZ)(cal(Z) eq.not emptyset implies (exists z in cal(Z))(forall w in ZZ)(z lt.eq w))$.

  #option _True_ \
  #option _False_

5. $ZZ = {z in ZZ st (exists x, y in ZZ)(z = 76025 dot x + 76 dot y)}$.

  #option _True_ \
  #option _False_

6. $x dot y = gcd(x, y) dot lcm(x, y)$ for all $x, y in NN$.

  #option _True_ \
  #option _False_

7. $(forall x, y in NN_+)(x divides y iff abs(x) lt.eq abs(y))$.

  #option _True_ \
  #option _False_

8. No integer has a multiplicative inverse.

  #option _True_ \
  #option _False_

9. For all $x, y, z in NN$, if $x$ and $y$ are coprime and $x divides y dot z$, then $x divides z$.

  #option _True_ \
  #option _False_

10. If $n in NN$ and $n > 0$, then $unions n$ is the predecessor of $n$.

  #option _True_ \
  #option _False_

#pagebreak()

// = Carefully prove the following statement under the given constraints.

= You may assume that addition and multiplication are commutative and associative on $NN$, that $0$ is the additive identity, that $1$ is the multiplicative identity, and that $suc(x) = x + 1$ for all $x in NN$. You may not assume anything discussed after these properties were mentioned.

Arguing directly from the recursive definitions of addition, multiplication, and exponentiation on $NN$,
prove that $(forall x, n, m in NN)(x^n x^m = x^(n + m))$.

#pagebreak()

// = You may rely on axioms 0 through 6 of set theory and any theorem we have proven in lecture and in problem sets. Logical axioms, rules, and theorems need not be cited.
// = The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *need not* be cited. You may assume axioms 0 through 6 of set theory, and you may rely on any theorems proven in lectures, notes, and problem sets.
// = You may assume all discussed arithmetic and algebraic properties of $NN$ and $ZZ$.
= You may assume all theorems up to and including the Fundamental Theorem of Arithmetic, Euclid's Division Lemma, B#(diacritic.acute.single)("e")zout's Identity, and Euclid's Lemma.

Prove that $n$ and $n + 1$ are coprime for all $n in NN$.

#pagebreak()

= You may assume all theorems up to and including the Fundamental Theorem of Arithmetic, Euclid's Division Lemma, B#(diacritic.acute.single)("e")zout's Identity, and Euclid's Lemma.

Use induction to prove that $(forall n in NN)(5 divides 8^n - 3^n)$.
