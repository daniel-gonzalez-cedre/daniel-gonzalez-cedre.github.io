#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 8",
  number: 8,
  date: datetime(year: 2026, month: 03, day: 13),
)

= The Important Number Sets

At this point, we have developed a basic understanding of arithmetic with natural numbers.
We defined two basic operations on $NN$---namely addition and multiplication---and investigated enough properties for us to know that $NN$ is an _ordered semiring._
Let's briefly summarize these important properties.

== The Natural Numbers

We summarize here the various important algebraic properties of the set of natural numbers $NN$ with the addition $+$ and multiplication $dot$ operations we have defined on it.

#theorem(name: "The Natural Numbers with Addition are a Commutative Monoid")[
  - $(0 in NN) and (forall n in NN)(0 + n = n + 0 = n)$.
    #marginale[_existence of identity element_]
  - $(forall x, y, z in NN)(x + (y + z) = (x + y) + z)$.
    #marginale[_associativity_]
  - $(forall x, y in NN)(x + y = y + x)$.
    #marginale[_commutativity_]
]

#theorem(name: "The Natural Numbers with Multiplication are a Commutative Monoid")[
  - $(1 in NN) and (forall n in NN)(1 dot n = n dot 1 = n)$.
    #marginale[_existence of identity element_]
  - $(forall x, y, z in NN)(x dot (y dot z) = (x dot y) dot z)$.
    #marginale[_associativity_]
  - $(forall x, y in NN)(x dot y = y dot x)$.
    #marginale[_commutativity_]
]

#theorem(name: "The Natural Numbers are a Commutative Semiring")[
  - $(forall x, y, z in NN)(x dot (y + z) = (x dot y) + (x dot z))$.
    #marginale[_distributivity_]
  - $(forall x in NN)(0 dot x = x dot 0 = 0)$.
    #marginale[_the additive identity is a multiplicative annihilator_]
]

#theorem(name: "The Natural Numbers are an Ordered Semiring")[
  - $(forall x, y, z in NN)(x lt y iff x + z lt y + z)$.
    #marginale[_monotonicity of addition_]
  - $(forall x, y, z in NN)(z eq.not 0 implies (x lt y iff x dot z lt y dot z))$.
    #marginale[_monotonicity of multiplication_]
]

Although we do not know how to _subtract_ natural numbers from each other,
we do know that we can _add_ or _cancel_ the same number from both sides of an equality.

#theorem(name: "Addition on the Natural Numbers is Cancellative")[
  $(forall x, y, z in NN)(x + z = y + z iff x = y)$.
  // $(forall x, y, z in NN)(x + z = y + z implies x = y)$.
]

Similarly, even though we do not know what _division_ means for natural numbers,
we can still _multiply_ or _cancel_ the same _nonzero_ number from both sides of an equality.

#theorem(name: "Multiplication on the Natural Numbers is Cancellative")[
  $(forall x, y, z in NN)(z eq.not 0 implies (x dot z = y dot z iff x = y))$.
  // $(forall x, y, z in NN)(z eq.not 0 implies (x dot z = y dot z implies x = y))$.
]

Finally, there are no _nonzero zero-divisors_ in the set of natural numbers.

#theorem(name: "There are no Nonzero Zero-Divisors")[
  $(forall x, y in NN)(x dot y = 0 implies ((x = 0) or (y = 0)))$.
]

== The Integral Numbers
It is clearly frustrating to not be able to subtract natural numbers from each other.
In order to describe subtraction as an _operation_ similar to addition and multiplication, we would expect to be able to subtract _any_ two arbitrary natural numbers from each other, and we would also expect this subtraction to result in _another_ natural number.
However, using our intuitive understanding of "subtraction" from grade school, we can not subtract $5$ from $4$ because $4 - 5$ would not be a natural number.
But we _*want*_ to.

