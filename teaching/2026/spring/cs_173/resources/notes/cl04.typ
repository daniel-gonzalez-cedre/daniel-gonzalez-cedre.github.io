#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 4",
  number: 4,
  date: datetime(year: 2026, month: 02, day: 13),
)

// #show math.and: math.space + math.and + math.space
// #show math.or: math.space + math.or + math.space

// #let and = math.class("relation", math.and)

= A More Unified Theory of Sets

If we just stick to axioms 0, 1, 2, and 3, then _*intuitively speaking*_ the only kinds of sets that we will ever be able to construct will contain at most two distinct elements.
#marginalis[
  Keep in mind that _*we do not yet know how to count*!_
  We know how to say that a set $x$
  contains _*no elements*_ $forall y ( y in.not x )$
  or _*at least one element*_ $exists y ( y in x )$.
  In fact, if we were clever enough, we could figure out how to say that a set contains any fixed finite number of distinct elements;
  however, since we don't know how to _*compare the sizes of sets*_ yet, these statements don't carry much _formal_ weight yet...
]
This is an obviously unsatisfactory state of affairs.
We will spend the rest of this _clavicula_ discussing two new axioms that will allow us to construct a variety of sets.

== The Power Axiom
The concept of a _"subset"_ is fundamental to the study of sets.
In fact, the _axiom schema of separation_ asserts the existence of any particular subset of a given set $x$ that we might want to talk about;
all we need to do is specify a _wff_ $phi(dot.c)$ and we can gather all of the elements $z$ of $x$ for which $phi(z)$ is _true_ into their own set.
Naturally, then, it would be nice to be able to gather _all of the subsets_ of $x$ into their own set, right?
We would call such a set a _power set,_ and it requires its own axiom to assert its existence.
#marginalis[
  Remarkably, even though the _axiom schema of separation_ tells us that any definable subset of a given set $x$ we care about exists, we can't use that axiom, nor any previous (or future) axioms, to prove that the _set containing all of the subsets of $x$_ exists.
]

#definition(name: "Power Set")[
  For any set $x$, we define the #define[power set of $x$] to be $PP(x) := {z st z subset x}$.
  #apostille[$PP(dot.c)$]
]

#axiom(number: 4, name: "Power")[
  $forall x exists y (y = {z st z subset x})$.
  #marginalis[
    If we use the notation introduced in the previous definition above,
    then we could rewrite this axiom as $forall x exists y (y = PP(x))$.
  ]
]

Once we are ready, we will return to this definition and become intimately familiar with power sets.
In the meantime, we will look at some of their basic properties below.

#lemma[
  $forall x (emptyset in PP(x))$.
]
#proof[
  Let $x$ be an arbitrary set.
  Recall $emptyset subset x$ because $forall y (emptyset subset y)$.
  #marginalis[
    _Theorem 3.2_ from _clavicula 3._
  ]
  By the definition of _set comprehension notation,_
  we have $emptyset in {z st z subset x}$,
  implying $emptyset in PP(x)$ by definition.
]

#lemma[
  $forall x (x in PP(x))$.
]
#proof[
  Let $x$ be an arbitrary set.
  Recall that $x subset x$ because $forall y (y subset y)$.
  #marginalis[
    _Lemma 3.1_ from _clavicula 3._
  ]
  This implies that $x in {z st z subset x}$ by definition,
  so that $x in PP(x)$ by definition.
]

#corollary[
  $forall x (PP(x) eq.not emptyset)$.
]
#proof[
  Let $x$ be a set.
  Recall that $x in PP(x)$ as proven in the previous theorem.
  However, $x in.not emptyset$ because $forall y (y in.not emptyset)$.
  Therefore, $PP(x) eq.not emptyset$ by the _axiom of extensionality._
]

#lemma[
  $forall x (x subset emptyset implies x = emptyset)$.
]
#proof[
  Let $x$ be a set, and assume $x subset emptyset$.
  Let $t$ be a set, and observe $t in.not emptyset$ because $forall z (z in.not emptyset)$.
  Since $x subset emptyset$, this implies $t in.not x$,
  #marginalis[
    This is an application of _universal elimination_ followed by _modus tollens._
  ]
  and thus $forall y (y in.not x)$.
  #marginalis[
    This is _universal introduction._
  ]
  Therefore, since _the empty set is unique,_
  #marginalis[
    $forall a (forall b (b in.not a) implies a = emptyset)$.
  ]
  we know $x = emptyset$.
]

#pagebreak()

#corollary[
  $PP(emptyset) = {emptyset}$.
]
#proof[
  Observe that $emptyset subset emptyset$ because $forall x (emptyset subset x)$.
  #marginalis[
    _Theorem 3.2_ from _clavicula 3._
  ]
  This implies $emptyset in PP(emptyset)$ by definition.
  Now, let $t$ be a set and suppose $t in PP(emptyset)$.
  This means $t subset emptyset$ by definition.
  Now, by _Lemma 4.3_---which we just proved---we can see $t = emptyset$.
  Thus, $forall t (t in PP(x) implies t = emptyset)$.
  The _axiom of extensionality_ then lets us conclude $PP(emptyset) = {emptyset}$.
]

