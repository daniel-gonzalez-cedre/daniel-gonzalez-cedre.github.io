#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 4,
  date: datetime(year: 2026, month: 02, day: 24),
)

1. 

  + We will prove $forall x forall y (PP(x) union PP(y) subset PP(x union y))$.
    #proof[
      Let $x$ and $y$ be sets.
      Let $t$ be a set and assume $t in PP(x) union PP(y)$.
      By definition, this means $t in PP(x)$ or $t in PP(y)$,
      which implies $t subset x$ or $t subset y$ by definition.
      #case[
        Suppose $t subset x$.
        We then know $t subset x union y$,
        #marginalis[
          _Problem 1.c._ on _problem set 3._
        ]
        so that $t in PP(x union y)$ by definition.
      ]
      #case[
        Suppose $t subset y$, so that $t subset y union x$.
        #marginalis[
          _Problem 1.c._ on _problem set 3._
        ]
        Since $forall z (z in x or z in y iff z in y or z in x)$,
        we know $y union x = x union y$ by the _axiom of extensionality._
        This implies $t subset x union y$,
        so that $t in PP(x union y)$ by definition.
      ]
    ]

  + We will prove $exists x exists y (PP(x) union PP(y) eq.not PP(x union y))$.
    #proof[
      // Let $x := {emptyset}$ and $y := {{emptyset}}$
      Recall that we proved $emptyset$ exists.
      By the _axiom of pairing,_ we know ${emptyset, emptyset}$ exists,
      and ${emptyset, emptyset} = {emptyset}$ by the _axiom of extensionality._
      Similarly, the _axiom of pairing_ tells us ${{emptyset}, {emptyset}}$ exists,
      and ${{emptyset}, {emptyset}} = {{emptyset}}$ follows from the _axiom of extensionality._
      Let $x := {emptyset}$ and $y := {{emptyset}}$.
      For any set $t$, we can see the following:

      // $
      //   t in {emptyset} &iff t = emptyset \
      //                   &iff t 
      // $

      $
        t in {emptyset, {emptyset}} &iff t = emptyset or t = {emptyset}       &&quad #say[by definition] \
                                    &iff t in {emptyset} or t in {{emptyset}} &&quad #say[by definition] \
                                    &iff t in x union y                       &&quad #say[by definition]
      $

      Since we know $x union y subset x union y$,
      #marginalis[_Lemma 3.1_ from _clavicula 3._]
      this implies ${emptyset, {emptyset}} in PP(x union y)$ by definition.
      However, notice that $emptyset in.not y$ because $emptyset eq.not {emptyset}$ by the _axiom of extensionality._
      This implies ${emptyset, {emptyset}} subset.not y$.
      // Similarly, since ${emptyset} eq.not emptyset$, we can see ${emptyset, {emptyset}} subset.not x$.
      // We can now observe the following.
      $
        emptyset eq.not {emptyset} &implies {emptyset} in.not {emptyset} and emptyset in.not {{emptyset}} &&space #say[by def.~of _set roster notation_] \
                                   &implies {emptyset} in.not x and emptyset in.not y &&space #say[by def.~of] x #say[and] y \
                                   &implies {emptyset, {emptyset}} subset.not x and {emptyset, {emptyset}} subset.not y &&space #say[by def.~of] subset \
                                   // &implies not ({emptyset, {emptyset}} in PP(x) or {emptyset, {emptyset}} in PP(y)) \
                                   &implies {emptyset, {emptyset}} in.not PP(x) union PP(y) &&space #say[by def.~of] PP(dot.c)
      $
      Therefore, we conclude $PP(x) union PP(y) eq.not PP(x union y)$ by the _axiom of extensionality._
    ]

  + We will prove $forall x forall y (x inter y = y implies y in PP(x))$.
    #proof[
      Let $x$ and $y$ be sets, and assume $x inter y = y$.
      Let $t$ be a set such that $t in y$.
      Then, by the _axiom of extensionality,_ we know $t in x inter y$, implying $t in x and t in y$ by definition.
      From this, we can see $t in x$.
      Thus, $y subset x$ by definition, from which we immediately see $y in PP(x)$ follows by definition.
    ]

    #colbreak()

  + We will prove $forall x forall y (y in PP(x) implies x inter y = y)$.
    #proof[
      Let $x$ and $y$ be sets, and assume $y in PP(x)$.
      This means $y subset x$ by definition.
      We will now show that $y subset x inter y$.
      Let $t$ be a set, and assume $t in y$.
      Then, since $y subset x$, we know $t in x$ by definition.
      This implies $t in x and t in y$, so that $t in x inter y$ by definition.
      Therefore, $y subset x inter y$ by definition.
      Since we also know $x inter y subset y$,
      #marginalis[
        _Problem 1.b._ on _problem set 3._
      ]
      we can conclude $x inter y = y$.
      #marginalis[
        _Theorem 2.1_ from _clavicula 2._
      ]
    ]

