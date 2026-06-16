#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 5,
  date: datetime(year: 2026, month: 03, day: 23),
)

1. We will show $(forall x in NN)(forall y (y in x implies forall z (z in y implies z in x)))$.
  #proof[
    We proceed by _weak induction._
    #case-basis[
      Let $y$ be a set, and suppose $y in 0$, which means $y in emptyset$ by definition.
      Recall that $y in.not emptyset$ because $forall w (w in.not emptyset)$.
      Therefore, we conclude $forall z (z in y implies z in 0)$ as desired by applying the _principle of explosion._
    ]
    #case-inductive[
      Let $k in NN$, and assume $forall y (y in k implies forall z (z in y implies z in k))$.
      #marginalis[_inductive hypothesis_]
      Now, let $y$ be a set and suppose that $y in suc(k)$, so that $y in k union {k}$ by definition.
      This implies that $y in k$ or $y in {k}$, so we will take two cases.
      #marginalis[
        In either case, we now want $forall z (z in y implies z in suc(k))$ to be shown.
      ]
      #case[
        Suppose that $y in k$.
        Let $z$ be a set such that $z in y$,
        and observe $z in k$ by the _inductive hypothesis._
        This implies $z in k or z in {k}$,
        showing us $z in k union {k}$,
        from which we can conclude $z in suc(k)$ by definition.
        // Then, by the _inductive hypothesis,_ we know that $forall z $
      ]
      #case[
        Suppose $y in {k}$, so that $y = k$.
        Let $z$ be a set and assume $z in y$.
        Then, we have that $z in k$ because $y = k$.
        #marginalis[
          By the _axiom of extensionality._
        ]
        From this, we can see $z in k or z in {k}$,
        so that $z in k union {k}$,
        implying that $z in suc(k)$ by definition.
      ]
      Thus, we have $forall z (z in y implies z in suc(k))$ as desired.
    ]
    Therefore, we can conclude $(forall x in NN)(forall y (y in x implies forall z (z in y implies z in x)))$.
  ]

2. We will work up to a proof that addition on $NN$ is commutative.

  + We will show $(forall x, y in NN)(suc(x + y) = suc(x) + y)$.
    #proof[
      Let $x in NN$. \
      We will prove $(forall y in NN)(suc(x + y) = suc(x) + y)$ by _weak induction._
      #case-basis[
        Observe $suc(x + 0) = suc(x) = suc(x) + 0$ by the definition of addition.
      ]
      #case-inductive[
        Let $k in NN$, and assume that $suc(x + k) = suc(x) + k$.
        #marginalis[_inductive hypothesis_]
        Observe the following.
        $
          suc(x + suc(k)) & = suc(suc(x + k)) && quad #say[by definition of addition] \
                          & = suc(suc(x) + k) && quad #say[by the _inductive hypothesis_] \
                          & = suc(x) + suc(k) && quad #say[by definition of addition] \
        $
        Thus, we have $suc(x + suc(k)) = suc(x) + suc(k)$ as desired.
      ]
      Therefore, we can conclude $(forall y in NN)(suc(x + y) = suc(x) + y)$.
    ]

  + We will show $(forall x, y in NN)(x + y = y + x)$.
    #proof[
      Let $x in NN$.
      We will prove $(forall y in NN)(x + y = y + x)$ by _weak induction._
      #case-basis[
        Observe that $x + 0 = x$ by the definition of addition.
        Further, $x = 0 + x$ because $(forall z in NN)(z = 0 + z)$.
        Thus, $x + 0 = 0 + x$.
      ]
      #case-inductive[
        Let $k in NN$, and assume that $x + k = k + x$.
        #marginalis[_inductive hypothesis_]
        Now, observe the following.
        $
          x + suc(k) & = suc(x + k) && quad #say[by definition of addition] \
                     & = suc(k + x) && quad #say[by the _inductive hypothesis_] \
                     & = suc(k) + x && quad #say[by _problem 2.a._] \
        $
        Thus, we have that $x + suc(k) = suc(k) + x$ as needed.
      ]
      Therefore, we can conclude $(forall y in NN)(x + y = y + x)$.
    ]

