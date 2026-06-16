#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 1,
  date: datetime(year: 2026, month: 02, day: 01),
)

// ==== Recall that truth tables are not proofs.

1. Prove each of the following statements _without truth tables._#marginalis[
  In addition to the axioms of propositional logic and the uniqueness of complements, you may assume the following theorems:#linebreak()
  #box[
    #set enum(numbering: "1.")
    // 1. If $p and q equiv bot$ and also $p or q equiv top$, then $not p equiv q$.
    1. $top equiv not bot$ and $bot equiv not top$
    2. Double Negation
    3. Idempotence
    4. Domination
    5. De Morgan's Laws
  ]
]

  + Prove $p arrow p$ is a tautology for any proposition $p$.

  // + Prove $(p arrow q) arrow (not q arrow not p)$ is a tautology for any propositions $p$, $q$.
  + Prove $p arrow q equiv not q arrow not p$ for all propositions $p$, $q$.

  // + Prove $p arrow (q arrow p)$ is a tautology for all propositions $p$, $q$.
  + Prove $not (p arrow q) equiv p and not q$ for all propositions $p$, $q$.

  + Prove $(p and (p arrow q)) arrow q$ is a tautology for all propositions $p$, $q$.

  // + Prove that $(p arrow (q arrow r)) arrow ((p arrow q) arrow (p arrow r))$ is a tautology for all propositions $p$, $q$, $r$.#marginalis[
  //   #smallcaps[Hint:] try first proving that $p arrow (q arrow r)$ and $(p arrow q) arrow (p arrow r)$ are equivalent, and then apply a result you've already proven earlier this problem set.
  // ]

  + Prove $(p or q) arrow r equiv (p arrow r) and (q arrow r)$ for all propositions $p$, $q$, $r$.

  // + Prove $(p and q) arrow r equiv (p arrow r) or (q arrow r)$ for all propositions $p$, $q$, $r$.

2. Prove each of the following statements for all propositions $phi$, $psi$, $xi$.
// #marginalis[
  // In addition to the axioms and rules of inference, you may#linebreak()
  // #box[
  //   // #set enum(numbering: "1.")
  //   // // 1. If $p and q equiv bot$ and also $p or q equiv top$, then $not p equiv q$.
  //   // 1. $top equiv not bot$ and $bot equiv not top$
  //   // 2. Double Negation
  //   // 3. Idempotence
  //   // 4. Domination
  //   // 5. De Morgan's Laws
  // ]
// // ]#marginalis[
// //   You should attempt these problems _in order._
// ]
  + $(phi arrow psi), (psi arrow xi) proves phi arrow xi$#marginale[
    _Hypothetical Syllogism_
  ]

  + $proves phi arrow phi$

  + $proves top$

  // + $proves (not phi arrow phi) arrow phi$#marginale[
  //   _Consequentia Mirabilis_
  // ]

  + $phi, psi proves phi and psi$#marginale[
    _Conjunction Introduction_
  ]

  + $phi and psi proves phi$#marginale[
    _Conjunction Elimination_
  ]

  // + Prove $(p arrow q) arrow ((p arrow not q) arrow not p)$ is a tautology for all propositions $p$, $q$.

// 2. Consider the infinite sequence of sentences indexed by natural numbers
//   $ S_0, S_1, S_2, ..., S_i, ... $
//   where each sentence asserts that all of the subsequent sentences are _false._
//   $ S_i := #say[#{sym.quote.l.double}$S_j$ is _false_ for all $j gt i$#{sym.quote.r.double}] $
//   // For example, the sentence $S_3$ asserts: "The sentences $S_4, S_5, S_6, ...$ are _false._"
//   // For example, the sentence $S_3$ asserts "the sentences $S_4, S_5, S_6, ...$ are all _false._"
//   For example, $S_3 := #say[#{sym.quote.l.double}$S_j$ is _false_ for all $j > 3$,#{sym.quote.r.double}]$ which means $S_3$ is equivalent to the assertion that "the sentences $S_4, S_5, S_6, ...$ are all _false._"
//   // For example, $S_3$ is equivalent to: "The sentences $S_4, S_5, S_6, ...$ are all _false._"

//   What are the truth values, if any, of the sentences in this sequence?