// The fundamental problem is that we do not have _additive inverses_ for all of the natural numbers.
// The fundamental problem is: not every natural number has an _additive inverse._
The fundamental problem is that some natural numbers do not have _additive inverses._
Given $x in NN$ and $y in NN$, we say $y$ is an #define[additive inverse for $x$] iff $x + y = 0 = y + x$.
#apostille[$+$ inverse]
The solution, then, is to augment $NN$ with an additive inverse for each of its elements.
#marginalis[
  Since the notion of an "inverse" here is being considered with respect to _addition,_ we usually denote the inverse of a number $x$ by $-x$, calling it the "negative" of $x$.
]
We will call this augmented set #define[the set of integers] and denote it with the symbol $ZZ$.
#apostille[$ZZ$]
// Informally, the set looks something like $ZZ = {..., -2, -1, 0, 1, 2, ...}$.
Informally, we usually say $ZZ := NN union {-x st x in NN}$.
For example, the additive inverse of the integer $2$ is the integer denoted by $-2$.
If the motivation so far has made sense, it will feel natural to work under the presumption that $NN subset ZZ$.
#marginalis[
  This is not _*technically* true_ in ZF set theory, but it is _true *in spirit*_ and will massively simplify our discussion during this section.
  We will make similar concessions for the rest of the number sets discussed here.
]

Unfortunately, we do not have time to describe _how_ this augmentation process can be done,
but rest assured that it _can_ be done in a consistent way within the confines of Zermelo-Fraenkel set theory.
For this reason, we will not _formally_ define what an integer is, nor will we _formally_ define addition, multiplication, or inequality on the integers.
With this understanding, we will suppose that $ZZ$ inherits all of the arithmetic and algebraic operations and theorems
#marginalis[
  ... meaning that $+$ and $dot$ are both associative and commutative on $ZZ$, and $0$ and $1$ are the respective identities corresponding to those operations, and $dot$ distributes over $+$, _et cetera_...
]
that we discussed about the natural numbers---making $ZZ$ an _ordered semiring_ just like $NN$ is---along with one additional property.
#marginalis[
  This property elevates $ZZ$ from a _semiring_ into a _ring._
]

#theorem(name: "The Integers with Addition are a Group")[
  $(forall x in ZZ)(exists! y in ZZ)(x + y = 0)$.
]

It can be easily shown that $x eq.not -x$ for all $x in ZZ without {0}$, and that $-0 = 0$;
so, the integers can be partitioned into the _positives,_ the _negatives,_ and _zero._
The positives and zero are all just natural numbers,
and they obey all the same rules that we studied about natural numbers.
We will now detail how the negative integers interact with the rest of the integers.
First, the partial order $lt.eq$ from $NN$ extends to $ZZ$ as follows.
// The partial order $lt.eq$ that we studied on $NN$ is extended into a partial order on $ZZ$ as follows.

#lemma[
  $(forall x in ZZ)(0 lt x iff -x lt 0)$.
]

For any arbitrary integer $x in ZZ$, we will say that $x$ is #define[positive] iff $x gt 0$,
#apostille[positive]
and we will define $x$ to be #define[negative] iff $x lt 0$.
#apostille[negative]
Notice that $0$ is neither positive nor negative.
Further, the interaction between negative numbers and multiplication is captured below.

#theorem[
  For any $x in ZZ$ and $y in ZZ$, the following equivalences hold.
  - $(x dot y gt 0) iff ((x gt 0 space and space y gt 0) or (x lt 0 space and space y lt 0))$.
  - $(x dot y lt 0) iff ((x gt 0 space and space y lt 0) or (x lt 0 space and space y gt 0))$.
  - $(x dot y = 0)  iff (x = 0 space or space y = 0)$.
  // Further, if $z in ZZ$ such that $z > 0$, 
]

#theorem[
  For all $x, y, z in ZZ$, we have the following.
  - $(x lt y and 0 lt z) implies (x dot z lt y dot z)$.
  - $(x lt y and 0 gt z) implies (x dot z gt y dot z)$.
]

// Finally, we define a new operation on $ZZ$ called _subtraction._

#definition(name: "Subtraction")[
  For every $x, y in ZZ$ we define #define[difference between $x$ and $y$] by $x - y := x + (-y)$.
]

// Notice subtraction _does *not*_ have the same properties as addition and multiplication!

#lemma(name: "Subtraction is not Associative")[
  $(exists x, y, z in ZZ)(x - (y - z) eq.not (x - y) - z)$.
]
#lemma(name: "Subtraction is not Commutative")[
  $(exists x, y in ZZ)(x - y eq.not y - x)$.
]

// #set math.frac(style: "skewed")

