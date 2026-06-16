#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 3,
  date: datetime(year: 2026, month: 02, day: 15),
)

#let fake-label(name) = place[#figure(supplement: [problem])[]#label(name)]

1. 

  + We will prove $forall x forall y forall z ((x subset y and y subset z) implies x subset z)$.
    #fake-label("1.a.")
    #proof[
      Let $x$, $y$, and $z$ be sets, and assume that $x subset y$ and $y subset z$. \
      Now, let $t$ be an arbitrary set, and assume $t in x$.
      Since $x subset y$, we know that $forall w (w in x implies w in y)$ by definition, so that $t in y$.
      Since $y subset z$, we similarly have $forall w (w in y implies w in z)$ by definition, so that $t in z$.

      Therefore, $forall w (w in x implies w in z)$, so that $x subset z$ by definition.
    ]

  + We will prove $forall x forall y (x inter y subset x)$.
    #fake-label("1.b.")
    #proof[
      Let $x$ and $y$ be sets.
      Let $t$ be an arbitrary set, and assume $t in x inter y$.
      By definition,#marginalis[
        $x inter y := {z st z in x and z in y}$
      ]
      this means $t in {z st z in x and z in y}$, from which $t in x and t in y$ follows by definition.#marginalis[
        _set comprehension notation_
      ]
      This immediately implies $t in x$.

      Therefore, $forall w (w in x inter y implies w in x)$, showing that $x inter y subset x$ by definition.
    ]

  + We will prove $forall x forall y (x subset x union y)$.
    #fake-label("1.c.")
    #proof[
      Let $x$ and $y$ be sets.
      Let $t$ be an arbitrary set, and assume $t in x$.
      Then, clearly, we can see $t in x or t in y$.
      This implies $t in {z st z in x or z in y}$ by definition,#marginalis[
        _set comprehension notation_
      ]
      from which follows $t in x union y$ by definition.#marginalis[
        $x union y := {z st z in x or z in y}$
      ]

      Therefore, $forall w (w in x implies w in x union y)$, letting us conclude $x subset x union y$ by definition.
    ]

  + We will prove $forall x forall y (x inter y subset x union y)$.
    #fake-label("1.d.")
    #proof[
      Let $x$ and $y$ be sets.
      Recall that $x inter y subset x$#marginalis[
        #link(<1.b.>)[... by _problem 1.b._ ...]
      ]
      and $x subset x union y$.#marginalis[
        #link(<1.c.>)[... by _problem 1.c._ ...]
      ]
      Then, since $forall a forall b forall c ((a subset b and b subset c) implies a subset c)$,#marginalis[
        #link(<1.a.>)[... by _problem 1.a._ ...]
      ]
      we can conclude that $x inter y subset x union y$.
    ]

