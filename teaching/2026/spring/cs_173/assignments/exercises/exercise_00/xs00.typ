#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "exoterica",
  number: 0,
  date: datetime(year: 2026, month: 02, day: 02),
)

// We will work up to a proof of
// $forall x (phi(x)) equiv not exists x (not phi(x))$
// and
// $exists x (phi(x)) equiv not forall x (not phi(x))$.

1. Let $phi$ be a unary predicate.

  + We will show that $exists x (not phi(x)) proves not forall x (phi(x))$.
    #proof[
      Assume $exists x (not phi(x))$.
      We then know that $not phi(t)$ for some $t$ by _existential elimination._
      Towards a contradiction, assume $not not forall x (phi(x))$, which is equivalent to $forall x (phi(x))$ by the _double negation_ theorem.
      Then, by _universal elimination,_ we know $phi(t)$.
      However, this contradicts our earlier result $not phi(t)$.
      #contradiction

      Therefore, we have $not forall x (phi(x))$ by _reductio ad absurdum._
    ]

  + We will show that $forall x (not phi(x)) proves not exists x (phi(x))$.
    #proof[
      Assume $forall x (not phi(x))$.
      Towards a contradiction, assume $not not exists x (phi(x))$, which is equivalent to $exists x (phi(x))$ by the _double negation_ theorem.
      We can then say $phi(t)$ for some $t$ by _existential elimination._
      Now, applying _universal elimination_ to our original assumption yields $not phi(t)$, contradicting $phi(t)$.
      #contradiction

      Therefore, we can conclude $not exists x (phi(x))$ by _reductio ad absurdum._
    ]

2. Let $phi$ be a unary predicate.

  + We will show that $not exists x (phi(x)) proves forall x (not phi(x))$.
    #proof[
      Assume $not exists x (phi(x))$.
      Let $t$ be a term.
      Towards a contradiction, assume $not not phi(t)$, which is equivalent to $phi(t)$ by the _double negation_ theorem.
      By _existential introduction,_ we then know $exists x (phi(x))$.
      However, this contradicts our assumption that $not exists x (phi(x))$.
      #contradiction
      Thus, by _reductio ad absurdum,_ we have $not phi(t)$.

      Therefore, we can conclude $forall x (not phi(x))$ by _universal introduction._#marginalis[
        This is because we proved $not phi(t)$, and we introduced $t$ as an _*arbitrary* term._
      ]
    ]

  + We will show that $not forall x (phi(x)) proves exists x (not phi(x))$.
    #proof[
      Assume $not forall x (phi(x))$.
      Towards a contradiction, assume $not exists x (not phi(x))$.
      By the previous problem, this implies $forall x (not phi(x))$, clearly contradicting the assumption we just made.
      #contradiction

      Therefore, we conclude that $exists x (not phi(x))$ as desired.
    ]

3. Let $phi$ be a unary predicate and let $psi$ be a proposition.

  + We will show that $forall x (phi(x) arrow psi) proves exists x (phi(x)) arrow psi$.
    #proof[
      Assume $forall x (phi(x) arrow psi)$.
      Towards a contradiction, assume that we know $not (exists x (phi(x)) arrow psi)$.
      Observe the following deduction.
      $
        not (exists x (phi(x)) arrow psi) &equiv not (not exists x (phi(x)) or psi) &&wide#say[by _conditional disintegration_]\
                                          &equiv not not exists x (phi(x)) and not psi &&wide#say[by _De Morgan's laws_] \
                                          &equiv exists x (phi(x)) and not psi &&wide#say[by _double negation_] \
      $
      From this, we can derive $exists x (phi(x))$ and $not psi$ by _conjunction elimination._
      By _existential elimination,_ we can now assert $phi(t)$ for some $t$.
      Recall that $forall x (phi(x) arrow psi)$.
      By applying _universal elimination,_ we obtain $phi(t) arrow psi$.
      We then know $psi$ by _modus ponens,_ contradicting our prior result $not psi$.
      #contradiction

      Therefore, we conclude $exists x (phi(x)) arrow psi$ by _reductio ad absurdum._
    ]

  + We will show that $exists x (phi(x)) arrow psi proves forall x (phi(x) arrow psi)$.
    #proof[
      Assume $exists x (phi(x)) arrow psi$.
      We know this is equivalent to $not exists x (phi(x)) or psi$ by _conditional disintegration._
      We now have two cases.#marginalis[
        We are setting up a use of the _disjunction elimination_ theorem from #mono[PS02].
        This theorem is also known as _*proof by cases*._
      ]

      #case[
        Suppose that $not exists x (phi(x))$.
        Then, by problem 2.a., we know $forall x (not phi(x))$.
        Towards a contradiction, assume $not forall x (phi(x) arrow psi)$.
        By problem 2.b., we then get $exists x (not (phi(x) arrow psi))$.
        We can now observe the following.
        $
          exists x (not (phi(x) arrow psi)) &equiv exists x (not (not phi(x) or psi)) &&wide#say[by _conditional disintegration_] \
                                            &equiv exists x (not not phi(x) and not psi) &&wide#say[by _De Morgan's laws_] \
                                            &equiv exists x (phi(x) and not psi) &&wide#say[by _double negation_]
        $
        We then know $phi(t) and not psi$ by _existential elimination,_ which implies $phi(t)$ by _conjunction elimination._
        Now, recalling that $forall x (not phi(x))$, we know $not phi(t)$ by _universal elimination._
        #contradiction

        Therefore, $forall x (phi(x) arrow psi)$ by _reductio ad absurdum._
      ]

      #case[
        Suppose $psi$.
        Let $t$ be an arbitrary term.
        We can then say $phi or not phi(t)$ by _disjunction introduction,_ which is equivalent to $not phi(t) or psi$ by _commutativity._
        This is then equivalent to $phi(t) arrow psi$ by _conditional disintegration._
        Thus, $forall x (phi(x) arrow psi)$ by _universal introduction._
      ]

      Since we were able to show that $not exists x (phi(x)) proves forall x (phi(x) arrow psi)$, and we also showed that $psi proves forall x (phi(x) arrow psi)$, and since we know $not exists x (phi(x)) or psi$, we can apply _disjunction elimination_ and conclude $forall x (phi(x) arrow psi)$ as desired.
    ]
