#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 1,
  date: datetime(year: 2026, month: 02, day: 01),
)

#let fake-label(name) = place[#figure(supplement: [problem])[]#label(name)]

1. 
  + We will prove $p arrow p$ is a tautology for any proposition $p$.
    #fake-label("1.a.")
    #proof[
      Let $p$ be a proposition.
      Observe the following.
      $
        p arrow p &equiv not p or p &&wide#say[by _conditional disintegration_] \
                  &equiv top        &&wide#say[by _complement_]
      $
      Therefore, $p arrow p equiv top$, which means $p arrow p$ is a tautology by definition.
    ]

  + We will prove $p arrow q equiv not q arrow not p$ for all propositions $p$ and $q$.
    #proof[
      Let $p$ and $q$ be propositions.
      Bear witness to the reasoning below.
      $
        p arrow q &equiv not p or q         &&wide#say[by _conditional disintegration_] \
                  &equiv q or not p         &&wide#say[by _commutativity_] \
                  &equiv not not q or not p &&wide#say[by _double negation_] \
                  &equiv not q arrow not p  &&wide#say[by _conditional disintegration_]
      $
      Therefore, we have $p arrow q equiv not q arrow not p$ as desired.
    ]

  + We will prove $not (p arrow q) equiv p and not q$ for all propositions $p$ and $q$.
    #proof[
      Let $p$ and $q$ be propositions.
      We should now turn our gaze below.
      $
        not (p arrow q) &equiv not (not p or q)    &&wide#say[by _conditional disintegration_] \
                        &equiv not not p and not q &&wide#say[by _De Morgan's laws_] \
                        &equiv p and not q         &&wide#say[by _double negation_]
      $
      Therefore, we can conclude $not (p arrow q) equiv p and not q$.
    ]

    // #colbreak()

  + We show $(p and (p arrow q)) arrow q$ is a tautology for all propositions $p$ and $q$.
    #proof[
      Let $p$ and $q$ be propositions.
      We are now compelled to observe.
      #show math.equation: set block(breakable: true)
      $
        (p and (p arrow q)) arrow q &equiv not (p and (not p or q)) or q            &&quad#say[by _conditional disintr._] \
                                    &equiv (not p or not (not p or q)) or q         &&quad#say[by _De Morgan's laws_] \
                                    &equiv (not p or (not not p and not q)) or q    &&quad#say[by _De Morgan's laws_] \
                                    &equiv (not p or (p and not q)) or q            &&quad#say[by _double negation_] \
                                    &equiv ((not p or p) and (not p or not q)) or q &&quad#say[by _distributivity_] \
                                    &equiv (top and (not p or not q)) or q          &&quad#say[by _complement_] \
                                    &equiv (not p or not q) or q                    &&quad#say[by _identity_] \
                                    &equiv not p or (not q or q)                    &&quad#say[by _associativity_] \
                                    &equiv not p or top                             &&quad#say[by _complement_] \
                                    &equiv top or not p                             &&quad#say[by _commutativity_] \
                                    &equiv top                                      &&quad#say[by _domination_]
      $
      Therefore, we are forced to admit that $(p and (p arrow q)) arrow q$ is a tautology.
    ]

  + We prove $(p or q) arrow r equiv (p arrow r) and (q arrow r)$ for all propositions $p$, $q$, and $r$.
    #proof[
      Let $p$, $q$, and $r$ be propositions.
      Look.
      $
        (p or q) arrow r &equiv not (p or q) or r             &&wide#say[by _conditional disintegration_] \
                         &equiv (not p and not q) or r        &&wide#say[by _De Morgan's laws_] \
                         &equiv r or (not p and not q)        &&wide#say[by _commutativity_] \
                         &equiv (r or not p) and (r or not q) &&wide#say[by _distributivity_] \
                         &equiv (not p or r) and (not q or r) &&wide#say[by _commutativity_] \
                         &equiv (p arrow r) and (q arrow r)   &&wide#say[by _conditional disintegration_]
      $
      As such, $(p or q) arrow r equiv (p arrow r) and (q arrow r)$ as desired.
    ]

