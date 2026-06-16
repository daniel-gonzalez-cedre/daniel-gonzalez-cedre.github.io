#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "esoterica",
  number: 0,
  date: datetime(year: 2026, month: 02, day: 02),
)

We will work up to a proof of
$forall x (phi(x)) equiv not exists x (not phi(x))$
and
$exists x (phi(x)) equiv not forall x (not phi(x))$.

1. Let $phi$ be a unary predicate.

  + Show that $exists x (not phi(x)) proves not forall x (phi(x))$.

  + Show that $forall x (not phi(x)) proves not exists x (phi(x))$.

2. Let $phi$ be a unary predicate.

  + Show that $not exists x (phi(x)) proves forall x (not phi(x))$.

  + Show that $not forall x (phi(x)) proves exists x (not phi(x))$.

#v(1.0em)
Now we will show two important theorems.
Pay attention to the parentheses.

3. Let $phi$ be a unary predicate and let $psi$ be a proposition.

  + Show that $forall x (phi(x) arrow psi) proves exists x (phi(x)) arrow psi$.

  + Show that $exists x (phi(x)) arrow psi proves forall x (phi(x) arrow psi)$.
