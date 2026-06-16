#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "esoterica",
  number: 1,
  date: datetime(year: 2026, month: 02, day: 04),
)

1. Fix a universe of discourse containing all living people, and consider the following.#marginalis[
    Whether you decide to disambiguate this argument using $forall$ (as we did in class) or $exists$, this argument is still valid (_i.e.,_ the conclusion can be proven from the given premises).
  ]

  - Every mathematician likes baristas.
  - Every barista knows how to make coffee.
  - Dan is a mathematician.
  - Anyone who likes baristas likes people who know how to make coffee.
  - Therefore, someone likes people know how to make coffee.

  Formalize this argument, and then prove the conclusion follows from the premises.

2. Fix a universe of discourse containing real and fictional people throughout human history and consider the following argument.

  - Only grand wizards have apprentices.
  - Not every wizard is grand.
  - Therefore, there is a wizard without an apprentice.

  Formalize this argument, and then prove the conclusion follows from the premises.

3. Fix a universe of discourse containing the ancient Greek scholars and consider this.

  - Every man is mortal.
  - Socrates is a man.
  - Therefore, someone is mortal.

  Formalize this argument, and then prove the conclusion follows from the premises.
