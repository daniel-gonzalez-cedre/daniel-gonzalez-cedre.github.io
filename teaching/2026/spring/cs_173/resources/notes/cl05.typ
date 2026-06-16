#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 5",
  number: 5,
  date: datetime(year: 2026, month: 02, day: 18),
)

= Establishing a Foundation for Arithmetic

We recently showed that $inters emptyset$ does not exist by proving that, if it did, then we could reproduce Russell's paradox within our theory of sets.
The main problem with $inters emptyset$ is that this set is, in a sense, _too big to exist._
The predicate $forall y (y in emptyset implies z in y)$ that defines what it means for a set $z$ to be an element of $inters emptyset$ is _true_ for every set $z$.
As a result, if $inters emptyset$ were a set, we would be able to prove $forall x (x in inters emptyset)$.
#marginalis[
  Sets with this property are called #define[universal sets]_._
  A consequence of our axiomatization of set theory is that _universal sets do not exist._
]
Interestingly, this would imply that $inters emptyset in inters emptyset$, so it would mean there is a set that contains itself as an element.

Notice that this property is not in-and-of-itself problematic.
The existence of a set $x$ such that $x in x$ is not _inherently contradictory,_ and it does not pose the kind of existential problem that Russell's paradox does.
In fact, the axioms that we have studied so far do nothing to _prevent_ sets from containing themselves;
it would not be possible to _disprove_ the existence of a set $x$ with the property $x in x$ just based on our current axiomatization.

It is at this point then that we must ask: should we allow sets to contain themselves?
Does the concept of a _"collection of things"_ either _entail_ or _preclude_ self-elementhood?

// At this point, we have illuminated enough of the theory of sets to feel satisfied that our axioms adequately capture what we believe a _"set"_ is, and we should start to seriously consider what the point of developing this theory was.
// We will eventually want to talk about numbers, perform arithmetic, and talk about _"computing."_
// It turns out that this will be much harder to do if our set theory is not _"well-founded."_

// At this point, there is a lot that we can do with our theory of sets, but the set-theoretic universe is still nebulous enough that we should be careful not to accidentally fall into 
// In fact, if we were careful enough to avoid 

== The Axiom of Regularity

Most mathematicians, and certainly most reasonable people, would agree that a set that contains itself as an element would be a very strange object.
If we think of sets as _"containers"_ or _"boxes,"_ we certainly will never encounter a box in the real world that physically contains itself inside of itself.
With this intuition, we should reject the existence of sets like $x = {x}$, and like $a = {b}$ and $b = {a}$, and so on...
But it turns out that there are a lot of complicated ways in which sets than be arranged so that they _"eventually"_ contain themselves.
What we would like is a _*well-founded*_ set theory: one in which there are no infinitely long descending chains of $in$ elementhood.
// Our next axiom---which is worded strangely---guarantees that every chain of $in$ elementhood always ends with $emptyset$ the empty set

#axiom(number: 6, name: "Regularity")[
  $forall x (x eq.not emptyset implies exists y (y in x and x inter y = emptyset))$.
  #marginalis[
    This is also known as the _axiom of foundation._
  ]
]

That is precisely what the strangely worded axiom above guarantees.
Let's try to gain some insight into how this axiom works by proving the following theorem.
// To gain a bit of insight into _why_ this axiom prevents sets from containing themselves, we will now prove that there is no set $x$ with the property that $x in x$.

#theorem[
  $forall x (x in.not x)$.
]
#proof[
  Let $x$ be a set.
  Towards a contradiction, assume $x in x$.
  By the _axiom of pairing,_ we know the set $p := {x, x}$ exists, and $p = {x}$ by the _axiom of extensionality._
  // Consider $p := {x, x}$, which we know exists by the _axiom of pairing._
  // By the _axiom of extensionality,_ we know $w = {x}$.
  Observe that $x in {x}$ by definition, so that $p eq.not emptyset$ by the _axiom of extensionality._

  Since $p eq.not emptyset$, the _axiom of regularity_ tells us
  there exists $z$ such that $z in p$ and $p inter z = emptyset$.
  From $z in p$, we derive $z in {x}$ by the _axiom of extensionality,_ so that $z = x$ by definition.
  This means $p inter x = emptyset$.
  Now, notice $x in x$ by assumption, and $x in p$ because $p = {x}$, so that $x in p inter x$.
  This implies $p inter x eq.not emptyset$ because $forall z (z in.not emptyset)$.
  #contradiction
  Therefore, $x in.not x$.
  // We can see $space z in p implies z in {x} implies z = x space$ by the _axiom of extensionality_ and the definition of _set roster notation._
  // $
  //   z in p implies z in {x} implies z = x
  // $
]