== The Axiom of Union

Despite the power of the previous axiom, we are still far too limited in the kinds of new sets that we are allowed to form.
We can't, for example, just merge two sets.

#definition(name: "Union of Two Sets")[
  Given two sets $x$ and $y$, we define the #define[union of $x$ with $y$]
  to be $x union y := {z st z in x or z in y}$.
  #apostille[$x union y$]
]

The union between two sets represents a way of _"merging"_ them together
by gathering all of their elements into one collection.
For example, if $x := {0, 1, 2}$ and $y := {1, 3, 4}$, then $x union y = {0, 1, 2, 3, 4}$.
It should be intuitively straightforward to understand why we would want
$x union y$ to be a set when $x$ and $y$ are both sets.
However, if we were to stop here and declare a new axiom
along the lines of $forall x forall y exists z (z = x union y)$,
then we would be restricting ourselves to only being able to union _finitely many sets_ together at a time.
#marginalis[
  Of course, we are being _intuitive_ here; we don't formally know how to count yet and we certainly don't know what it means for a quantity to be _"finite"_ (as opposed to _"infinite,"_ for example).
]

#definition(name: "Union Over a Set")[
  For any set $x$, we define the #define[union over $x$]
  to be $unions x := {z st exists y (y in x and z in y)}$.
  #apostille[$unions x$]
  This corresponds with iterating the binary _"union"_ operation over all of the elements of $x$ and accumulating the result.
  The alternative notation $union.big_(y in x) y := unions x$ is also common.
  #marginalis[
    This is inspired by the common _"summation"_ notation denoted with $Sigma$;
    we will encounter this notation later.
  ]
]

This definition given above provides a much more powerful notion of _"unions"_ by describing the union of _all of the elements_ of a set simultaneously, regardless of its _"size."_

#axiom(number: 5, name: "Union")[
  $forall x exists y (y = {w st exists z (z in x and w in z)})$.
  #marginalis[
    We could use our previous definition to rewrite this axiom to say $forall x exists y (y = unions x)$.
  ]
]

If we only want to describe the union of, say, two sets ${0, 1, 2}$ and ${1, 3, 4}$,
we could use our definition for $x union y$,
but we could also see that $unions {x, y}$ contains exactly the same elements.
Thus, we can recover the existence of pairwise unions from this axiom.

#theorem(name: "Existence of Pairwise Unions")[
  $forall x forall y exists z (z = x union y)$.
]
#proof[
  Let $x$ and $y$ be sets.
  Observe that there exists a set $p$ such that $pi = {x, y}$ thanks to the _axiom of pairing._
  Now, we know there exists a set $mu$ such that $mu = unions {x, y}$ from the _axiom of union._
  We will prove that $mu = x union y$; to that end, let $t$ be an arbitrary set.

  #show math.equation: set block(breakable: true)
  $
    t in mu &iff t in unions {x, y}                            &&quad#say[by definition of] mu \
            &iff t in {z st exists w (w in {x, y} and z in w)} &&quad#say[by definition of] unions {x, y} \
            &iff exists w (w in {x, y} and t in w)             &&quad#say[by definition of _set compr._] \
            &iff exists w ( ( w = x or w = y ) and t in w ) \
            &iff exists w ( ( w = x and t in w ) or ( w = y and t in w ) ) \
            &iff exists w ( w = x and t in w ) or exists w ( w = y and t in w ) \
            &iff t in x or t in y \
            &iff t in {z st z in x or z in y}                  &&quad#say[by definition of _set compr._] \
            &iff t in x union y                                &&quad#say[by definition of] x union y
  $
  #show math.equation: set block(breakable: false)

  Therefore, by the _axiom of extensionality,_ we can conclude that $mu = x union y$.
]

#definition(name: "Intersection of Two Sets")[
  Given sets $x$ and $y$, the #define[intersection of $x$ with $y$]
  is given by $x inter y := {z st z in x and z in y}$.
  #apostille[$x inter y$]
]

#theorem(name: "Existence of Pairwise Intersections")[
  $forall x forall y exists z (z = x inter y)$.
]
#proof[
  Let $x$ and $y$ be sets.
  We now know that $x union y$ exists thanks to the theorem we proved previously.
  By the _axiom schema of separation,_
  we know there exists a set $theta$ such that $theta = {z st z in x union y and z in x inter y}$.
  We will show $theta = x inter y$; to that end, let $t$ be a set.

  Suppose $t in x inter y$.
  Recalling $x inter y subset x union y$,
  #marginalis[
    _Problem 1.d._ on _problem set 3._
  ]
  we know $t in x union y$.
  So, $t in theta$ by definition.
  Suppose $t in theta$.
  Then, $t in x union y and t in x inter y$ by definition, implying $t in x inter y$.

  Therefore, by the _axiom of extensionality,_ we can conclude that $theta = x inter y$.
]

In the same way that we defined the _union over a set_ in order to have a more powerful notion of _"unions,"_
we can define what it means to take the _"intersection over a set."_

