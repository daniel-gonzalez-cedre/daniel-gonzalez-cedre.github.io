#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 2",
  number: 2,
  date: datetime(year: 2026, month: 02, day: 09),
)

#show math.and: $space and space$
#show math.or: $space or space$

= An Introduction to the Theory of Sets

Intuitively, the word _"set"_ is meant to describe a _"collection of things."_
The way that we will _formally_ describe what sets are and what properties they have is by introducing the _axioms of set theory._
Before we get to the point where we can write and understand the axioms, we need to establish a couple of things.

In formal contexts, we will primarily speak using the _first-order logic._
A #define[first-order theory]#marginalis[
  ... like _ZFC set theory..._
]
is a formal language built upon the first-order logic by establishing a _universe of discourse,_ introducing _predicate symbols,_#marginalis[... and their properties...]#marginalis[
  In other contexts, it may also be important to introduce _functional symbols_ and _constant symbols._
]
and then writing down _axioms_#marginalis[
  ... which are first-order sentences written in terms of the predicate (and possibly other) symbols...
]
that describe the basic truths.#marginalis[
  In the same way that _predicate symbols_ transform terms into truth values, #define[functional symbols] transform terms into other terms.
  #define[Constant symbols] are just constant terms that are considered important enough to specify up-front for the whole theory.
]
Since we are no longer doing logic _per se,_ and thanks to the many theorems we proved about the first-order logic, we will now switch away from using the $equiv$ and $tack$ symbols, which are not typically used by mathematicians.
When referring to _logical equivalences_ and _biconditionals,_ we will now consolidate the $equiv$ and $arrow.l.r$ symbols into the $arrow.double.l.r$ symbol.#apostille[$arrow.double.l.r$]
Similarly, when referring to _entailments_ or _conditionals,_ we replace the $tack$ and $arrow$ symbols by the $arrow.double$ symbol.#apostille[$arrow.double$]

There are two special _meta-symbols_ that we will use for introducing new _definitions._
When we want to define a new kind of object, we use the $:=$ symbol;#apostille[$:=$]
this can be used in one of two ways.
If, in the context of something like a proof or an article, we want to give the label $x$ to the number $5$, we would use the syntax $x := 5$.
This is usually understood to be a temporary label that only exists for the context of "the discussion," whatever it may be; that way, we could reuse the symbol for a different definition like $x := 6$ in a _different_ proof or article.
However, within a context (_e.g.,_ a proof), once a symbol has been defined to mean something, you _can not modify what it means._
If you define $x := 5$ at the top of your proof, you can't then change your mind within the same proof and _"update"_ $x$ to be $5 + 1$.
This is one important way in which mathematics has different _semantics_ to programming.#marginalis[
  ... unless you're working with a pure (usually functional) programming language (_e.g.,_ Agda, Haskell, Idris, Lean) in which state is _immutable..._
]
The other way this can be used is to define a _general operation._
For example, we will soon define what the _union of two sets is:_ given two sets $A$ and $B$, we define their union to be $A union B := {x st x in A or x in B}$.#marginalis[
  We don't understand what this means yet; that's okay.
  This was just meant to showcase how we use $:=$ to define a new operation that takes objects as inputs and produces objects as outputs.
] \

When we want to introduce a new _predicate,_ we use the $deff$ symbol.#apostille[$:arrow.double.l.r$]
We will see examples of this below when we introduce the basic predicate symbols of set theory.

== Equality
Our first fundamental predicate is called #define[equality]_,_ denoted by the $=$ symbol.
Given two terms $x$ and $y$, the syntax for using this predicate looks like either $x = y$ or $x eq.not y$.

$
  x = y &deff #say[$x$ and $y$ refer to the same object] \
  x eq.not y &deff not (x = y)
$

This predicate has three important properties that, despite probably being _"obvious"_ to those with prior experience using this symbol, we will formalize explicitly below.

1. $forall x (x = x)$.                                             #h(1.0fr) _Reflexivity_
2. $forall x forall y (x = y implies y = x)$.                      #h(1.0fr) _Symmetry_
3. $forall x forall y forall z ((x = y and y = z) implies x = z)$. #h(1.0fr) _Transitivity_

The significance of these properties is that, whenever we have two terms $x$ and $y$ such that $x = y$, we can _replace_ any occurrence of $x$ with $y$ (and _vice versa_).

== Elementhood
Since _"sets"_ are meant to be _"collections of things,"_ our second fundamental predicate helps us describe when one object is _"inside of"_ another one.
This predicate is usually called #define[elementhood]_,_ denoted by the $in$ symbol.
Given two terms $x$ and $y$, the syntax for using this predicate looks like either $x in y$ or $x in.not y$.#marginale(dy: 2.0em)[
  ... in other words, $x$ is _"contained physically inside of"_ $y$...
]

$
  x in y     &deff #say[$x$ is an element of $y$] \
  x in.not y &deff not (x in y)
$

This predicate doesn't have any stand-alone properties like equality does.
Instead, we will understand how $in$ works based on how it interacts with the $=$ symbol.
We will encode this understanding formally by introducing some new _notation_ and some _axioms for set theory._