3. We will show $(forall x, y in NN)(x lt y implies (exists n in NN)(x + n = y))$.
  #proof[
    Let $x in NN$. \
    We will show $(forall y in NN)(x lt y implies (exists n in NN)(x + n = y))$ by _weak induction._
    #case-basis[
      Suppose that $x lt 0$, so that $x lt emptyset$, which implies $x in emptyset$ by definition.
      Recall that $x in.not emptyset$ because $(forall w in emptyset)(w in.not emptyset)$.
      We then deduce $(exists n in NN)(x + n = 0)$ by the _principle of explosion._
    ]
    #case-inductive[
      Let $k in NN$, and suppose that $x lt k implies (exists n in NN)(x + n = y)$.
      #marginalis[_inductive hypothesis_]
      Now, assume that $x lt suc(k)$ and observe the implications that follow from this assumption.
      $
        x lt suc(k) & implies x in suc(k)            && quad #say[by definition of] lt #say[on] NN \
                    & implies x in k union {k}       && quad #say[by definition of] suc(square.stroked.dotted) \
                    & implies (x in k) or (x in {k}) && quad #say[by definition of] union \
                    & implies (x in k) or (x = k)    && quad #say[by definition of set roster notation] \
                    & implies (x lt k) or (x = k)    && quad #say[by definition of] lt #say[on] NN \
      $
      We can now take two cases.
      #case[
        Suppose $x lt k$.
        Then, we can apply the _inductive hypothesis_ to see that there exists $m in NN$ such that $x + m = k$.
        We can now sit back and watch.
        $
          x + m = k & implies suc(x + m) = suc(k) \
                    & implies (x + m) + 1 = suc(k) && quad #say[since] (forall w in NN)(suc(w) = w + 1) \
                    & implies x + (m + 1) = suc(k) && quad #say[by associativity of addition] \
        $
        Since $m in NN$, we know that $m + 1 in NN$.
        Thus, $(exists n in NN)(x + n = suc(k))$.
      ]
      #case[
        Suppose $x = k$, so that $x + 1 = k + 1$.
        Recalling that $suc(k) = k + 1$, it should then be clear that $x + 1 = suc(k)$.
        If we then notice that $1 in NN$, we obtain $(exists n in NN)(x + n = suc(k))$ as we had hoped.
      ]
      In either case, we have $(exists n in NN)(x + n = suc(k))$.
    ]
    Therefore, we can conclude that $(forall y in NN)(x lt y implies (exists n in NN)(x + n = y))$.
  ]

4. We will prove $(forall x, y, z in NN)(x dot (y + z) = (x dot y) + (x dot z))$.
  #proof[
    Let $x in NN$ and $y in NN$. \
    We will show that $(forall z in NN)(x dot (y + z) = (x dot y) + (x dot z))$ by _weak induction._
    #case-basis[
      Observe the following.
      $
        x dot (y + 0) & = x dot y && quad #say[by definition of addition] \
                      & = (x dot y) + 0 && quad #say[by definition of addition] \
                      & = (x dot y) + (x dot 0) && quad #say[by definition of multiplication] \
      $
    ]
    #case-inductive[
      Let $k in NN$, and assume $x dot (y + k) = (x dot y) + (x dot k)$.
      #marginalis[_inductive hypothesis_]
      We can now observe.
      $
        x dot (y + suc(k)) & = x dot suc(y + k)            && quad #say[by definition of addition] \
                           & = (x dot (y + k)) + x         && quad #say[by definition of multiplication] \
                           & = ((x dot y) + (x dot k)) + x && quad #say[by the _inductive hypothesis_] \
                           & = (x dot y) + ((x dot k) + x) && quad #say[by associativity of addition] \
                           & = (x dot y) + (x dot suc(k))  && quad #say[by definition of multiplication] \
      $
      Thus, we have that $x dot (y + suc(k)) = (x dot y) + (x dot suc(k))$ as required.
    ]
    Therefore, we can conclude that $(forall z in NN)(x dot (y + z) = (x dot y) + (x dot z))$.
  ]