#definition(name: "Intersection Over a Set")[
  For any set $x$, we define the #define[intersection over $x$]
  to be $inters x := {z st forall y (y in x implies z in y)}$.
  #apostille[$inters x$]
  This corresponds with iterating the binary _"intersection"_ operation over all of the elements of $x$ and accumulating the result.
  An alternative notation that is sometimes encountered is $inter.big_(y in x) y := inters x$.
]

Following our intuition from before, we might be tempted to say that _"arbitrary intersections over sets should exist"_ in the same way we said arbitrary unions over sets should exist to justify the _axiom of union._
Before we go that far, let's take a moment to think about the consequences this would have, and the consequences that our most recent axiom has already had.
We know that, for _any_ set $x$, the object denoted by $unions x$ exists.
In particular, we should try to understand what this means if this knowledge is applied to our _*favorite* set:_ the empty set.
What is $unions emptyset$?

#lemma[
  $unions emptyset = emptyset$.
]
#proof[
  Towards a contradiction, suppose there exists a set $x$ such that $x in unions emptyset$.
  Now, recalling $unions emptyset = {z st exists y (y in emptyset and z in y)}$,
  this means $exists y (y in emptyset and x in y)$ by definition.
  Thus, there exists a set $w$ such that $w in emptyset$ and $x in w$.
  However, we know $w in.not emptyset$ because $forall y (y in.not emptyset)$.
  #contradiction
  Therefore, we conclude that $unions emptyset = emptyset$.
]

Having satisfied ourselves with unions, we return now to our concern regarding _"arbitrary intersections over sets"_ and ask ourselves the analogous question: what is $inters emptyset$?
As it turns out, the collection referred to by $inters emptyset$ _*does not exist*!_

#lemma[
  $forall x (x eq.not inters emptyset)$.
]
#proof[
  Towards a contradiction, suppose that there exists a set $U$ such that $U = inters emptyset$.
  By the _axiom schema of separation,_ there exists a set $R$ such that $R = {z st z in U and z in.not z}$.
  Now, either $R in R$ or $R in.not R$, so we will take two cases.
  #case[
    If $R in R$, then $R in U$ and $R in.not R$ by definition, contradicting the premise $R in R$.
    #contradiction
  ]
  #case[
    Suppose $R in.not R$.
    Then, by definition, $not (R in U and R in.not R)$, which is equivalent to $R in.not U or R in R$.
    // We know $U = inters emptyset = {z st forall y (y in emptyset implies z in y)}$ by definition;
    // so, if we recall that $forall y (y in.not emptyset)$, we can see that $forall y (y in emptyset implies R in y)$,
    Recall $forall y (y in.not emptyset)$ and observe the following logical deduction.
    $
      forall y (y in.not emptyset) space implies space forall y (y in.not emptyset or R in y)
                                   space implies space forall y (y in emptyset implies R in y)
    $
    This then implies $R in {z st forall y (y in emptyset implies z in y)}$ by definition,
    so that $R in inters emptyset$ by definition,
    and thus $R in U$ by the _axiom of extensionality._
    In light of our prior realization $R in.not U or R in R$,
    we see $R in R$,
    #marginalis[
      This is an application of the _disjunctive syllogism._
    ]
    contradicting our assumption $R in.not R$.
    #contradiction
  ]
  We must therefore conclude that there _*does not exist*_ any set equal to $inters emptyset$.
]

As a result, we can not a complementary axiom to the _axiom of union_ that would allow for the existence of $inters x$ for any set $x$.
If we did, we could recreate the argument above, reproduce Russell's paradox, and introduce a contradiction into our theory.
However... as it turns out... we can prove that $inters x$ _does_ in fact exist as long as the set $x$ is _nonempty!_
This is an immensely important result that we will soon come to appreciate when we revisit the _axiom of infinity._

#theorem(name: "Existence of Nonempty Intersections")[
  $forall x (x eq.not emptyset implies exists y (y = inters x))$.
]
#proof[
  Let $x$ be a set, and suppose $x eq.not emptyset$.
  The _axiom schema of separation_ states that
  there exists a set $Omega$ such that $Omega = {z st z in unions x and z in inters x}$.
  We'll show $Omega = inters x$.
  Let $t$ be a set.

  First, suppose that $t in Omega$,
  so that $t in {z st z in unions x and z in inters x}$ by definition,
  telling us that $t in unions x$ and $t in inters x$ by definition.
  We can clearly see $t in inters x$ as required.

  Conversely, suppose $t in inters x$.
  By definition, this means $forall y (y in x implies t in y)$.
  Now, we are compelled to recall $x eq.not emptyset$,
  which means there exists a set $w$ such that $w in x$ by the _axiom of extensionality._
  Using our earlier observation $forall y (y in x implies t in y)$, this then implies $t in w$.
  Thus, $exists y (y in x and t in y)$, which means $t in unions x$ by definition.
  Therefore, since we know $t in unions x$ and $t in inters x$, we obtain $t in Omega$ by definition.

  We now invoke the _axiom of extensionality_ to conclude $Omega = inters x$.
]