2. 

  + We will prove that $forall x ( ( ( x union {x} ) without {x} ) = x )$.
    #proof[
      Let $x$ be an arbitrary set.
      Let $t$ be an arbitrary set.
      #fragment(name: "Forwards")[
        Suppose $t in (x union {x}) without {x}$,
        so that $t in x union {x}$ and $t in.not {x}$ by definition.
        From our first assumption, we can see $t in x or t in {x}$ by definition.
        Using our second assumption, we derive $t in x$.
        #marginalis[This is an application of the _disjunctive syllogism._]
        // Notice the following consequences of these assumptions.
        // $
        //   t in x union {x} &implies t in x or t in {x} &&quad #say[by definition] \
        //   t in.not {x}     &implies t eq.not x         &&quad #say[by definition]
        // $
      ]
      #fragment(name: "Backwards")[
        Suppose $t in x$, which implies $t in x or t in {x}$, so $t in x union {x}$ by definition.
        Recalling that $forall w (w in.not w)$,
        #marginalis[_Theorem 5.1_ from _clavicula 5._]
        we can see $t eq.not x$ from our assumption $t in x$.
        Therefore, $t in (x union {x}) without {x}$ by definition.
      ]
      Therefore, $(x union {x}) without {x} = x$ by the _axiom of extensionality._
    ]

  + We will prove that $x symdif y = ( x union y ) without ( x inter y )$ for all sets $x$ and $y$.
    #proof[
      Let $x$ and $y$ be sets.
      Let $t$ be an arbitrary set and observe the following.
      $
        t in x symdif y &iff t in (x without y) union (y without x)               &&quad #say[by definition] \
                        &iff t in {z st (z in x without y) or (z in y without x)} &&quad #say[by definition] \
                        &iff t in {z st (z in x and z in.not y) or (z in y and z in.not x)} &&quad #say[by definition]\
                        &iff t in {z st (z in x or z in y) and (z in.not x or z in.not y)} \
                        &iff t in {z st (z in x or z in y) and not (z in x and z in y)} \
                        &iff t in {z st (z in x union y) and (z in.not x inter y)} &&quad #say[by definition] \
                        &iff t in (x union y) without (x inter y) &&quad #say[by definition]
      $
      Therefore, $x symdif y = (x union y) without (x inter y)$ by the _axiom of extensionality._
    ]

