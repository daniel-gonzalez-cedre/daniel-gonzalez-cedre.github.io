#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 2,
  date: datetime(year: 2026, month: 02, day: 08),
)

#let proof = proof.with(weight: "bold")

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to previous problems may be used as theorems to solve later problems.

1. We will prove each of the following statements for all propositions $phi$, $psi$, $xi$, and $chi$.

  + We provide two proofs of $proves (not phi arrow phi) arrow phi$.
    #proof(number: 1, qedbreak: true)[
      Let $phi$ be a proposition.
      $
        (not phi arrow phi) arrow phi &equiv (not not phi or phi) arrow phi &&wide#say[by _conditional disintegration_] \
                                      &equiv (phi or phi) arrow phi         &&wide#say[by _double negation_] \
                                      &equiv phi arrow phi                  &&wide#say[by _idempotency_]
      $
      We know $phi arrow phi$ by _problem 2.b._ from _Problem Set 1._
      Therefore, $(not phi arrow phi) arrow phi$.
    ]
    #proof(number: 2)[
      Let $phi$ be a proposition.
      In the interest of setting up a use of the _deduction rule,_ assume $not phi arrow phi$.
      This is equivalent to $not not phi or phi$ by _conditional disintegration._
      From this, we can derive $phi or phi$ by _double negation,_ and then get $phi$ by _idempotency._

      Thus, we know $not phi arrow phi proves phi$.
      Therefore, by the _deduction rule,_ we can conclude $(not phi arrow phi) arrow phi$ as desired.
    ]

  + We provide two proofs of $phi proves phi or psi$.
    #proof(number: 1)[
      Let $phi$ and $psi$ be propositions.
      Assume $phi$.
      Observe the following.
      $
        phi arrow (phi or psi) &equiv not phi or (phi or psi) &&wide#say[by _conditional disintegration_] \
                               &equiv (not phi or phi) or psi &&wide#say[by _associativity_] \
                               &equiv top or psi &&wide#say[by _complement_] \
                               &equiv top &&wide#say[by _domination_]
      $
      We know $top$ by _problem 2.c._ from _Problem Set 1._
      Thus, we can say $phi arrow (phi or psi)$.
      Then, by _modus ponens,_ we can conclude $phi or psi$.
    ]
    #proof(number: 2)[
      Let $phi$ and $psi$ be propositions.
      Assume $phi$.
      Towards a contradiction, assume $not (phi or psi)$,
      which is equivalent to $not phi and not psi$ by _De Morgan's laws._
      We can then apply _conjunction elimination_ to obtain $not phi$, clearly contradicting our assumption $phi$.
      #contradiction

      Therefore, we can conclude $phi or psi$ by _reductio ad absurdum._
    ]

    #colbreak()

  + We provide two proofs of $(phi or psi), (phi arrow xi), (psi arrow xi) proves xi$.
    #proof(number: 1)[
      Let $phi$, $psi$, and $xi$ be propositions.
      Assume $phi arrow xi$ and $psi arrow xi$.
      Also assume $phi or psi$.
      By _conjunction introduction,_ we then know $(phi arrow xi) and (psi arrow xi)$.
      Recall that $(phi arrow xi) and (psi arrow xi) equiv (phi or psi) arrow xi$ by _problem 1.e._ on _Problem Set 1,_
      producing $(phi or psi) arrow xi$.
      We then have $xi$ by _modus ponens_ as desired.
    ]
    #proof(number: 2)[
      Let $phi$, $psi$, and $xi$ be propositions.
      Assume $phi arrow xi$ and $psi arrow xi$.
      Also assume $phi or psi$.
      Towards a contradiction, suppose $not xi$.

      We then know $not phi$ by _modus tollens._
      Similarly, we have $not psi$ by _modus tollens._
      By _conjunction introduction,_ we then have $not phi and not psi$.
      This is evidently equivalent to $not (phi or psi)$ by _De Morgan's laws,_ contradicting our assumption $phi or psi$.
      #contradiction

      Therefore, by _reductio ad absurdum,_ we can conclude $xi$.
    ]

  + We provide two proofs of $phi, not phi proves psi$.
    #proof(number: 1)[
      Let $phi$ be a proposition.
      Assume $phi$, and also assume $not phi$.

      Let $psi$ be an arbitrary proposition, and notice that $phi arrow (not psi arrow phi)$ follows from _Hilbert's first axiom._#marginalis[
        This is _Theorem 1.7_ in the lecture notes.
      ]
      Applying _modus ponens,_ we then know $not psi arrow phi$.
      We can then see the following.
      $
        not psi arrow phi &equiv not phi arrow not not psi &&wide#say[by _problem 1.b._ from _Problem Set 1_] \
                          &equiv not phi arrow psi &&wide#say[by _double negation_]
      $
      Thus, we have $not phi arrow psi$.
      Therefore, we conclude $psi$ by _modus ponens._
    ]
    #proof(number: 2, qedbreak: true)[
      Let $phi$ and $psi$ be propositions.
      Assume both $phi$ and $not phi$.
      Towards a contradiction, suppose that $not psi$.
      Recall that $phi$ and also $not phi$.
      #contradiction

      Therefore, since $not psi proves phi$ and $not psi proves not phi$, we conclude $psi$ by _reductio ad absurdum._
    ]

  + We will prove $(phi or psi), not phi proves psi$.
    #proof[
      Let $phi$ and $psi$ be propositions.
      Assume $phi or psi$, and assume $not phi$.
      Notice that $phi or psi$ is equivalent to $not not phi or psi$ by _double negation,_ and this expression is equivalent to $not phi arrow psi$ by _conditional disintegration._
      By _modus ponens,_ we have $psi$.
    ]

  + We provide two proofs of $(phi arrow xi), (psi arrow chi), (phi or psi) proves (xi or chi)$.
    #proof(number: 1, qedbreak: true)[
      Let $phi$, $psi$, $xi$, and $chi$ be propositions.
      Assume $phi arrow xi$, $psi arrow chi$, and $phi or psi$.
      Notice that $phi or psi$ is itself equivalent to $not not phi or psi$ by _double negation,_
      and that is equivalent to $not phi arrow psi$ by _conditional disintegration._

      We have $not phi arrow chi$ by the _hypothetical syllogism._
      This is equivalent to $not chi arrow not not phi$ by _problem 1.b._ from _Problem Set 1._
      With the same justification, we know that our premise $phi arrow xi$ is equivalent to $not xi arrow not phi$.
      Applying the _hypothetical syllogism_ again, we obtain $not xi arrow chi$.
      This is equivalent to $xi or chi$ by _conditional disintegration._
    ]
    #proof(number: 2)[
      Let $phi$, $psi$, $xi$, and $chi$ be propositions.
      Assume $phi arrow xi$, $psi arrow chi$, and $phi or psi$.

      Towards a contradiction, assume that $not (xi or chi)$,
      which we know is equivalent to $not xi and not chi$ by _De Morgan's laws._
      Notice that this is also equivalent to $not chi and not xi$ by _commutativity._
      We can thus use _conjunction elimination_ to produce $not xi$ and $not chi$.

      Now, from $not xi$ and $phi arrow xi$, we obtain $not phi$ using _modus tollens._
      Similarly, from $not chi$ and $psi arrow chi$, we also obtain $not psi$ by _modus tollens._
      We then have $not phi and not psi$ by _conjunction introduction._
      This is equivalent to $not (phi or psi)$ by _De Morgan's laws,_ contradicting our earlier assumption $phi or psi$.
      #contradiction

      Therefore, we can conclude $xi or chi$ by _reductio ad absurdum._
    ]

