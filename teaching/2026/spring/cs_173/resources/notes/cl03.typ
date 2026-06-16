#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 3",
  number: 3,
  date: datetime(year: 2026, month: 02, day: 11),
)

= Expanding our Notion of Set

Thanks to the _axiom of extensionality,_ we now know that sets are equal when they have exactly the same elements.
Thanks to the _axiom of pairing,_ we now also know that we can take two existing sets $x$ and $y$ and construct the unordered pair ${x, y}$ with the knowledge that ${x, y}$ also exists.

In the previous Clavicula, we defined what it means for one set $x$ to be a _subset_ of another set $y$.
We remind you of the definition, for two arbitrary sets $x$ and $y$, below.

$
  x subset y deff forall z (z in x implies z in y)
$

This _"relation"_#marginalis[
  This is not a "relation" _technically speaking_ if you have encountered that term in other contexts,
  but it is _"spiritually"_ a relation.
]
we've defined has several important properties.
Three of these properties show us that $subset$ is an example of a #define[partial order] (at least _in spirit_).

#lemma[
  // For any sets $x$, $y$, and $z$, the following three statements hold.
  // The following three statements hold for any sets $x$, $y$, and $z$.
  // 1. $x subset x$ #h(1.0fr) _Reflexivity_
  // 2. $(x subset y and y subset x) implies x = y$ #h(1.0fr) _Antisymmetry_
  // 3. $(x subset y and y subset z) implies x subset z$ #h(1.0fr) _Transitivity_
  The following three statements hold.

  1. $forall x ( x subset x )$.                                                         #h(1.0fr) _Reflexivity_
  2. $forall x forall y ( ( x subset y and y subset x ) implies x = y )$.               #h(1.0fr) _Antisymmetry_
  3. $forall x forall y forall z ( ( x subset y and y subset z ) implies x subset z )$. #h(1.0fr) _Transitivity_
]

We will come to understand these properties more intimately later.

We also defined some notation, in the previous Clavicula, for referring to the _"collection of things that satisfy a given property."_
Given a well-formed formula $phi$ containing exactly one free variable, we use the notation ${x st phi(x)}$ to denote the collection of all things that satisfy $phi$.
Reflecting on these definitions and axioms, one may be lead to consider whether or not an "empty set" exists.
This is a remarkably important question.

First, we should define _what_ this empty set would be; once we know _what_ we're talking about, we can think about whether or not we can prove it exists.
We will define the#marginalis[
  It is interesting that we should use the word _"the"_ to describe this thing...
] #define[empty set]_,_#marginalis[
  It is somewhat inappropriate for us to be calling this the _empty *"set"*_ since we do not yet _know_ that this _thing *exists*._
  However, we will soon resolve this problem by _proving_ that the thing that ${x st x eq.not x}$ denotes exists.
]
denoted by the symbol $emptyset$, as follows.

#definition(name: "Empty Set")[
  $emptyset := {x st x eq.not x}$.
  #apostille[$emptyset$]
]

Before knowing that this _"thing"_ exists, we can already start proving it has some very nice properties---properties would should _expect_ it to have based on its name.#marginalis[
  If we did not have an actual existence proof for this object, then a lot of what we're about to do would be a waste of time.
  However, since we _will_ actually have an existence proof for $emptyset$ later, we do not toil in vain.
]
Most importantly, we should verify that this "empty set" is actually _empty._
If we think about what it means for an arbitrary set $x$ to be #define[empty]_,_
#apostille[empty]
it should mean $forall y (y in.not x)$.
We prove that $emptyset$ has this property below.

#theorem(name: "The Empty Set is Empty")[
  $forall x (x in.not emptyset)$.
]
#proof[
  Let $x$ be an arbitrary set and suppose, towards a contradiction, that $x in emptyset$, which literally means $x in {z st z eq.not z}$ by definition.
  Then, we know that $x eq.not x$ by definition.
  However, this contradicts the fact that $x = x$.
  #contradiction
  Therefore, $x in.not emptyset$.
]

The empty set has an interesting relation with the $subset$ symbol we defined earlier.
In fact, in a certain precise sense, the empty set is _"very nice"_ and exhibits an important _universal property._
We hint at this _universal property_ below by providing three proofs of the fact that the empty set is a subset of any set.