3. 

  + We will show that $forall x (x eq.not x union {x})$.
    #proof[
      Let $x$ be a set.
      Towards a contradiction, suppose $x = x union {x}$.
      Recall that $x in {x}$, so $x in x union {x}$ by definition.
      This implies that $x in x$ by the _axiom of extensionality._
      However, we know $forall w (w in.not w)$.
      #marginalis[_Theorem 5.1_ from _clavicula 5._]
      #contradiction
      Therefore, $x eq.not x union {x}$.
    ]

  + We will show that $forall x forall y ( x eq.not y implies x union {x} eq.not y union {y} )$.
    #proof[
      Let $x$ and $y$ be sets such that $x eq.not y$.
      Towards a contradiction, suppose that $x union {x} = y union {y}$.
      Notice that $x in {x}$ by definition and observe.
      $
        x in {x} &implies x in x or x in {x}             &&quad#say[by _disjunction introduction_] \
                 &implies x in {z st z in x or z in {x}} &&quad#say[by definition] \
                 &implies x in x union {x}               &&quad#say[by definition] \
                 // &implies x in y union {y}               &&quad#say[because $x union {x} = y union {y}$] \
                 &implies x in y union {y}               &&quad#say[by the _axiom of extensionality_] \
                 &implies x in {z st z in y or z in {y}} &&quad#say[by definition] \
                 &implies x in y or x in {y}             &&quad#say[by definition] \
                 &implies x in y or x = y                &&quad#say[by definition] \
                 &implies x in y                         &&quad#say[because ] x eq.not y
      $
      This sequence of implications forces us to infer that $x in y$.
      If we also notice that $y in {y}$ by definition, we are compelled to draw a similar conclusion about $y$.
      $
        y in {y} &implies y in y or y in {y}             &&quad#say[by _disjunction introduction_] \
                 &implies y in {z st z in y or z in {y}} &&quad#say[by definition] \
                 &implies y in y union {y}               &&quad#say[by definition] \
                 // &implies x in y union {y}               &&quad#say[because $x union {x} = y union {y}$] \
                 &implies y in x union {x}               &&quad#say[by the _axiom of extensionality_] \
                 &implies y in {z st z in x or z in {x}} &&quad#say[by definition] \
                 &implies y in x or x in {x}             &&quad#say[by definition] \
                 &implies y in x or y = x                &&quad#say[by definition] \
                 &implies y in x                         &&quad#say[because ] x eq.not y
      $
      So now we have both $x in y$ and $y in x$.
      However, we also happen to know $forall a forall b (a in b implies b in.not a)$,
      #marginalis[_Theorem 5.2_ from _clavicula 5._]
      which we proved using the _axiom of regularity._
      #contradiction

      Therefore, $x union {x} eq.not y union {y}$.
    ]

4. We will show that the Cartesian product of any two sets exists.
  To be clear, we will prove the formal sentence $forall x forall y exists z (z = x times y)$.
  #proof[
    Let $X$ and $Y$ be sets.
    Recall that $X union Y$ exists.
    #marginalis[
      _Theorem 4.1_ from _clavicula 4._
    ]
    We can then apply the _axiom of power_ to see $PP(X union Y)$ exists;
    applying this axiom again shows us $PP(PP(X union Y))$ exists.
    Now, by the _axiom schema of separation,_ the set $frak(P)$ shown below exists.
    $
      frak(P) = {z st z in PP(PP(X union Y)) and exists x exists y (x in X and y in Y and z = (x, y))}
    $
    We will prove $frak(P) = X times Y$ by setting up an invocation of _extensionality._
    Let $t$ be a set.
    #fragment(name: "Forwards")[
      Suppose $t in frak(P)$.
      This means $t in PP(PP(X union Y))$ and that there exist sets $x$ and $y$ such that
      $x in X$ and $y in Y$ and $t = (x, y)$.
      However, this means precisely that $t in {(a, b) st a in X and b in Y}$,
      so $t in X times Y$ by definition.
    ]
    #fragment(name: "Backwards")[
      Suppose $t in X times Y$, so that $t = (x, y)$ for some $x in X$ and $y in Y$.
      Recall, by definition, $t = (x, y) = {{x}, {x, y}}$.
      We have the following inference by definition.
      $
        x in X implies {x} subset X
               implies {x} in PP(X)
      $
      Below, we derive an analogous inference to the one above; please observe.
      $
        x in X and y in Y &implies (x in X union Y) and (y in X union y) \
                          &implies {x, y} subset X union Y &&quad #say[by definition] \
                          &implies {x, y} in PP(X union Y) &&quad #say[by definition]
      $
      Therefore, ${{x}, {x, y}} subset PP(X union Y)$ by definition.
      This leads us to the important realization that ${{x}, {x, y}} in PP(PP(X union Y))$ by definition,
      which implies that $t in PP(PP(X union Y))$.
      Since we knew that $exists a exists b (a in X and b in Y and t = (a, b))$ already,
      we can now conclude $t in frak(P)$ by definition.
    ]
    Therefore, by the _axiom of extensionality,_ we utter $frak(P) = X times Y$ and rest.
  ]