2. 

  + We provide two proofs of $forall x forall y exists p (p = (x, y))$ with slightly different styles.
    #proof(number: 1)[
      Let $x$ and $y$ be arbitrary sets.
      By the _axiom of pairing,_ we know there exists some set $l$ such that $l = {x, x}$.
      For any $z$, we can make the following observation:
      $
        z in {x, x} &iff z = x or z = x &&quad#say[by definition of ] z in {x, x} \
                    &iff z = x          &&quad#say[by _idempotency_] \
                    &iff z in {x}       &&quad#say[by definition of ] z in {x}
      $
      This shows us that $l = {x}$ by the _axiom of extensionality_.
      The _axiom of pairing_ also says there exists some set $r$ such that $r = {x, y}$.
      A third use of the _axiom of pairing_ reveals the existence of a set $p$ such that $p = {l, r}$.
      We then see $p = {{x}, {x, y}}$ by the _axiom of extensionality,_
      allowing us to conclude $p = (x, y)$ by definition.#marginalis[
        $(x, y) := {{x}, {x, y}}$.
      ]
    ]
    #proof(number: 2)[
      Let $x$ and $y$ be arbitrary sets.
      We know that ${x, x}$ and ${x, y}$ both exist by the _pairing axiom._
      The _axiom of extensionality_ makes it clear that ${x} = {x, x}$.
      We can again invoke the _axiom of pairing_ to see that ${{x}, {x, y}}$ exists.
      We conclude by observing that ${{x}, {x, y}} = (x, y)$ by definition.
    ]

  + We will prove $forall a forall b forall x forall y ((a, b) = (x, y) iff (a = x and b = y))$.
    #proof[
      Let $a$, $b$, $x$, and $y$ be sets.
      To show $(a, b) = (x, y) iff (a = x and b = y)$,#linebreak(justify: true)
      we must prove both the forward $(a, b) = (x, y) implies (a = x and b = y)$ direction
      and the backward $(a = x and b = y) implies (a, b) = (x, y)$ direction.
      #fragment(name: "The Forward Direction")[
        Suppose that $(a, b) = (x, y)$.
        Then, ${{a}, {a, b}} = {{x}, {x, y}}$ by definition.
        Since ${a} in {{a}, {a, b}}$, the _axiom of extensionality_ implies ${a} in {{x}, {x, y}}$,
        so ${a} = {x}$ or ${a} = {x, y}$ by definition.
        // We now take two cases.
        To show $a = x$, we take two cases.
        #case[
          Suppose that ${a} = {x}$.
          We know $a in {a}$ by definition,
          so $a in {x}$ by the _axiom of extensionality,_
          and thus $a = x$ by definition.
        ]
        #case[
          Suppose that ${a} = {x, y}$.
          Since $x in {x, y}$ by definition,
          we can then see $x in {a}$ by the _axiom of extensionality,_
          so that $x = a$ by definition.
        ]
        Therefore, we know $a = x$.#marginalis[
          This is how we apply _disjunction elimination,_ which is also known as _proof by cases._
          We reproduce the theorem below as a reminder below.
          $phi or psi, space phi arrow xi, space psi arrow xi proves xi$
        ]
        Now, since ${a, b} in {{a}, {a, b}}$,
        the _axiom of extensionality_ tells us that ${a, b} in {{x}, {x, y}}$.
        By definition, this then means that ${a, b} = {x}$ or ${a, b} = {x, y}$.
        To show $b = y$, we again take two cases.
        #case(reset: true)[
          Suppose that ${a, b} = {x}$.
          Then, since $b in {a, b}$ by definition, we know $b in {x}$ by the _axiom of extensionality,_
          which implies $b = x$ by definition.
          Since $a = x$, this implies $a = b$,
          from which we can derive ${a, b} = {a}$ by the _axiom of extensionality,_
          immediately implying ${{a}, {a, b}} = {{a}}$ by the _axiom of extensionality._
          If we recall that ${x, y} in {{x}, {x, y}}$ and ${{a}, {a, b}} = {{x}, {x, y}}$,
          then ${x, y} = {a}$ by definition.#marginalis[
            Because we know that both ${x, y} in {{a}, {a, b}}$ and ${{a}, {a, b}} = {{a}}$,
            we can say ${x, y} in {{a}}$,
            from which ${x, y} = {a}$ follows by definition.
          ]
          Then, since $y in {x, y}$, we know $y in {a}$ by the _axiom of extensionality,_
          so that $y = a$.
          Therefore, $y = b$.#marginalis[
            Recall we proved $a = b$ earlier this case, so this follows by _transitivity of equality._
          ]
        ]
        #case[
          Suppose that ${a, b} = {x, y}$.
          Since $y in {x, y}$, we can see $y in {a, b}$ by the _axiom of extensionality,_
          from which we obtain $y = a$ or $y = b$.
          In the first case, if $y = a$, then our result $a = x$ from earlier implies $y = x$,
          so that ${a, b} = {x, y} = {y}$ by the _axiom of extensionality._
          Since $b in {a, b}$, we then see $b in {y}$ by the _axiom of extensionality,_
          so $b = y$ by definition.
          In the second case, when $y = b$, then we immediately have our desired result $b = y$.
          Therefore, $y = b$.#marginalis[
            This is, yet again, another application of _disjunction elimination,_ also known as _proof by cases._
          ]
        ]
        Therefore, we know $b = y$.#marginalis[
          Guess what?
          _Disjunction elimination,_ also known as _proof by cases._
        ]
        Having proven both $a = x$ and $b = y$, we are finally done with this half of the proof.
      ]
      #fragment(name: "The Backward Direction")[
        Suppose that $a = x$ and $b = y$.
        // Since $a = x$, we know ${a} = {x}$ by the _axiom of extensionality._
        The _axiom of extensionality_ and the definition of _set roster notation_ then show us the following.
        $
          #say[For any set] t#say[,] quad t in {a} iff t = a iff t = x iff t in {x}.
        $
        Thus, ${a} = {x}$ by the _axiom of extensionality._
        Similarly, we can observe.
        $
        #say[For any set] t#say[,] quad t in {a, b} &iff t = a or t = b &&quad#say[by definition] \
                                                &iff t = x or t = y     &&quad#say[because] a = x #say[and] b = y#marginale[
                                                  #say[_transitivity of equality_]
                                                ] \
                                                &iff t in {x, y}        &&quad#say[by definition]
        $
        Thus, ${a, b} = {x, y}$ by the _axiom of extensionality._
        This of course implies ${{a}, {a, b}} = {{x}, {x, y}}$ by the _axiom of extensionality._
        We then conclude $(a, b) = {{a}, {a, b}} = {{x}, {x, y}} = (x, y)$ by definition.
      ]
      Therefore, having proven both the forward and backward directions,
      we can finally conclude that $(a, b) = (x, y) iff (a = x and b = y)$ as desired.
    ]

