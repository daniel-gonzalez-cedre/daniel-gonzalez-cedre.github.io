#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "esoterica",
  number: 1,
  date: datetime(year: 2026, month: 02, day: 04),
)

1. Fix a universe of discourse containing all living people, and consider following.#marginalis[
    Whether you decide to disambiguate this argument using $forall$ (as we did in class) or $exists$, this argument is still valid (_i.e.,_ the conclusion can be proven from the given premises).
  ]

  - Every mathematician likes baristas.
  - Every barista knows how to make coffee.
  - Dan is a mathematician.
  - Anyone who likes baristas likes people who know how to make coffee.
  - Therefore, someone likes people know how to make coffee.

  We will formalize both ways of disambiguating this argument and prove both.
  Let us define the following predicates.

  $
    mu(x)        &:= #sentence[$x$ is a mathematician.] \
    beta(x)      &:= #sentence[$x$ is a barista.] \
    kappa(x)     &:= #sentence[$x$ knows how to make coffee.] \
    lambda(x, y) &:= #sentence[$x$ likes $y$.]
  $

  + First, consider the following formalization using universal quantifiers.

    - $forall x (mu(x) arrow forall y (beta(y) arrow lambda(x, y)))$.
    - $forall x (beta(x) arrow kappa(x))$.
    - $mu(#say[Dan])$.
    - $forall x (forall y (beta(y) arrow lambda(x, y)) arrow forall y (kappa(y) arrow lambda(x, y)))$.
    - Therefore, $exists x forall y (kappa(y) arrow lambda(x, y))$.

    We will show that the last line is provable from the first four.

    #proof[
      Assume $forall x (mu(x) arrow forall y (beta(y) arrow lambda(x, y)))$.
      Also, assume $forall x (beta(x) arrow kappa(x))$ and $mu(#say[Dan])$.
      Finally, assume $forall x (forall y (beta(y) arrow lambda(x, y)) arrow forall y (kappa(y) arrow lambda(x, y)))$.

      We can derive $mu(#say[Dan]) arrow forall y (beta(y) arrow lambda(#say[Dan], y))$ by _universal elimination._ \
      Using _modus ponens,_ we can then see $forall y (beta(y) arrow lambda(#say[Dan], y))$.

      Now, let's look at our last assumption.
      By applying _universal elimination,_ we can derive
      $forall y (beta(y) arrow lambda(#say[Dan], y)) arrow forall y (kappa(y) arrow lambda(#say[Dan], y))$. \
      Taking this with our previous result above, we can apply _modus ponens_ and obtain the expression
      $forall y (kappa(y) arrow lambda(#say[Dan], y))$.

      Since we have produced
      $forall y (kappa(y) arrow lambda(#say[Dan], y))$
      and "Dan" is a specific object, we can use _existential introduction_ to conclude
      $exists x forall y (kappa(y) arrow lambda(x, y))$.
    ]

  + Now, consider the following formalization using existential quantifiers.

    - $forall x (mu(x) arrow exists y (beta(y) and lambda(x, y)))$.
    - $forall x (beta(x) arrow kappa(x))$.
    - $mu(#say[Dan])$.
    - $forall x (exists y (beta(y) and lambda(x, y)) arrow exists y (kappa(y) and lambda(x, y)))$.
    - Therefore, $exists x exists y (beta(y) and lambda(x, y))$.

    We will prove the last line above is also provable from the first four statements.

    #proof[
      Assume $forall x (mu(x) arrow exists y (beta(y) and lambda(x, y)))$.
      Also, assume $forall x (beta(x) arrow kappa(x))$ and $mu(#say[Dan])$.
      Finally, assume $forall x (exists y (beta(y) and lambda(x, y)) arrow exists y (kappa(y) and lambda(x, y)))$.

      We can derive $mu(#say[Dan]) arrow exists y (beta(y) and lambda(#say[Dan], y))$ by _universal elimination._ \
      Using _modus ponens,_ we can then see $exists y (beta(y) and lambda(#say[Dan], y))$.

      Now, let's look at our last assumption.
      By applying _universal elimination,_ we can derive
      $exists y (beta(y) and lambda(#say[Dan], y)) arrow exists y (kappa(y) and lambda(#say[Dan], y))$. \
      Taking this with our previous result above, we can apply _modus ponens_ and obtain the expression
      $exists y (kappa(y) and lambda(#say[Dan], y))$.

      Since we have produced
      $exists y (kappa(y) and lambda(#say[Dan], y))$
      and "Dan" is a specific object, we can use _existential introduction_ to conclude
      $exists x exists y (kappa(y) and lambda(x, y))$.
    ]

2. Fix a universe of discourse containing real and fictional people throughout human history and consider the following argument.

  - Only grand wizards have apprentices.
  - Not every wizard is grand.
  - Therefore, there is a wizard without an apprentice.

  Define the following predicates.

  $
    xi(x)       &:= #sentence[$x$ is a wizard.] \
    zeta(x)     &:= #sentence[$x$ is grand.] \
    alpha(x, y) &:= #sentence[$x$ is an apprentice of $y$.]
  $

  We now formalize the argument below.

  - $forall x (exists y (alpha(y, x)) arrow (xi(x) and zeta(x)))$.
  - $not forall x (xi(x) arrow zeta(x))$.
  - Therefore, $exists x (xi(x) and not exists y (alpha(y, x)))$.

  We will now prove the third sentence from the first two.

  #proof[
    Assume $forall x (exists y (alpha(y, x)) arrow (xi(x) and zeta(x)))$,
    and assume $not forall x (xi(x) arrow zeta(x))$.

    Notice that $not forall x (xi(x) arrow zeta(x)) equiv exists x (not (xi(x) arrow zeta(x)))$ by the _negation of quantifiers_ theorem.
    Applying _existential elimination,_ we then know $not (xi(t) arrow zeta(t))$ for some person $t$.
    We can now observe the following deduction.
    $
       not (xi(t) arrow zeta(t)) &equiv not (not xi(t) or zeta(t))    &&wide#say[by _conditional disintegration_] \
                                 &equiv not not xi(t) and not zeta(t) &&wide#say[by _De Morgan's laws_] \
                                 &equiv xi(t) and not zeta(t)         &&wide#say[by _double negation_]
    $
    From this, we obtain both $xi(t)$ and $not zeta(t)$ by _conjunction elimination._
    We can now say $not xi(t) or not zeta(t)$ by _disjunction introduction._

    Recalling our first assumption, we can apply _universal elimination_ to derive
    $exists y (alpha(y, t)) arrow (xi(t) and zeta(t))$.
    The time has now come for another observation.
    $
      exists y (alpha(y, t)) arrow (xi(t) and zeta(t)) &equiv not (xi(t) and zeta(t)) arrow not exists y (alpha(y, t))    &&thick thick#say[by _1.b. in #sc[PS01]_] \
                                                       &equiv (not xi(t) or not zeta(t)) arrow not exists y (alpha(y, t)) &&thick thick#say[by _De Morgan's laws_]
    $
    Now that we have $not xi(t) or not zeta(t)$ and $(not xi(t) or not zeta(t)) arrow not exists y (alpha(y, t))$, we can deduce $not exists y (alpha(y, t))$ by _modus ponens._
    Recalling $xi(t)$, we then obtain $xi(t) and not exists y (alpha(y, t))$ by _conjunction introduction._

    Since $t$ was a particular object#marginalis[
      Recall that $t$ was introduced using _existential elimination,_ so this is _(one of) "the" term(s)_ that satisfies the statement $not(xi(t) arrow zeta(t))$.
    ]
    from our universe of discourse, we can conclude $exists x (xi(x) and not exists y (alpha(y, x)))$ by _existential introduction_ as desired.
  ]

3. Fix a universe of discourse containing the ancient Greek scholars and consider this.

  - Every man is mortal.
  - Socrates is a man.
  - Therefore, someone is mortal.

  Define the following predicates.

  $
    mu(x)    &:= #sentence[$x$ is a man.] \
    omega(x) &:= #sentence[$x$ is mortal.] \
  $

  We now formalize the argument below.

  - $forall x (mu(x) arrow omega(x))$.
  - $mu(#say[Socrates])$.
  - Therefore, $exists x (omega(x))$.

  We will now prove the third sentence from the first two.

  #proof[
    Assume $forall x (mu(x) arrow omega(x))$ and also $mu(#say[Socrates])$.
    By _universal elimination,_ we then know $mu(#say[Socrates]) arrow omega(#say[Socrates])$.
    We then have $omega(#say[Socrates])$ by _modus ponens._
    Therefore, applying _existential introduction,_ we conclude $exists x (omega(x))$.
  ]
