#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 0,
  date: datetime(year: 2026, month: 01, day: 25),
)

==== Justify each of your answers with an argument. An answer provided with bad or no justification is worse than a wrong answer.

+ Determine the truth value, if any, of each of the following sentences.

  + "Every integer is either even or odd."#marginalis[
    Informally, an #text(fill: blue)[_integer_] is either a positive whole number $1, 2, 3, ...$ or a negative whole number $-1, -2, -3, ...$ or zero $0$.
  ]

  + "Every number is either even or odd."

  + "Every non-empty set of integers has a smallest element."#marginalis[
    // For our purposes here, a #text(fill: blue)[_set_] informally denotes a "collection of objects."
    Informally, a #text(fill: blue)[_set_] is a "collection of objects."
  ]

  + "Every non-empty set of natural numbers has a smallest element."#marginalis[
    Informally, a #text(fill: blue)[_natural number_] is a non-negative whole number $0, 1, 2, ...$
  ]

  + "Every natural number is boring."#marginalis[
    For some reasonable definition of "boring."
  ]

  + "No natural number is boring."

+ Determine the truth value, if any, of each of the following sentences.#marginalis[
    You may that assume $7$ is actually a prime number.
  ]

  + "This sentence is _true._"#marginalis[
      You may find it helpful to give a sentence like this a name.
      For example, define $S := #say[#{sym.quote.l.double}$S$ is _true._#{sym.quote.r.double}]$
      The sentence $S$ is equivalent to "This sentence is _true._", so reason about $S$ instead.
    ]

  + "This sentence is _false._"

  + "The set of all sets that contain themselves contains itself."

  + "The set of all sets that do not contain themselves does not contain itself."

  + "If this sentence is _false,_ then $7$ is a prime number."//#marginalis[The phrase _"this sentence"_ refers to the entire sentence in problem 2.e.]

  + "If this sentence is _true,_ then $7$ is not a prime number."//#marginalis[The phrase _"this sentence"_ refers to the entire sentence in problem 2.f.]

+ Consider the infinite sequence of sentences indexed by natural numbers
  $ S_0, S_1, S_2, ..., S_i, ... $
  where each sentence asserts that all of the subsequent sentences are _false._#marginalis[
    The variable $i$ in the definition of $S_i$ ranges over all of the natural numbers $0, 1, 2, ...$
  ]
  $ S_i := #say[#{sym.quote.l.double}$S_j$ is _false_ for all $j gt i$#{sym.quote.r.double}] $
  // For example, the sentence $S_3$ asserts: "The sentences $S_4, S_5, S_6, ...$ are _false._"
  // For example, the sentence $S_3$ asserts "the sentences $S_4, S_5, S_6, ...$ are all _false._"
  For example, $S_3 := #say[#{sym.quote.l.double}$S_j$ is _false_ for all $j > 3$,#{sym.quote.r.double}]$ which means $S_3$ is equivalent to the assertion that "the sentences $S_4, S_5, S_6, ...$ are all _false._"
  // For example, $S_3$ is equivalent to: "The sentences $S_4, S_5, S_6, ...$ are all _false._"

  What are the truth values, if any, of the sentences in this sequence?#marginalis[
    Your argument should describe the truth values, if any, of _every_ sentence in this sequence.
  ]#marginalis[
    #smallcaps[Hint:] you should first determine what the truth value of $S_0$ is; once you have worked this out, then you can think about generalizing your argument to an arbitrary sentence $S_i$ in the sequence.
  ]
