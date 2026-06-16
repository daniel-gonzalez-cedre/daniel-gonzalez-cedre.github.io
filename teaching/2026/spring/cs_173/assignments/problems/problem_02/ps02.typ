#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 2,
  date: datetime(year: 2026, month: 02, day: 08),
)

// ==== Recall that truth tables are not proofs.

// 1. Prove each of the following statements _without truth tables._#marginalis[
//   In addition to the axioms of propositional logic and the uniqueness of complements, you may assume the following:#linebreak()
//   #box[
//     #set enum(numbering: "1.")
//     // 1. If $p and q equiv bot$ and also $p or q equiv top$, then $not p equiv q$.
//     1. $top equiv not bot$ and $bot equiv not top$
//     2. Double Negation
//     3. Idempotence
//     4. Domination
//     5. De Morgan's Laws
//   ]
// ]

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to previous problems may be used as theorems to solve later problems.

1. Prove each of the following statements for all propositions $phi$, $psi$, $xi$, and $chi$.#marginalis(dy: -2.0em)[
    For problem 1, you may rely on everything _before page 26_ of the lecture notes.
  ]

  + $proves (not phi arrow phi) arrow phi$#marginale[
      _Consequentia Mirabilis_
    ]

  + $phi proves phi or psi$#marginale[
      _Disjunction Introduction_
    ]

  + $(phi or psi), (phi arrow xi), (psi arrow xi) proves xi$#marginale[
      _Disjunction Elimination_
    ]

  + $phi, not phi proves psi$#marginale[
      _Ex Falso Quodlibet_
    ]

  + $(phi or psi), not phi proves psi$#marginale[
      _Disjunctive Syllogism_
    ]

  + $(phi arrow xi), (psi arrow chi), (phi or psi) proves (xi or chi)$#marginale[
      _Constructive Dilemma_
    ]

2. Prove each of the following statements.#marginalis[
    For problem 2, you may rely on everything in _chapters 0, 1, and 2_ of the lecture notes.
  ]

  + Consider a universe of discourse containing all human beings who have ever existed or been mentioned in literature.
    Let $mu$ and $omega$ be unary predicates.#linebreak()

    Prove that $forall x (mu(x) arrow omega(x)), mu(#say[Socrates]) proves omega(#say[Socrates])$.

  + Consider a non-empty universe of discourse consisting of all persons inhabiting New Port City, Japan in the year 2029 #smallcaps[ad].
    Let $alpha$ and $gamma$ be unary predicates.

    Prove that $forall x (not gamma(x) arrow alpha(x)), not alpha(#say[Kusanagi]) proves exists x (gamma(x))$.#marginale[
      草薙 素子
    ]

  // + Consider a universe of discourse consisting of all people 

  + Let $frak(L)$ be a binary predicate and show that $proves not exists x forall y (frak(L)(x, y) arrow.l.r not frak(L)(y, y))$.

3. For this problem, we will be treating a statement that _is not a proposition_ as if it _is_ a proposition as a cautionary tale.
  Remember that, for the purposes of proof-writing, we do not yet _know_ any facts about the natural numbers.#marginalis(dy: -2.0em)[
    For problem 3, you may rely on everything in _chapters 0, 1, and 2_ of the lecture notes.
  ]

  Consider a universe of discourse consisting of the natural number#marginalis[
    Recall that the natural numbers consist of $0, 1, 2, 3, 4, ...$
  ]
  and define the predicate $pi(x) := #sentence[$x$ is a prime number.]$
  Let $phi$ be the statement $phi arrow forall x (pi(x))$.#marginalis[
    For the sake of this problem, you should assume that $phi$ is a proposition, and therefore obeys all of the axioms, rules of inference, and theorems about propositions we have studied so far.
  ]

  Prove that 4 is a prime number.
  // $
  //   lambda(x) &:= #sentence[$x$ is prime] \
  //   pi(x) &:= #sentence[$x$ is prime]
  // $