== The Rational Numbers
Now that we have added _additive_ inverses to $NN$, producing $ZZ$, we can ask the same question about the other important operation we have been discussing: _multiplication._
#marginalis[
  In contrast to the notation we used with addition,
  we usually denote the _multiplicative_ inverse of a number $x$ by $x^(-1)$.
  In general, this is the notation used for inverses with respect to arbitrary operations.
]
Ideally, we would want to define, for each integer $x$, a #define[multiplicative inverse]
#apostille[$dot$ inverse]
$x^(-1)$ so that $x dot x^(-1) = 1$.
However, unlike with addition, we must be a little more careful with multiplication because of the fact that zero is a _multiplicative annihilator:_
if $0$ had a multiplicative inverse $0^(-1)$, then $0 dot 0^(-1) = 1$ by definition, but also $0 dot 0^(-1) = 0$ because we are multiplying by zero, which would imply $0 = 1$.
#contradiction
Thankfully, this is the only problematic element---we can go ahead and define multiplicative inverses for every _nonzero_ integer,
#marginalis[
  This property elevates $QQ$ from a _ring_ into a _field._
]
and the resulting set of numbers we call the set of #define[rational numbers]_,_ which we denote by the symbol $QQ$.
#apostille[$QQ$]
Traditionally, we define consider a rational number to be a _quotient_ $x/y$,
#apostille[$x/y$]
where $x in ZZ$ and $y in NN without {0}$,
leading us to the informal definition $QQ := {x/y st x in ZZ and y in NN without {0}}$.
Here, we call $x$ the #define[numerator] and $y$ the #define[denominator]_._

Again, we will proceed under the presumption that $ZZ subset QQ$ by identifying the integer $x in ZZ$ with the rational number $x/1 in QQ$.
With this idea in mind, given two rational numbers $x_1/y_1 in QQ$ and $x_2/y_2 in QQ$,
we will define their sum and product as follows.
$
  x_1/y_1  +  x_2/y_2 & := (x_1 y_2 + x_2 y_1)/(y_1 dot y_2) \
  x_1/y_1 dot x_2/y_2 & := (x_1 dot x_2)/(y_1 dot y_2) \
$
Also, given a rational number $(x dot z)/(y dot z) in QQ$, we will identify $(x dot z)/(y dot z) = x/y$.
With this understanding, we can see $0/1$ and $1/1$ are the additive and multiplicative _identities_ respectively.

#theorem(name: "The Rationals with Multiplication are a Group")[
  $(forall p in QQ)(exists! q in QQ)(p dot q = 1/1)$.
]

To compare two rationals $x_1/y_1, x_2/y_2 in QQ$ to each other---extending the partial order $lt.eq$ from $ZZ$ to $QQ$---we compare their numerators after ensuring they have the same denominator.
$
  x_1/y_1 lt x_2/y_2 deff x_1 dot y_2 lt x_2 dot y_1
$

== The Real Numbers
There are two common ways to construct the set of #define[real numbers] $RR$ out of the rationals
#apostille[$RR$]
by _"completing"_ them in one of two ways.
In the first way, we want to ensure that every bounded set of rationals has a _least upper bound;_
this leads to the construction of the reals using _Dedekind cuts._
In the second way, we want to ensure that every _Cauchy convergent_ sequence of rational numbers _actually_ converges;
this leads what is known as the _Cauchy sequences_ construction.
In order to not distract from our focus in this course, we won't detail these approaches here.
The point is that the set of real numbers $RR$ contains every _"non-imaginary"_ number you've probably ever heard of throughout grade school,
and $RR$ has all of the algebraic properties you would expect it to have.
This is the last number set we are interested in covering;
we summarize the _"spiritual"_ relationship between these sets as follows.
$
  NN subset ZZ subset QQ subset RR
$

== Some Notable Functions
For convenience, we make the following definitions as abbreviations for the various sets of numbers we've introduced.
$
  & NN_(gt.eq 0) && := {n in NN st 0 lt.eq n} && = NN             & quad & QQ_(gt.eq 0) && := {q in QQ st 0 lt.eq q} \
  & NN_+         && := {n in NN st 0 lt n}    && = NN without {0} & quad & QQ_+         && := {q in QQ st 0 lt q} \
  & NN_-         && := {n in NN st n lt 0}    && = emptyset       & quad & QQ_-         && := {q in QQ st q lt 0} \
  & ZZ_(gt.eq 0) && := {z in ZZ st 0 lt.eq z} && = NN             & quad & RR_(gt.eq 0) && := {r in RR st 0 lt.eq r} \
  & ZZ_+         && := {z in ZZ st 0 lt z}    && = NN_+           & quad & RR_+         && := {r in RR st 0 lt r} \
  & ZZ_-         && := {z in ZZ st z lt 0}    && = NN_-           & quad & RR_-         && := {r in RR st r lt 0} \