2. 
  + Consider a universe of discourse containing all human beings who have ever existed or been mentioned in literature.
    Let $mu$ and $omega$ be unary predicates.#linebreak()

    We will prove $forall x (mu(x) arrow omega(x)), mu(#say[Socrates]) proves omega(#say[Socrates])$.
    #proof(qedbreak: true)[
      Assume $forall x (mu(x) arrow omega(x))$ and also $mu(#say[Socrates])$.
      By _universal elimination,_#marginalis[
        ... with the term _Socrates..._
      ]
      we have $mu(#say[Socrates]) arrow omega(#say[Socrates])$.
      Therefore, $omega(#say[Socrates])$ by _modus ponens._
    ]

  + Consider a non-empty universe of discourse consisting of all persons inhabiting New Port City, Japan in the year 2029 #smallcaps[ad].
    Let $alpha$ and $gamma$ be unary predicates.

    We will prove $forall x (not gamma(x) arrow alpha(x)), not alpha(#say[Kusanagi]) proves exists x (gamma(x))$.
    #proof[
      Assume $forall x (not gamma(x) arrow alpha(x))$ and $not alpha(#say[Kusanagi])$.
      By _universal elimination,_#marginalis[
        ... with the term _Kusanagi..._
      ]
      we then know $not gamma(#say[Kusanagi]) arrow alpha(#say[Kusanagi])$.
      By _modus tollens,_ this produces $not not gamma(#say[Kusanagi])$, which is equivalent to $gamma(#say[Kusanagi])$ by _double negation._

      We can then conclude $exists x (gamma(x))$ by _existential introduction._
    ]

  + Let $frak(L)$ be a binary predicate.
    We demonstrate $proves not exists x forall y (frak(L)(x, y) arrow.l.r not frak(L)(y, y))$.
    #proof[
      Towards a contradiction, assume $not not exists x forall y (frak(L)(x, y) arrow.l.r not frak(L)(y, y))$,
      which is clearly equivalent to $exists x forall y (frak(L)(x, y) arrow.l.r not frak(L)(y, y))$ by _double negation._

      By _existential elimination,_ we then know $forall y (frak(L)(t, y) arrow.l.r not frak(L)(y, y))$ for some $t$.
      We can then apply _universal elimination_#marginalis[
        ... with the term $t$...
      ]
      to assert $frak(L)(t, t) arrow.l.r not frak(L)(t, t)$.
      Now, observe.
      $
        frak(L)(t, t) arrow.l.r not frak(L)(t, t) &equiv (frak(L)(t, t) arrow not frak(L)(t, t)) and (not frak(L)(t, t) arrow frak(L)(t, t))   &&space#say[by _bicond. dis._] \
                                                  &equiv (not frak(L)(t, t) or not frak(L)(t, t)) and (not not frak(L)(t, t) or frak(L)(t, t)) &&space#say[by _cond. dis._] \
                                                  &equiv (not frak(L)(t, t) or not frak(L)(t, t)) and (frak(L)(t, t) or frak(L)(t, t))         &&space#say[by _double neg._] \
                                                  &equiv not frak(L)(t, t) and frak(L)(t, t)                                                   &&space#say[by _idemp._] \
                                                  &equiv bot                                                                                   &&space#say[by _compl._]
      $
      Therefore, $bot$, which is equivalent to $not top$ thanks to _Corollary 1.1_ from the lecture notes.
      However, $top$ by _problem 2.c._ from _Problem Set 1._
      #contradiction

      Therefore, $not exists x forall y (frak(L)(x, y) arrow.l.r not frak(L)(y, y))$ by _reductio ad absurdum._
    ]

3. Consider a universe of discourse consisting of the natural number
  and define the predicate $pi(x) := #sentence[$x$ is a prime number.]$
  Let $phi$ be the statement $phi arrow forall x (pi(x))$.#marginalis[
    This is an example of a #define[Curry sentence]_,_ named after mathematician and computer scientist Haskell Curry.
  ]

  We will prove that 4 is prime lmao.

  #proof(qedbreak: true)[
    The first thing we will do is prove $phi$.
    Recall that $phi$ is defined to be the statement $phi arrow forall x (pi(x))$, which is a _conditional_ statement.
    In order to prove this, we will set up a use of the _deduction rule._

    Assume $phi$.
    By definition, this means we know $phi arrow forall x (pi(x))$.
    Now, by applying _modus ponens,_ we have $forall x (pi(x))$.
    Therefore, we know $phi proves forall x (pi(x))$ by definition.
    So, $phi arrow forall x (pi(x))$ by the _deduction rule._
    This means we have proven $phi$ by definition.

    Okay, now we know $phi$.
    By definition, this means we know $phi arrow forall x (pi(x))$.
    Then, by _modus ponens,_ we can say that $forall x (pi(x))$.
    As a result, by _universal elimination,_ we assert $pi(4)$, which says precisely that 4 is a prime number, concluding our proof.
  ]
