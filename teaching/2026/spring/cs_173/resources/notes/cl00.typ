// #import "@local/assignment:0.0.1": *
#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 0",
  numbering: false,
  date: datetime(year: 2026, month: 02, day: 02),
)

= Terminology in the First-Order Logic

The vocabulary surrounding the first-order logic can sometimes be confusing; we attempt to clarify some of this vocabulary here.

We have talked about #define[propositions] in one of two ways.
Intuitively, a proposition is a declarative statement#marginalis[
  _i.e.,_ an assertion, a claim
] that is either _true_ or _false_ but not both at the same time.
This informs our _semantics_ for the propositional logic.
To begin defining the _syntax_ of the propositional logic, we formally---recursively---define a string of symbols $lambda$ to be a proposition precisely when any of the following conditions hold.

1. $lambda = top$
2. $lambda = bot$
3. $lambda = not (phi)$ for some proposition $phi$
4. $lambda = (phi) and (psi)$ for some propositions $phi$ and $psi$
5. $lambda = (phi) or (psi)$ for some propositions $phi$ and $psi$
6. $lambda = (phi) arrow (psi)$ for some propositions $phi$ and $psi$
7. $lambda = (phi) arrow.l.r (psi)$ for some propositions $phi$ and $psi$

In the zeroth-order logic, we were mainly concerned with expressing and analyzing properties of _"propositions"_ because they are the _carriers of truth values._
This will not change: in the first-order logic, we are still interested in expressing sentences that have _one and only one consistent truth value._
However, the zeroth-order logic doesn't have the ability to talk _about objects;_ propositions don't have any "internal structure," so all you can know about a proposition is that it is either _true_ or _false_ but not both.
You can't actually see what any proposition _says_ in the zeroth-order logic.

We would like to augment the zeroth-order logic with a semantics and syntax that will allow us to _talk about objects._
This requires we set up a few (mostly informal) definitions.

In order to start talking about objects, we first establish what kind of objects we're interested in talking about.
This---the collection of all objects that are _"under discussion"_ for our purposes---is called a #define[universe of discourse]_._

A #define[term] is something that _refers to an object_ in our universe of discourse.
A term that refers to a _specific or particular object_ is called a #define[constant]_._
For example, $7$ is a constant symbol (if we have a universe of discourse like "the collection of all numbers").
If we define $x := 7$, then $x$ would also be a constant symbol.
We could also say something like the following.
$
  #sentence[Let $n$ be a natural number.]
$
This defines a symbol $n$ that refers to a "natural number."
The natural number that $n$ refers to is _arbitrary_ in the sense that, based on just that sentence above, $n$ could refer to _any_ of the numbers $0, 1, 2, 3, ...$
However, $n$ can only refer to _one_ of them... because $n$ is a _number_.
The symbol $n$ can't refer to two different numbers at the same time; otherwise, we would be in a situation where $n = 6$ and also $n = 7$, and we would then be able to prove $6 = 7$.
#contradiction
The point of this discussion is that this phrase introduced a _*constant symbol*,_ not a _variable._

A #define[variable] is a term that refers to a _generic object_ as opposed to any particular object.
In order to make sense of a variable, it _*must be quantified within some scope*,_ making it a #define[bound variable]_._
A variable that is not bound by a quantifier is called a #define[free variable]_._

Let's look at the following example.

$
  #say[Let $w := 7$.] \
  forall x ((phi(x) and psi(w, y)) arrow exists z (rho(x, z))).
$

The sentence above involves four terms: $w$, $x$, $y$, and $z$.
The term $w$ is a #text(fill: blue)[_constant_] since it refers to the object $7$.
The _scope_ of this definition---the region where we understand the symbol $w$ to be referring to the object $7$---begins at that "Let ..." sentence, and ends when we stop talking.#marginalis[
  For example, in the context of a proof, the scope would end at the end of the proof.
]

The other three terms are #text(fill: blue)[_variables_]_._
The variables $x$ and $z$ are both bound by quantifiers.

This sentence has the form $forall x (...)$.
The $forall$ symbol is immediately followed by $x$; this syntax denotes that $x$ is bound by $forall$, and the #define[scope of quantification] is indicated by the parentheses.#marginalis[
  The _scope_ of a variable bound by a quantifier is the syntactic region where the variable _has any meaning._
]
Within these parentheses, whenever we see the symbol $x$, it refers to some object from our universe of discourse.
The fact that $x$ was quantified universally by $forall$ means that the statement _inside the parentheses_ is being asserted _for every object_ in our universe of discourse, and our variable $x$ gives us a way of talking about those objects so that we can describe them using predicates.

The variable $z$ is also bound by a quantifier---in this case, the existential $exists$ quantifier.
That part of the sentence says $exists z (rho(x, z))$.
The portion $rho(x, z)$ is the only part of this sentence where $z$ is quantified; that is the _scope_ of $z$.
Because this part of the sentence is contained within the parentheses that defined the scope of $x$, we know that the symbol $x$ here refers to the $x$ that was bound by the universal $forall$ quantifier.
It is _the same_ $x$ that appears in the $phi(x)$ portion of the sentence.
Those two $x$ must refer to the same object (since the same symbol is being used to refer to them); they are the _same term._

The symbol $y$ is _*not a constant*_ because we were never introduced to who $y$ refers to by, for example, a definition.
So, $y$ must be a variable; those are the only kinds of terms we have.
However, $y$ is _*not bound*_ by any quantifier.
That means $y$ is a _*free variable*_ in this sentence.

Sentences with _free variables *do not mean anything*!_
The only kinds of statements that express meaning---that carry _truth values_---are sentences with _*no free variables*._
