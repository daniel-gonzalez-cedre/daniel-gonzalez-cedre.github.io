// #import "@local/assignment:0.0.1": *
#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 1",
  number: 1,
  date: datetime(year: 2026, month: 02, day: 05),
)

= Important Theorems of the First-Order Logic

Now that we understand what _predicates,_ _terms,_ and _quantifiers_ are, it is time for us to define the kinds of expressions we are interested in communicating in the first-order logic.#marginalis[
  Just like when we defined what a proposition was, this will be a _recursive_ definition.
]
We say $lambda$ is a #define[well-formed formula] if and only if any of the following are satisfied.

1. $lambda = top$ or $lambda = bot$.
// 2. $lambda = bot$.
2. $lambda = phi(x_1, ..., x_n)$  #h(1.0fr)where $phi$ is an $n$-ary predicate,
  and $x_1, ..., x_n$ are terms.#marginalis[
    Here, we intuitively take $n$ to be a positive integer.
  ]
3. $lambda = not (phi)$              #h(1.0fr)where $phi$ is a _well-formed formula._
4. $lambda = (phi) and (psi)$        #h(1.0fr)where $phi$ and $psi$ are _well-formed formulae._
5. $lambda = (phi) or (psi)$         #h(1.0fr)where $phi$ and $psi$ are _well-formed formulae._
6. $lambda = (phi) arrow (psi)$      #h(1.0fr)where $phi$ and $psi$ are _well-formed formulae._
7. $lambda = (phi) arrow.l.r (psi)$  #h(1.0fr)where $phi$ and $psi$ are _well-formed formulae._
8. $lambda = forall x (phi)$         #h(1.0fr)where $phi$ is a _well-formed formula._
9. $lambda = exists x (phi)$         #h(1.0fr)where $phi$ is a _well-formed formula._

A well-formed formula $lambda$ is called a #define[sentence] when $lambda$ contains #underline[_no free variables_].#marginalis[
  This implies every term that appears in $lambda$ is either a _constant_ or a _variable bound by a quantifier._
]
In addition to our four quantified rules of inference, there are several important theorems regarding sentences in the first-order logic that we should keep in mind.
We summarize these theorems here, in part, because there are some _*typos page 31*_ of the lecture notes.

#theorem(name: "Negation of Quantifiers")[
  For any well-formed formula $phi$ with one free variable, the following equivalences hold.
  $
    not forall x (phi(x)) &equiv exists x (not phi(x)) \
    not exists x (phi(x)) &equiv forall x (not phi(x))
  $
]

#theorem(name: "Quantifier Shift")[
  For any well-formed formula $phi$ containing two free variables, the following hold.
  $
    forall x forall y (phi(x, y)) &equiv forall y forall x (phi(x, y)) \
    exists x exists y (phi(x, y)) &equiv exists y exists x (phi(x, y)) \
  $
  This means we can commute quantifiers _when they are the same;_ however, universal and existential quantifiers _do *not*_ necessarily commute with _each other!_
  $
    exists x forall y (phi(x, y)) &proves    forall y exists x (phi(x, y)) \
    forall x exists y (phi(x, y)) &notproves exists y forall x (phi(x, y)) \
  $
]

#theorem(name: "Distribution of Quantifiers")[
  For any well-formed formulae#marginalis[
    ... each containing exactly one free variable...
  ]
  $phi$ and $psi$ we can _distribute quantifiers_ as shown below.
  $
    forall x (phi(x) and psi(x)) &equiv forall x (phi(x)) and forall x (psi(x)) \
    exists x (phi(x) or  psi(x)) &equiv exists x (phi(x)) or  exists x (psi(x))
  $
  This means _universal quantifiers_ can be distributed _over conjunctions,_ and _existential quantifiers_ can be distributed over _disjunctions._
  However, the opposite _does *not* hold!_
  $
    forall x (phi(x) or psi(x)) &notproves forall x (phi(x)) or forall x (psi(x)) \
    exists x (phi(x)) and exists x (psi(x)) &notproves exists x (phi(x) and psi(x))
  $
//   $
//     forall x (phi(x) and psi(x)) &proves forall x (phi(x)) and psi(t) #say[for any constant $t$] \
//     forall x (phi(x) or psi(x))  &proves forall x (phi(x)) or psi(t)  #say[for any constant $t$]
//   $
//   We can also make the following inferences that eliminate _existential quantifiers._
//   $
//     exists x (phi(x)) and psi(t) #say[for some constant $t$] &proves exists x (phi(x) and psi(x)) \
//     exists x (phi(x)) or  psi(t) #say[for some constant $t$] &proves exists x (phi(x) or psi(x))
//   $
]