With this axiom, we can actually prove much more than the simple that that sets can't contain _themselves;_
we also can't have codependent cycles of sets that all mutually contain each other.
The simplest example of this would involve two sets, $x$ and $y$, such that $x in y$ and $y in x$.
We will now prove that no such sets exist.

#theorem[
  $forall x forall y (x in y implies y in.not x)$.
]
#proof[
  Let $x$ and $y$ be sets.
  Assume $x in y$, and suppose, towards a contradiction, that $y in x$.
  Consider the set $p := {x, y}$, which we know exists by the _axiom of pairing._
  By the _axiom of regularity,_ there exists some set $z$ such that $z in p$ and $p inter z = emptyset$.
  Since $z in p$, we know $z in {x, y}$ by definition, so that $z = x$ or $z = y$.
  We now take two cases.
  #case[
    Suppose $z = x$, so that $p inter x = emptyset$.
    Recall $y in x$ by assumption,
    Notice $y in {x, y}$ by definition,
    implying that $y in p$ by the _axiom of extensionality._
    This means $y in p inter x$ by definition, which tells us $p inter x eq.not emptyset$,
    contradicting $p inter x = emptyset$.
    #contradiction
  ]
  #case[
    Suppose $z = y$, so that $p inter y = emptyset$.
    Recall $x in y$ by assumption,
    Notice $x in {x, y}$ by definition,
    implying that $x in p$ by the _axiom of extensionality._
    This means $x in p inter y$ by definition, which tells us $p inter y eq.not emptyset$,
    contradicting $p inter y = emptyset$.
    #contradiction
  ]
  Therefore, we conclude that $y in.not x$ as desired.
]

== The Axiom of Infinity

The time has finally come for us to confront our first axiom.
We have been developing a theory of sets, and in the process have become acquainted with what it means to be a _"set"_ as encoded by the axioms of Zermelo-Fraenkel set theory
#marginalis[
  Actually, this is a lie.
]
with the exception of the _axiom of infinity._
We agreed that it _intuitively_ asserts that _"the set of all natural numbers exists."_
To understand what this _means,_ we need to recognize that the natural numbers are _arranged_ in a very special way.
The number $0$ is the _*first*_ natural number;
the _*next*_ natural number is $1$;
the _*next*_ one after that is $2$;
and so on...
Importantly, if we are searching for a particular natural number $k$, we can find $k$ by _starting at $0$_ and then continually taking _discrete steps from one number to the next_ until, eventually, we reach $k$.

Our notion of a what a natural number _"is"_ fundamentally relies on the observation that they can all be reached by _starting at zero_ and then taking some finite number of _discrete steps_ that move us _from one number to the next._
This means that we should first define who _"zero"_ is and how to take these _"steps."_
We present these definitions below, without motivation, so that we can discuss their consequences.

#definition(name: "The Natural Number Zero")[
  We define #define[the natural number zero] as $0 := emptyset$.
  #apostille[$0$]
  #marginalis[
    We will eventually have other _"kinds"_ of numbers than just the natural numbers, and they will also have a corresponding _"zero"_ distinct from the natural number $0$ we are defining here.
    For example, the _"integer zero"_ and the _"rational number zero"_ and the _"real number zero,"_ if they were implemented as sets within set theory, would be _different_ from the _"natural number zero"_ because they would not be equal to $emptyset$.
    In the interest of time, we will not be _constructing_ these other number sets in this class.
  ]
]

#definition(name: "The Successor Functional")[
  Given an arbitrary set $x$, we define the #define[successor of $x$] to be $suc(x) := x union {x}$.
  #apostille[$suc(dot.c)$]
]

