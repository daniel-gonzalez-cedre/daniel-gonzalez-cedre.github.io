#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 3,
  date: datetime(year: 2026, month: 02, day: 15),
)

// #show math.subset: $subset.eq$
// #show math.and: $space and space$
// #show math.or:  $space or space$
// #let implies = $space arrow.double space$
// #let iff = $space arrow.double.l.r space$

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to previous problems may be used as theorems to solve later problems.

The axioms, rules of inference, theorems, and other results of the zeroth-order and first-order logic can be used _*without explicitly citing them*_ from this problem set onwards.

You should only need to rely on Axioms 0, 1, and 2 for this problem set.#marginalis[
  From now on, when we refer to "Axioms" in the context of mathematics, we are referring to the axioms of Zermelo-Fraenkel set theory as we've presented them unless otherwise stated.
]

For any sets $A$ and $B$, we make the following definitions:

- We say that #define[$X subset Y$]$space :arrow.double.l.r space forall z (z in X implies z in Y)$.
- The #define[union over $X$] is given by $unions X := {y st exists x (x in X and y in x)}$. \
- The #define[union of $X$ with $Y$] is given by $X union Y := {z st z in X or z in Y}$. \
- The #define[intersection over $X$] is given by $inters X := {y st forall x (x in X implies y in x)}$. \
- The #define[intersection of $X$ with $Y$] is given by $X inter Y := {z st z in X and z in Y}$. \
- The #define[ordered pair $(x, y)$] is given by $(x, y) := {{x}, {x, y}}$.

1. 

  + Prove $forall x forall y forall z ( ( x subset y and y subset z ) implies x subset z )$.

  + Prove $forall x forall y ( x inter y subset x )$.

  + Prove $forall x forall y ( x subset x union y )$.

  + Prove $forall x forall y ( x inter y subset x union y )$.

2. 

  + Prove $forall x forall y exists p ( p = (x, y) )$.

  // + Prove $forall x forall y ( (x, y) eq.not emptyset )$.

  + Prove $forall a forall b forall x forall y ( (a, b) = (x, y) iff (a = x and b = y) )$.

  // + Prove that $union inter (x, y) = x$ for all $x$ and $y$.

  // + Prove that $union union (x, y) = y$ for all $x$ and $y$.

3. 

  + Prove that $forall x ( x union {x} eq.not emptyset )$.

  + Prove that $forall x forall y (x eq.not y implies x union {x} eq.not y union {y})$.