== Notation
Given finitely many terms $x_0$, $x_1$, ..., $x_(n - 1)$, we introduce the notation ${x_0, x_1, ..., x_n}$ to denote the set containing exactly those elements $x_0$, $x_1$, ..., $x_(n - 1)$.
This is sometimes called #define[set roster notation] or #define[set builder notation].#marginalis[
  ... though in most other contexts, _"set builder notation"_ is actually synonymous with _"set comprehension notation"_ as we later describe it...
]
We define below what this notation formally means by explaining what it means for an arbitrary term $x$ to be an _element_ of the set described by the ${x_0, x_1, ..., x_(n - 1)}$ notation.

$
  x in {x_0, x_1, ..., x_(n - 1)} deff (x = x_0) or (x = x_1) or dots.c or (x = x_(n - 1))
$

For example, consider three objects $a$, $b$, and $c$.
Then, for any $x$, we say $x in {a, b, c}$ is equivalent to saying $x = a$ or $x = b$ or $x = c$.
The biggest restriction of this notation is that _there can only be finitely many elements,_ and they must _all be written out explicitly_ between the brackets.
Trying to describe a set by writing an expression that looks like ${0, 1, 2, ..., 127}$ is an _*abuse of notation*_ and is fundamentally _informal._

The above notation is clearly cumbersome when dealing with a set containing a _"large"_ amount of elements and can not be used at all when describing _"infinite"_ sets.

== The Axiom of "Infinity" (Informal)
The only existentially quantified axiom we will introduce, which we call the _Axiom of Infinity,_ is unfortunately an axiom that we are not yet ready to fully understand or appreciate.
We will instead introduce this axiom _informally_ for now; when we are ready, after studying the rest of the relevant axioms of set theory, we will come back to this.

// #counter("axiom").update(0)
#axiom(number: 0, name: "Infinity (Informal)")[
  The "set of all natural numbers" exists.
]

We use the symbol $NN$ to refer to this "set of all natural numbers," and _informally speaking_ it looks like ${0, 1, 2, ...}$.
We will revisit this in more detail later.

== The Axiom of Extensionality
Our first significant axiom begins formalizing what the elementhood predicate $in$ _means_ in terms of equality $=$ by asserting that _sets are equal when they have the same elements._

#axiom(name: "Extensionality")[
  $forall x forall y (x = y iff forall z (z in x iff z in y))$.
]

In English, this says that, given two sets $x$ and $y$, we determine $x = y$ if and only if every element of $x$ is also an element of $y$ and _vice versa._
For example, the sets ${0, 0, 1, 2}$ and ${2, 1, 0}$ are equal because they each contain _all_ and _only_ the elements $0$, $1$, and $2$.

Given two sets $x$ and $y$, we define $x$ to be a #define[subset] of $y$ when every element of $x$ is also an element of $y$.
Formally, we say $x subset.eq y deff forall z (z in x implies z in y)$.#apostille[$subset.eq$]
You might now be able to notice that this definition is closely related to the Axiom of Extensionality.

#theorem[
  $forall x forall y (x = y iff (x subset.eq y and y subset.eq x))$.
]
#proof[
  Let $x$ and $y$ be sets.#marginale[
    We will demonstrate that $x = y iff (x subset.eq y and y subset.eq x)$ by showing the _forward_ and _backward_ directions separately.
  ]
  // First, we will show $x = y implies (x subset.eq y and y subset.eq x)$.
  Suppose $x = y$ and let $z$ be an arbitrary set.
  Then, by the _axiom of extensionality,_ we know $z in x iff z in y$.
  This means $z in x implies z in y$, and also $z in y implies z in x$.
  Clearly, since $z$ was arbitrary, we can then say $forall w (w in x implies w in y)$ and $forall w (w in y implies w in x)$.
  Therefore, $x subset.eq y$ and $y subset.eq x$ by definition.

  Now, in the other direction, suppose $x subset.eq y$ and $y subset.eq x$ and let $z$ be an arbitrary set.
  By definition, we know $forall w (w in x implies w in y)$, so that $z in x implies z in y$.
  Similarly, we know $forall w (w in y implies w in x)$ by definition, so that $z in y implies z in x$.
  Thus, $z in x iff z in y$.
  Since $z$ was arbitrary, we can then say $forall w (w in x iff w in y)$, from which we conclude $x = y$ by the _axiom of extensionality._

  Therefore, $x = y iff (x subset.eq y and y subset.eq x)$.
]

== The Axiom of Pairing
Our next axiom encodes something that should feel very intuitive based on the idea that sets are _"collections of things."_
If we take two things that we know exist (because they're objects in our universe of discourse), we should be able to put those two things together in a collection by themselves, and that collection should exist.
In other words, we should be allowed to construct _unordered pairs_ of things.

#axiom(name: "Pairing")[
  $forall x forall y exists z (z = {x, y})$.
]

// #text(fill: red)[_mention notation like $forall x, y (...)$ and $(forall x in y)(...)$_]