#theorem[
  $forall x (emptyset subset x)$.
]
#proof(number: 1)[
  Let $x$ be a set.
  Let $z$ be an arbitrary set.
  Since $forall w (w in.not emptyset)$, we know $z in.not emptyset$.
  Thus, we can say $z in.not emptyset or z in x$.
  This is equivalent to $z in emptyset implies z in x$.

  Therefore, since $z$ was an arbitrary set, we have shown that $forall w (w in emptyset implies w in x)$.
  This means precisely that $emptyset subset x$ by definition.
]
#proof(number: 2)[
  Let $x$ be a set.
  Let $z$ be a set and assume $z in emptyset$.
  Recall that $forall w (w in.not emptyset)$, so that $z in.not emptyset$.
  Hence, by the _principle of explosion,_ we have $z in x$.

  We have now shown that $forall w (w in emptyset implies w in x)$, meaning $emptyset subset x$ by definition.
]
#proof(number: 3)[
  Let $x$ be a set.
  Let $z$ be a set and assume $z in emptyset$.
  Towards a contradiction, assume $z in.not x$.
  Recalling $forall w (w in.not emptyset)$, we know that $z in.not emptyset$.
  However, this contradicts our assumption that $z in emptyset$.
  #contradiction
  Therefore, we must have $z in x$. \
  So, we have shown $forall w (w in emptyset implies w in x)$.
  We therefore conclude $emptyset subset x$ by definition.
]

Finally, we should justify our use of the word _"the"_ when referring to _the_ empty set.
We will provide two proofs that any set that happens to be empty _is_ actually equal to $emptyset$.

#theorem(name: "The Empty Set is Unique")[
  $forall x (forall y (y in.not x) implies x = emptyset)$.
]
#proof(number: 1)[
  Let $x$ be a set and assume that $forall y (y in.not x)$.
  Towards a contradiction, suppose $x eq.not emptyset$.
  By the _axiom of extensionality,_
  there then exists some $z$ such that $z in x and z in.not emptyset$ or $z in.not x and z in emptyset$.
  We now take two cases based on this disjunction.#marginalis[
    Note that what we are doing here, typically called a #define[proof by cases]_,_ is just an example of applying the _disjunction elimination_ theorem that was proven in _Problem Set 2._
    As a reminder, _disjunction elimination_ states the following:
    #linebreak(justify: true)
    $alpha or beta, space alpha arrow delta, space beta arrow delta proves delta$
  ]
  #case[
    Suppose $z in x$ and $z in.not emptyset$.
    Recall $forall y (y in.not x)$, implying $z in.not x$, contradicting $z in x$.
    #contradiction
  ]
  #case[
    Suppose $z in.not x$ and $z in emptyset$.
    Recall $forall w (w in.not emptyset)$, so that $z in.not emptyset$, contradicting $z in emptyset$.
    #contradiction
  ]
  Since we have derived contradictions in both cases,
  our initial assumption must have been mistaken,
  and we must therefore conclude that $x = emptyset$.
]
#proof(number: 2)[
  Let $x$ be a set.
  We will prove the contrapositive of the claim.#marginalis[
    Recall that the #define[contrapositive] of a given conditional statement $alpha arrow beta$ is an _equivalent_ conditional statement that looks like $not beta arrow not alpha$.
  ]
  With this goal in mind, assume $x eq.not emptyset$.
  By the _axiom of extensionality,_ this means that
  there exists some $z$ such that $(z in x and z in.not emptyset) or (z in.not x and z in emptyset)$.
  However, if we recall $forall w (w in.not emptyset)$,
  then we can see $z in.not emptyset$,
  thereby refuting $z in.not x and z in emptyset$.
  From these results, we can then deduce $z in x and z in.not emptyset$,#marginalis[
    This is an example usage of the _disjunctive syllogism_ from _Problem Set 2,_ which says:
    #linebreak(justify: true)
    $alpha or beta, space not beta proves alpha$
  ]
  so that $z in x$.
  We have therefore shown $exists y (y in x)$.

  We conclude by noticing $(x eq.not emptyset) arrow.double exists y (y in x)$ is equivalent to $forall y (y in.not x) arrow.double (x = emptyset)$.
]

Now that we have gotten to know $emptyset$ a little better, we should start to become earnestly worried about the question of its existence.
If it turns out that we can not prove that $emptyset$ exists, then writing proofs about its supposed properties becomes much less interesting.
Resolving this question requires us to look more deeply at the $subset$ relation.

== The Axiom Schema of Separation
In the same way we motivated axioms 1 and 2 based on our intuitive notion of what a set _should_ be like, and what kinds of things we _should_ be _allowed_ to do to construct sets, we might naturally be lead to wonder whether _any *definable* collection of things_ should be considered a set.
At first glance, this should sound completely reasonable; we even have special notation---_set comprehension notation_---for describing "the collection of all objects that have a property."
If we can precisely express a property through a well-formed formula $phi$, then why shouldn't we be able to talk about _"the set ${x st phi(x)}$ of all things that have the property expressed by $phi$"?_
It sounds like we are about to introduce a new axiom that says something like:
$
  #say[For any well-formed formula $phi$ with one free variable,]
  exists x (x = {z st phi(z)}).