3. 

  + We will show that $forall x (x union {x} eq.not emptyset)$.
    #proof[
      Let $x$ be an arbitrary set.
      Observe that $x in {x}$ by definition.#marginalis[
        This is because $x = x$; _i.e.,_ the _reflexivity of equality._
      ]
      This implies that $x in x or x in {x}$,#marginalis[
        _disjunction introduction_
      ]
      so that $x in {z st z in x or z in {x}}$ by definition.#marginalis[
        _set comprehension notation_
      ]
      We can then clearly see that $x in x union {x}$ by definition.#marginalis[
        $x union y = {z st z in x thin or z in y}$
      ]
      However, we know that $x in.not emptyset$ because $forall y (y in.not emptyset)$.
      Therefore, the _axiom of extensionality_ reveals $x union {x} eq.not emptyset$.
    ]

  + If we are restricted to only Axioms 0, 1, and 2, we can neither prove nor disprove the statement
    $forall x forall y (x eq.not y implies x union {x} eq.not y union {y})$.#marginalis[
      We will be able to prove this important fact once we have the _axiom of regularity._
    ]
    To see why, let's try to _*attempt*_ to prove this statement with the tools we have available to us.
    // #proof[
    #proof(title: "\"Proof.\"", punctuation: "", qed: "")[
      Let $x$ and $y$ be sets and assume $x eq.not y$.
      Towards a contradiction, further assume $x union {x} = y union {y}$.
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
      Therefore, we must necessarily have both $x in y$ and $y in x$.#marginalis[
        We will soon use the _axiom of regularity_ to disprove the existence of such sets.
      ]
      At this point in our proof, we would be _*stuck*._
      Without more axioms, there is no contradiction we could draw from this seemingly strange relationship between $x$ and $y$.

      However, suppose there existed two sets $x$ and $y$ such that $x = {y}$ and $y = {x}$#marginalis[
        Using just Axioms 0, 1, and 2, we can not prove that such sets exist,
        but we also can't prove they _don't_ exist.
      ]
      and $x eq.not y$.
      Then, we could explicitly compute what $x union {x}$ and $y union {y}$ are.
      $
        x union {x} &= {z st z in x or z in {x}}   &&quad#say[by definition of ] union \
                    &= {z st z in {y} or z in {x}} &&quad#say[because ] x = {y} \
                    &= {z st z = y or z = x}       &&quad#say[by definition of ] z in {y} #say[ and ] z in {x} \
                    &= {y, x}                      &&quad#say[by the _axiom of extensionality_] \
        y union {y} &= {z st z in y or z in {y}}   &&quad#say[by definition of ] union \
                    &= {z st z in {x} or z in {y}} &&quad#say[because ] y = {x} \
                    &= {z st z = x or z = y}       &&quad#say[by definition of ] z in {x} #say[ and ] z in {y} \
                    &= {x, y}                      &&quad#say[by the _axiom of extensionality_]
      $
      This clearly means $x union {x} = y union {y}$ despite $x eq.not y$.
    ]
