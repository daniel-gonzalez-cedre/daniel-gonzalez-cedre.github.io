#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 6,
  date: datetime(year: 2026, month: 04, day: 01),
)

#let lemma = lemma.with(numbering: false)
#let theorem = theorem.with(numbering: false)

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._

Explicitly: you may assume all of the theorems discussed in lecture up until (and including) the #nth(23) of March, as well as all content up until (and including) _clavicula 08._

#v(1.0em)

1. Prove $(forall a, b, x, y, n in ZZ)((n divides x and n divides y) implies (n divides a x + b y))$.

2. We say an integer $z in ZZ$ is #define[even] $deff 2 divides z$,
  and we say $z$ is #define[odd] $deff 2 divides z - 1$.

  + Prove that no integer can be both even and odd at the same time.

  + Prove that $(forall z in ZZ)((even(z)) iff (odd(z + 1)))$.

  + Prove that $(even(n)) or (odd(n))$ for all $n in NN$.
    #marginalis(dy: - 5.0em)[
      Once you have proven this result,
      we can easily see that $even(z) iff -z$ is even for all $z in ZZ$,
      and thus we will know every integer is either even or odd but not both.
    ]

3. Show that $(exists m in NN)(forall n in NN)(n gt.eq m implies n^2 lt 2^n)$.
// 3. Let $d in NN$ such that $d gt.eq 2$.
//   Show that $(exists m in NN)(forall n in NN)(n gt.eq m implies n^d lt 2^n)$.
//   #marginalis[
//     _*Hint 1*:_ you do not need the _smallest_ or _"best"_ value of $m$;
//     you just need _some_ value of $m$ (in terms of $d$) that works.
//   ]
//   #marginalis[
//     _*Hint 2*:_ once you have found an appropriate value for $m$, try a proof by induction.
//   ]
//   #marginalis[
//     _*Hint 3*:_ do not be afraid to prove intermediate results.
//   ]
// 3. Prove that $n^3 lt 3^n$ for all $n in NN$ such that $n gt 3$.
// 3. Prove that $n^2 + n$ is even for all $n in NN$.

4. The #define[factorial] function $square.stroked.dotted !: NN to NN$ is the recursive function given below for all $n in NN$.
  $
    0!       & := 1 \
    (n + 1)! & := (n!) dot (n + 1) \
  $
  Prove that $(forall n in NN)(n gt.eq 4 implies 2^n lt n!)$.

5. The #define[Fibonacci sequence] is the function $cal(F): NN to NN$ defined below for all $n in NN$.
  $
    fib(0) & := 0 \
    fib(1) & := 1 \
    fib(n + 2) & := fib(n + 1) + fib(n) \
  $
  Prove that $display(sum_(i = 1)^(n)) fib(2 i - 1) = fib(2 n)$ for all $n in NN$.