$
Conveniently, this would also neatly resolve the question of the exists of the empty set.
Recall that $emptyset = {x st x eq.not x}$ by definition;
if we notice $x eq.not x$ is equivalent to $not (x = x)$,
which is a well-formed formula with one free variable,
then this proposed axiom would immediately tell us that $emptyset$ exists.
But... what are the consequences for our hubris...?

When thinking through the ramifications, we could consider sets like ${x st x = x}$ and ${x st x in x}$, what properties they would have, and whether their existence would be unexpected in the theory of sets we are developing.#marginalis[
  There _are_ serious problems that would result from considering those _things_ to be _"sets,"_ but we are not ready to discuss that yet.
]
Eventually, after enough time and reflection, we might arrive at at a collection like $frak(R) := {x st x in.not x}$.
If we take our new proposed axiom at face-value, then we should be able to say $frak(R)$ exists, and we should therefore expect to be able to ask questions about $frak(R)$---the same kinds of questions that we would ask about any other set---and expect to get coherent answers.
To be more precise, we should be able to use $frak(R)$ as a term in a sentence#marginalis[
  Recall that a #define[sentence] is, formally, a well-formed formula with no free variables.
]
that expresses a truth value.
// For example, the statement $frak(R) in frak(R)$ should be either _true_ or _false._
For example, we should be able to say either $frak(R) in frak(R)$ or $frak(R) in.not frak(R)$.
So... which is it?

Well, if we suppose $frak(R) in frak(R)$, then that means $frak(R) in {x st x in.not x}$ by the definition of $frak(R)$.
This implies $frak(R) in.not frak(R)$ by the definition of set comprehension notation.
But that contradicts our assertion that $frak(R) in frak(R)$...
#contradiction

Okay, what if we suppose $frak(R) in.not frak(R)$?
This is equivalent to $not ( frak(R) in {x st x in.not x} )$ by the definition of $frak(R)$,
which means $not ( frak(R) in.not frak(R) )$ by the definition of set comprehension notation.
But that just says $frak(R) in frak(R)$,#marginalis[
  ... by _double negation_...
]
clearly contradicting our earlier claim that $frak(R) in.not frak(R)$...
#contradiction

However, we know that $frak(R) in frak(R) or frak(R) in.not frak(R)$ because that's a _theorem_ of the first-order logic.
If we combine this theorem with the arguments in the preceding paragraphs, and if we remember the theorem named _disjunction elimination,_ then we will be able to _prove a contradiction,_ which (by the _principle of explosion_) will let us _prove whatever we want!_
This makes our "theory" completely meaningless!
We can not allow collections like $frak(R)$ to exist; the mere existence of such objects introduces contradictions!

Now, let's take a step back and recall the $subset$ relation we introduced earlier.
Instead of asserting the existence of the collection of _all_ objects that have some property, what if we collect only those objects _that already belong to an existing set_ that have the desired property?
Instead of asserting that ${x st phi(x)}$ always exists, why don't we instead make the more modest assertion that ${x st x in A and phi(x)}$ exists whenever $A$ exists?
This would be the _subset_ of $A$ consisting of all those elements of $A$ that have the property $phi$.
As it turns out, this fixes everything waow.

#axiom(number: 3, name: "Schema of Separation")[
  For any _wff_ $phi$ with one free variable, we take the following sentence on faith. \
  $forall x exists y (y = {z st z in x and phi(z)})$.
]

This axiom allows us to know that _arbitrary subsets_ of sets that exist also exist.

=== Some More Notation
In light of our new axiom, we will introduce some new notation that will make communication involving more complex sets easier.
For any well-formed formula $phi$ containing one free variable, and for any set $x$,
we define the following new set notation.

$
  {z in x st phi(z)} := {z st z in x and phi(z)}
$

Using this notation, we could rephrase the _axiom schema of separation,_
for a given _wff_ $phi$, as the statement $forall x exists y (y = {z in x st phi(z)})$
since this is equivalent to the sentence $forall x exists y (y = {z st z in x and phi(z)})$.
We introduce two more useful notations for any set $x$.

$
  (forall y in x)(phi(y)) &deff forall y (y in x implies phi(y)) \
  (exists y in x)(phi(y)) &deff exists y (y in x and phi(y))
$

This notation will be very useful in the future,#marginalis[
  ... and, importantly, while this notation appears in many locations in other books, notes, and resources, there are often _subtle variations_ on this notation (for example, dropping parentheses, or using other forms of punctuation) that _mean_ the same thing...
]
but it is important to keep in mind that $(forall y in x)$ _*is not a sentence* on its own!_
The expression $(exists y in x)$ _*does not mean anything*!_
These fragments _*must*_ be attached to a _"body"_ to create a well-formed sentence.