$

#definition(name: "Absolute Value Function")[
  // We define the #define[absolute value] function $|square.stroked.dotted|: frak(A) to frak(A)$ as follows.
  The #define[absolute value] function $|square.stroked.dotted|: frak(A) to frak(A)_(gt.eq 0)$ is given, for every $x in frak(A)$, as follows below.
  $
    |x| := cases(
       x & quad #say[if] 0 lt.eq x,
      -x & quad #say[if] x lt 0
    )
    #apostille[$|square.stroked.dotted|$]
  $
]

#definition(name: "Max & Min Functions")[
  Let $frak(A) in {NN, ZZ, QQ, RR}$, and let $A subset frak(A)$ such that $A eq.not emptyset$.
  We say that $A$ is #define[bounded above] iff $(exists b in frak(A))(forall a in A)(a lt.eq b)$,
  and $A$ has a #define[maximal element] iff $(exists b in A)(forall a in A)(a lt.eq b)$.
  #apostille[maximal]

  When $A$ contains a maximal element $M in A$, we define $max(A) := M$.
  #apostille[#emph[$max$]]
  Because $lt.eq$ is _antisymmetric,_ this maximal element is unique, making $max$ a well-defined function.

  Similarly, we say that $A$ is #define[bounded below] iff $(exists b in frak(A))(forall a in A)(b lt.eq a)$,
  and we say that $A$ contains a #define[minimal element] iff $(exists b in A)(forall a in A)(b lt.eq a)$.
  #apostille[minimal]

  When $A$ contains a minimal element $m in A$, we define $min(A) := m$.
  #apostille[#emph[$min$]]
  Because $lt.eq$ is _antisymmetric,_ this minimal element is unique, making this a well-defined function.
]

#definition(name: "Floor & Ceiling Functions")[
  Let $frak(A) in {NN, ZZ, QQ, RR}$. \
  The #define[floor] function $floor(square.stroked.dotted): frak(A) to ZZ$ is given by the following mapping for every $x in frak(A)$.
  $
    floor(x) := max({z in ZZ st z lt.eq x})
    #apostille[$floor(square.stroked.dotted)$]
  $
  The #define[ceiling] function $ceil(square.stroked.dotted): frak(A) to ZZ$ is given by the following mapping for every $x in frak(A)$.
  $
    ceil(x) := min({z in ZZ st x lt.eq z})
    #apostille[$ceil(square.stroked.dotted)$]
  $
]

#definition(name: "Square Root Function")[
  Let $frak(A) in {NN, ZZ, QQ, RR}$.
  The #define[square root] function
  $sqrt(square.stroked.dotted): {a^2 st a in frak(A)} to frak(A)$
  is given by the following mapping for each $x in {a^2 st a in frak(A)}$.
  $
    sqrt(x) := y quad #say[where] y in frak(A) #say[such that] x = y^2
    #apostille[$sqrt(square.stroked.dotted)$]
  $
  // Although we will not take the time right now to prove it,
  // we should be able to see this _is,_ in fact, a function based on the restricted domain specified above.
]

#definition(name: "Logarithm Function")[
  Let $b in RR_(gt.eq 0)$ such that $b eq.not 0$ and $b eq.not 1$. \
  The #define[base $b$ logarithm] is the function
  $log_(b)(square.stroked.dotted): RR_+ to RR$
  defined for each $x in RR_+$ below.
  $
    log_(b)(x) := y quad #say[where] y in RR #say[such that] b^y = x
    #apostille[$log_(b)(square.stroked.dotted)$]
  $
]

// #pagebreak()

// #theorem[
//   // Let $frak(A) in {NN, ZZ, QQ, RR}$.
//   The following statements about exponentials and logarithms hold for any $a, x, y in RR$.

//   - $a^x > 0$

//   - $a^x dot a^y = a^(x + y)$

//   - $a^(-x) = display(1/(a^x))$

//   - 
// ]