2. #counter(figure).step()
  + We will show $(phi arrow psi), (psi arrow xi) proves phi arrow xi$ for all propositions $phi$, $psi$, and $xi$.
    #fake-label("2.a.")
    #proof[
      Let $phi$, $psi$, and $xi$ be propositions.
      Assume $phi arrow psi$ and $psi arrow xi$.#marginale[
        We would like to prove that $phi arrow xi$.
        In order to do this, we will set up a use of the _deduction rule_ by first proving that $phi proves xi$.
      ]

      Assume $phi$.
      Recall that $phi arrow psi$.
      We can then derive $psi$ by _modus ponens._
      Because we know $psi arrow xi$, we can again apply _modus ponens_ to obtain $xi$.

      Since we were able to prove $xi$ by assuming $phi$, we can say that $phi proves xi$.
      Therefore, by the _deduction rule,_ we conclude $phi arrow xi$.
    ]

  + We will prove $proves phi arrow phi$ for any proposition $phi$.
    #fake-label("2.b.")
    #proof[
      Let $phi$ be a proposition.
      Assume $phi$.#marginale[
        In order to prove $phi arrow phi$, we will set up a use of the _deduction rule_ by first proving $phi proves phi$.
        In order to show $phi proves phi$, we need to assume $phi$ and then derive $phi$ as a consequence.
      ]
      Lo, behold, we now know $phi$.
      Thus, we have $phi proves phi$.
      The _deduction rule_ therefore produces $phi arrow phi$.
    ]

  + We will prove $proves top$.
    #fake-label("2.c.")
    #proof[
      From #link(<2.b.>)[_problem 2.b._]_,_ we know that $top arrow top$.
      Notice that $top arrow top equiv top$ from #link(<1.a.>)[_problem 1.a._]
      Therefore, we have $top$ as desired.
    ]

  + We will prove $phi, psi proves phi and psi$ for all propositions $phi$ and $psi$.
    #fake-label("2.d.")
    #proof[
      Let $phi$ and $psi$ be propositions.
      Assume $phi$, and also assume $psi$.

      Towards a contradiction, suppose $not (phi and psi)$.
      Observe the following.
      $
        not (phi and psi) &equiv not phi or not psi &&wide#say[by _De Morgan's laws_] \
                          &equiv phi arrow not psi  &&wide#say[by _conditional disintegration_]
      $
      We thus have $phi arrow not psi$.
      Recalling $phi$, we obtain $not psi$ by _modus ponens._
      However, this contradicts $psi$.
      #contradiction

      Since $not (phi and psi) proves psi$ and $not (phi and psi) proves not psi$, we can apply _reductio ad absurdum_ to conclude $phi and psi$.
    ]

  + We will prove $phi and psi proves phi$ for all propositions $phi$ and $psi$.
    #proof[
      Let $phi$ and $psi$ be propositions, and assume $phi and psi$.

      Towards a contradiction, assume $not phi$.
      Recalling that $phi and psi$, we can apply _Conjunction Introduction_#marginalis[
        This is the name of the theorem that was proven in #link(<2.d.>)[_problem 2.d._]
      ] to obtain $not phi and (phi and psi)$.
      Now, observe the following deduction.
      $
        not phi and (phi and psi) &equiv (not phi and phi) and psi &&wide#say[by _associativity_] \
                                  &equiv bot and psi               &&wide#say[by _complement_] \
                                  &equiv bot                       &&wide#say[by _domination_]
      $
      Thus, we now know $bot$.
      Since we know $bot equiv not top$,#marginalis[
        This theorem was proven during lecture.
      ] we can now say $not top$.
      However, this contradicts $top$, which we get from #link(<2.c.>)[_problem 2.c._]
      #contradiction

      Therefore, since we saw that $not phi proves top$ and $not phi proves not top$, we can apply _reductio ad absurdum_ to conclude $phi$ as desired.
    ]
