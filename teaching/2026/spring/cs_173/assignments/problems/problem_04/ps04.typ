#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 4,
  date: datetime(year: 2026, month: 02, day: 24),
)

// #show math.subset: $subset.eq$
// #show math.and: $space and space$
// #show math.or:  $space or space$
// #let implies = $space arrow.double space$
// #let iff = $space arrow.double.l.r space$

You may rely on Axioms
// 0,
// #marginalis[
//   Recall that we still do not formally understand the _axiom of infinity_ yet, and we should therefore not rely on it within our proofs.
// ]
1, 2, 3, 4, 5, and 6
#marginalis[
  ...and any theorems we have proven from these axioms so far...
]
for this problem set.
Since we do not _formally_ understand Axiom 0---the _axiom of infinity_---yet, we should not rely on the set $NN$ or the concept of a _natural number._
The first set whose existence we formally recognize is $emptyset$.

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._

// The axioms, rules of inference, theorems, and other results of the zeroth-order and first-order logic can be used _*without explicitly citing them*_ from this problem set onwards.

// For any sets $A$ and $B$, we make the following definitions:

// - The #define[relative complement of $B$ within $A$] is given by $#text(fill: blue, $A without B$) := {x st x in A and x in.not B}$. \
// - The #define[Cartesian product of $A$ and $B$] is given by $#text(fill: blue, $A times B$) := {(x, y) st x in A and y in B}$. \
// - The #define[power set of $A$] is given by $#text(fill: blue, $PP(A)$) := {(x, y) st x in A and y in B}$. \

// - We say that #text(fill: blue)[$A subset B$]$space :arrow.double.l.r space forall x (x in A implies x in B)$.
// - The #define[intersection over $A$] is given by $#text(fill: blue, $inter A$) := {x st forall y (y in A implies x in y)}$. \
// - The #define[intersection of $A$ with $B$] is given by $#text(fill: blue, $A inter B$) := {x st x in A and x in B}$. \
// - The #define[ordered pair $(A, B)$] is given by $#text(fill: blue, $(A, B)$) := {{A}, {A, B}}$.

1. For any set $x$, the #define[power set of a set $x$] is given by $PP(x) := {y st y subset x}$.

  // + Prove $forall x forall y (x eq.not y implies PP(x) eq.not PP(y))$.

  + Prove $forall x forall y (PP(x) union PP(y) subset PP(x union y))$.

  + Prove $exists x exists y (PP(x) union PP(y) eq.not PP(x union y))$.

  + Prove $forall x forall y (x inter y = y implies y in PP(x))$.

  + Prove $forall x forall y (y in PP(x) implies x inter y = y)$.

2. For any sets $x$ and $y$,
  the #define[relative complement of $y$ in $x$]
  is $x without y := {z st z in x and z in.not y}$.
  #marginalis[
    This is also called the _difference_ between $x$ and $y$,
    and it is sometimes read as either _"$x$ minus $y$"_ or _"$x$ without $y$."_
    // This is also sometimes called the _set difference,_ and you may encounter it in other resources with the notation $x - y$.
  ]
  We also define the #define[symmetric difference of $x$ and $y$]
  by $x symdif y := ( x without y ) union ( y without x )$.
  // We define the #define[symmetric difference of $x$ and $y$] by $x symdif y := {z st (z in A and z in.not B) or (z in B and z in.not A)}$.

  + Prove that $forall x ( ( ( x union {x} ) without {x} ) = x )$.

  + Prove that $x symdif y = ( x union y ) without ( x inter y )$ for all sets $x$ and $y$.

// 3. In this problem,

//   + Prove that $forall x forall y ( x = union inter (x, y) )$.

//   + Prove that $forall x forall y ( y = ( union (x, y) ) without (inter (x, y)) )$

3. Recall that the _axiom of regularity_
  asserts $forall x ( x eq.not emptyset implies exists y ( y in x and x inter y = emptyset ) )$.

  + Show that $forall x (x eq.not x union {x})$.

  + Show that $forall x forall y ( x eq.not y implies x union {x} eq.not y union {y} )$.

4. We define #define[Cartesian product of two sets $X$ and $Y$] by $X times Y := {(x, y) st x in X and y in Y}$.
  Show that the Cartesian product of any two sets exists.
  // + Prove that the Cartesian product of any two sets exists.

//   // + Is it necessary that $(a union b) times (c union d) = (a times c) union (b times d)$ if $a$, $b$, $c$, and $d$ are sets?

//   // + What is $union emptyset$?

//   // + What is $inter emptyset$?


//   // + Let $V := {z st z = z}$.
//   //   Prove that $V$ does not exist.