5. We will show that $(forall n in NN)(1 + sum_(i = 0)^(n) 2^i = 2^(n + 1))$.
  #proof[
    We proceed by _weak induction._
    #case-basis[
      The sequence of equalities below must follow.
      $
        1 + sum_(i = 0)^(0) 2^i & = 1 + 2^0    && quad #say[by definition of] sum \
                                & = 1 + 1      && quad #say[by definition of exponentiation] \
      $
      // #colbreak()
      On the other hand, we can not refute the following sequence of equalities.
      $
        2^(0 + 1) & = 2^1                 && quad #say[because] (forall w in NN)(0 + w = w) \
                  & = 2^(suc(0))          && quad #say[by definition of] 1 \
                  & = 2^0 dot 2           && quad #say[by definition of exponentiation] \
                  & = 1 dot 2             && quad #say[by definition of exponentiation] \
                  & = 1 dot suc(1)        && quad #say[by definition of] 2 \
                  & = (1 dot 1) + 1       && quad #say[by definition of multiplication] \
                  & = (1 dot suc(0)) + 1  && quad #say[by definition of] 1 \
                  & = ((1 dot 0) + 1) + 1 && quad #say[by definition of multiplication] \
                  & = (0 + 1) + 1         && quad #say[by definition of multiplication] \
                  & = 1 + 1               && quad #say[because] (forall w in NN)(0 + w = w) \
      $
      We hence realize that $1 + sum_(i = 0)^(0) 2^i = 1 + 1 = 2^(0 + 1)$.
    ]
    #case-inductive[
      Let $k in NN$, and assume $1 + sum_(i = 0)^(k) 2^i = 2^(k + 1)$.
      #marginalis[_inductive hypothesis_]
      Now, watch _this._
      $
        1 + sum_(i = 0)^(suc(k)) 2^i & = 1 + ((sum_(i = 0)^(k) 2^i) + 2^(suc(k)))
                                      && quad #say[by definition of] sum \
                                     & = (1 + (sum_(i = 0)^(k) 2^i)) + 2^(suc(k))
                                      && quad #say[by associativity of addition] \
                                     & = 2^(k + 1) + 2^(suc(k))
                                      && quad #say[by the _inductive hypothesis_] \
                                     & = 2^(suc(k)) + 2^(suc(k))
                                      && quad #say[since] (forall w in NN)(suc(w) = w + 1) \
                                     & = (2^k dot 2) + (2^k dot 2)
                                      && quad #say[by definition of exponentiation] \
                                     & = 2^k dot (2 + 2)
                                      && quad #say[by distributivity of] dot #say[over] + \
                                     & = 2^k dot ((0 + 2) + 2)
                                      && quad #say[because] (forall w in NN)(0 + w = w) \
                                     & = 2^k dot (((2 dot 0) + 2) + 2)
                                      && quad #say[by definition of multiplication] \
                                     & = 2^k dot ((2 dot suc(0)) + 2)
                                      && quad #say[by definition of multiplication] \
                                     & = 2^k dot ((2 dot 1) + 2)
                                      && quad #say[by definition of] 1 \
                                     & = 2^k dot (2 dot suc(1))
                                      && quad #say[by definition of multiplication] \
                                     & = 2^k dot (2 dot 2)
                                      && quad #say[by definition of] 2 \
                                     & = (2^k dot 2) dot 2
                                      && quad #say[by associativity of multiplication] \
                                     & = 2^(suc(k)) dot 2
                                      && quad #say[by definition of exponentiation] \
                                     & = 2^(suc(suc(k)))
                                      && quad #say[by definition of exponentiation] \
                                     & = 2^(suc(k) + 1)
                                      && quad #say[since] (forall w in NN)(suc(w) = w + 1) \
      $
      We thus finally obtain the desired result that $1 + sum_(i = 0)^(suc(k)) = 2^(suc(k) + 1)$.
    ]
    Therefore, we can conclude that $(forall n in NN)(1 + sum_(i = 0)^(n) 2^i = 2^(n + 1))$.
  ]