Formally speaking, everything that exists in set theory is a _set,_
and therefore we are forced to define $0$ as some kind of set.
We chose to define $0$ to be $emptyset$, the empty set, for two reasons.
First: the natural number $0$ is supposed to be the _"first"_ natural number; so, it is appropriate that we represent it by $emptyset$ since the empty set was the _first_ specific set (that we understood) whose existence we formally proved.
Second: we know that the empty set has no elements (_i.e.,_ it is empty), so the quantity that $0$ is supposed to represent corresponds---intuitively speaking---with the number of elements in $emptyset$.

Now that we know who _"zero"_ is, the way we get to the _"next"_ natural number is through the _successor functional_ that we defined above:
the natural number _"one"_ is the successor of zero;
the natural number _"two"_ is the successor of one;
and so on...
#marginale[
  We obviously can not individually assign labels for _every_ set that corresponds to a natural number;
  we ask that you continue this sequence of definitions so that every finite string of decimal digits corresponds to a set according to the pattern displayed to the left.
]

$
  0 &:= emptyset \
  1 &:= suc(0)
      = suc(emptyset)
      = emptyset union {emptyset}
      = {emptyset} \
    &thin= {0} \
  2 &:= suc(1)
      = 1 union {1}
      = {emptyset} union {{emptyset}}
      = {emptyset, {emptyset}} \
      // = {0, 1}
    &thin= {0, 1} \
  3 &:= suc(2)
      = 2 union {2}
      = {emptyset, {emptyset}} union {{emptyset, {emptyset}}}
      = {emptyset, {emptyset}, {emptyset, {emptyset}}} \
    &thin= {0, 1, 2} \
    &space thin dots.v
  // 1 &:= suc(0) \
    // &thin= suc(emptyset)
$

The effect that $suc(x)$ has is to create a _new set with one additional element_ thanks to the theorem $forall x (x in.not x)$.
Intuitively, then, we see that the natural number $1$ is the set ${0}$ containing _one_ element;
the natural number $2$ is the set ${0, 1}$ containing _two_ elements;
the natural number $3$ is the set ${0, 1, 2}$ containing _three_ elements; and so on...
Extending this pattern, we will see that the natural number $n$ should correspond to ${0, 1, ..., n - 1}$.

Taking these definitions of _"zero"_ and _"successor,"_ we now define what it means for a particular individual to be a _natural number_ recursively as follows.

#definition(name: "Natural Number")[
  We say that a given set $n$ is a #define[natural number] precisely when any of the following are _true._
  #apostille[natural number]

  1. $n = 0$.
  2. $n = suc(m)$, where $m$ is a _natural number._
]

This definition implies that ${emptyset, {emptyset}, {emptyset, {emptyset}}}$ is a natural number but ${{{emptyset}}}$ is not.
We would like to put all of the things that are natural numbers, and only those things that are natural numbers, inside a set by themselves and claim that this set exists.
This is what we want the _axiom of infinity_ to assert.
In order to contain all of the natural numbers---looking at our definition above of what a natural number is---we would need the set to have two properties:

1. The set must contain $0$.
2. The set must contain successors for all of its elements.

The set of all natural numbers must _at least_ have these two properties.
Let's give a name to sets with these two properties.
We say that a set $I$ is #define[inductive]
#apostille[inductive]
if and only if, by definition,
both $0 in I$ and $forall i (i in I implies suc(i) in I)$ are satisfied.
An inductive set would necessarily contain every natural number as an element, but it's possible for a set to contain _more_ than just natural numbers as elements and still qualify as an inductive set.
#marginalis[
  For example, a set that contains $0$, all the successors of $0$, and also ${{{emptyset}}}$, and all of the successors of ${{{emptyset}}}$, would qualify as inductive.
]
To prevent any _"excess"_ elements, we will write the _axiom of infinity_ as follows.

#axiom(number: 0, name: "Infinity")[
  $exists N (N #say[is inductive] and forall I (I #say[is inductive] implies N subset I))$.
]

This axiom claims two things: an inductive set exists, and this inductive set is a subset of _every other_ inductive set.
Thanks to the _axiom of extensionality,_ there can only be at most one set with the two properties described by the axiom above.
We will call this unique set #define[the set of natural numbers] and use the symbol $NN$ to denote it.
#apostille[$NN$]
