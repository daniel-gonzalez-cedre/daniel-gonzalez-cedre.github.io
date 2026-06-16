#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 7,
  date: datetime(year: 2026, month: 04, day: 17),
)

#set math.lr(size: 100%)

1. 

  + We will prove $forall X forall Y (X subset Y implies card(X) lt.eq card(Y))$.
    #proof[
      Let $X$ and $Y$ be sets and assume $X subset Y$.
      Consider the function $f: X to Y$ given by $f(x) := x$ for each $x in X$.
      We will prove this function is injective.

      Let $a, b in X$ and suppose $f(a) = f(b)$.
      Then, since $f(a) = a$ and $f(b) = b$ by the definition of $f$, we have that $a = b$.
      Thus, $f$ is injective, implying $card(X) lt.eq card(Y)$.
    ]

  + We will prove that every injection between nonempty sets is monomorphic.
    #proof[
      Let $X$ and $Y$ be sets such that $X eq.not emptyset$ and $Y eq.not emptyset$,
      and let $f: X to Y$ be an arbitrary injection.
      Since $X eq.not emptyset$, we know there exists some $x_0 in X$.
      Consider now the function $g: Y to X$ defined, for each $y in Y$, as follows.
      $
        g(y) := cases(
          x   & quad #say[if] x in X #say[such that] f(x) = y,
          x_0 & quad #say[if] (forall x in X)(f(x) eq.not y)
        )
      $
      We know that $g$ is a function because the fact that $f$ is injective guarantees that every element of $Y$ has _at most_ one preimage.
      #marginalis[
        This addresses _uniqueness_ of the output of $g$;
        _existence_ is guaranteed by the structure of the definition, since the two cases are mutually exclusive and exhaustive.
      ]
      We will now show $g compose f = id_X$.

      Let $x in X$.
      Notice that there exists $y in Y$ such that $f(x) = y$ because $f$ is a function.
      The definition of $g$ then implies $g(y) = x$.
      This permits the following observation.
      $
        (g compose f)(x) = g(f(x))
                         = g(y)
                         = x
      $
      Since we can see that $g compose f$ and $id_X$ have the same domain, same codomain, and $(g compose f)(x) = id_(X)(x)$ for every $x in X$, we conclude that $g compose f = id_X$.
    ]

2. 

  + We will prove $forall A forall B forall C ((card(A) lt.eq card(B) and card(B) lt.eq card(C)) implies card(A) lt.eq card(C))$.
    #proof[
      Let $A$, $B$, and $C$ be sets such that $card(A) lt.eq card(B)$ and $card(B) lt.eq card(C)$.
      This means there exist two injective functions $alpha: A inj B$ and $beta: B inj C$ by definition.
      We will now prove that $beta compose alpha: A to C$ is an injection.

      Let $x_1, x_2 in A$ and suppose $(beta compose alpha)(x_1) = (beta compose alpha)(x_2)$.
      We now must observe.
      $
        (beta compose alpha)(x_1) = (beta compose alpha)(x_2)
          & implies beta(alpha(x_1)) = beta(alpha(x_2)) && #say[by definition] \
          & implies alpha(x_1) = alpha(x_2)             && #say[because] beta #say[is injective] \
          & implies x_1 = x_2                           && #say[because] alpha #say[is injective] \
      $
      Therefore, $x_1 = x_2$, demonstrating that $beta compose alpha$ is injective, meaning $card(A) lt.eq card(C)$.
    ]

  + We will prove $forall A forall B forall C ((card(A) gt.eq card(B) and card(B) gt.eq card(C)) implies card(A) gt.eq card(C))$.
    #proof[
      Let $A$, $B$, and $C$ be sets such that $card(A) gt.eq card(B)$ and $card(B) gt.eq card(C)$.
      This means there exist two surjective functions $alpha: A sur B$ and $beta: B sur C$ by definition.
      We will now prove that $beta compose alpha: A to C$ is a surjection.

      Let $c in C$.
      Since $beta$ is a surjection, we know there exists $b in B$ such that $beta(b) = c$.
      Now, since $alpha$ is surjective, we also know there is some $a in A$ such that $alpha(a) = b$.
      We can now observe the sequence of equalities below, all following by definition.
      $
        (beta compose alpha)(a) = beta(alpha(a)) = beta(b) = c
      $
      Since we found element of $A$---namely $a$---such that $(beta compose alpha)(a) = c$, and since $c$ was an arbitrary element of $C$, we now know $beta compose alpha$ is surjective.
      Thus, we conclude that $card(A) gt.eq card(C)$ by definition.
    ]

  + We will prove $forall A forall B forall C ((card(A) = card(B) and card(B) = card(C)) implies card(A) = card(C))$.
    #proof[
      Let $A$, $B$, and $C$ be sets such that $card(A) = card(B)$ and $card(B) = card(C)$.
      This means there exist two bijective functions $alpha: A to B$ and $beta: B to C$ by definition.
      In particular, this means $alpha$ and $beta$ are both injective and both surjective.

      In 2.a., we proved that the composition of two injections is injective,
      so $beta compose alpha$ is an injection.
      Similarly, in 2.b., we proved that the composition of two surjections is surjective,
      implying $beta compose alpha$ is surjective.
      This means that $beta compose alpha$ is a bijection, allowing us to conclude $card(A) = card(C)$ by definition.
    ]

+ We will prove $card(A union B) = card(A) + card(B)$ for any pair of disjoint finite sets $A$ and $B$.
  #proof[
    Let $A$ and $B$ be finite sets such that $A inter B = emptyset$.
    Since $A$ and $B$ are finite, there exist $n_A, n_B in NN$ such that $card(A) = card(n_A)$ and $card(B) = card(n_B)$.
    This, in turn, implies there exist functions $f_A: A to n_A$ and $f_B: B to n_B$ such that $f_A$ and $f_B$ are both bijections.
    Consider the function $g: A union B to n_A + n_B$ given below for all $x in A union B$.
    $
      g(x) := cases(
        space f_(A)(x)       & quad #say[if] x in A,
        space f_(B)(x) + n_A & quad #say[if] x in B
      )
      // g(x) := cases(
      //   space f_(A)(x)       & quad #say[if] 0 lt.eq x lt n_A,
      //   space f_(B)(x) + n_A & quad #say[if] n_A lt.eq x lt n_A + n_B
      // )
    $
    The fact that $A inter B = emptyset$ ensures that $g$ is well-defined.
    We will prove $g$ is bijective.
    #fragment(title: "Injectivity", numbering: false)[
      Let $x_1, x_2 in A union B$ and suppose $g(x_1) = g(x_2)$.
      We take two cases.
      #case[
        Suppose $x_1 in A$, so $0 lt.eq g(x_1) = f_(A)(x_1) = g(x_2) lt n_A$.
        Towards a contradiction, assume $x_2 in.not A$.
        Since $x_2 in A union B$ and $A inter B = emptyset$, we have $x_2 in B$.
        However, the definition of $g$ then implies $g(x_2) = f_(B)(x_2) + n_A gt.eq n_A$,
        which contradicts our earlier assumption that $g(x_2) lt n_A$.
        #contradiction
        Therefore, $x_2 in A$.
        We then know that $f_(A)(x_1) = g(x_1) = g(x_2) = f_(A)(x_2)$.
        Since $f_A$ is injective, we conclude with the observation that $x_1 = x_2$.
      ]
      #case[
        Suppose $x_1 in.not A$, so that $x_1 in B$ due to the fact that $A inter B = emptyset$.
        This implies $n_A lt.eq g(x_1) = f_(B)(x_1) = g(x_2) lt n_A + n_B$.
        Towards a contradiction, assume $x_2 in.not B$, so that $x_2 in A$.
        From this, $g(x_2) = f_(A)(x_2) lt n_A$, contradicting our earlier assumption that $n_A lt.eq g(x_2)$.
        #contradiction
        Therefore, $x_2 in B$.
        We then know that $f_(B)(x_1) + n_A = g(x_1) = g(x_2) = f_(B)(x_2)$, so that $f_(B)(x_1) = f_(B)(x_2)$.
        Since $f_B$ is injective, this implies $x_1 = x_2$ as desired.
      ]
      Therefore, $g$ is injective.
    ]
    #fragment(title: "Surjectivity", numbering: false)[
      Let $y in n_A + n_B$.
      We take two cases based on which _"half"_ of $n_A + n_B$ contains $y$.
      #case[
        Suppose $0 lt.eq y lt n_A$.
        Then, $y in n_A$, so we know there exists some $x in A$ such that $f_(A)(x) = y$ by the fact that $f_A$ is surjective.
        We can then simply verify that $x in A union B$ and $g(x) = f_(A)(x) = y$ by definition of $g$.
      ]
      #case[
        Suppose $n_A lt.eq y lt n_A + n_B$.
        We then know $0 lt.eq y - n_A lt n_B$, from which we can derive that
        there exists $x in B$ such that $f_(B)(x) = y - n_A$ from the fact that $f_B$ is surjective.
        We then have $g(x) = f_B(x) + n_A = (y - n_A) + n_A = y$.
      ]
      Therefore, $g$ must be surjective.
    ]
    From this analysis, we can clearly see that $g$ is a bijection.
    We therefore conclude that $card(A union B) = card(n_A + n_B)$ as was requested of us.
  ]

// + We will prove $card(PP(X)) = 2^(card(X))$ for any finite set $X$.
+ We will prove $(forall n in NN)(forall X (card(X) = card(n) implies card(PP(X)) = card(2^n)))$.
  #proof[
    We perform weak induction on the cardinality of the finite set in question.
    #case-basis[
      Let $X$ be a set such that $card(X) = card(0)$, so that there exists a bijection $phi: X to emptyset$ by definition.
      The fact that $phi$ is a function implies $forall x (x in X implies phi(x) in emptyset)$, showing us that $X$ must be empty.
      #marginalis[
        Otherwise, we would have an element $x in X$ such that $phi(x) in emptyset$, contradicting the fact that $forall z (z in.not emptyset)$.
      ]
      Recalling $PP(X) = PP(emptyset) = {emptyset} = {0} = 1$,
      we conclude $card(PP(X)) = card(1) = 1 = 2^0$ since every set is in bijection with itself.
      #marginalis[
        We proved $forall x (card(x) = card(x))$; the bijection in question is $id_x$.
      ]
    ]
    #case-inductive[
      Let $k in NN$ and suppose $forall X (card(X) = card(k) implies card(PP(X)) = |2^k|)$.
      #marginalis[_inductive hypothesis_] \
      Now, let $X$ be a set and assume $card(X) = card(k + 1) = k + 1$.
      Since $k in NN$, we know that $k gt.eq 0$, implying $k + 1 gt.eq 1$, which tells $X$ is nonempty.
      #marginalis[
        If $X = emptyset$, then $card(X) = card(emptyset) = 0$,
        contradicting the fact that $card(X) = k + 1 gt.eq 1$.
      ]
      Therefore, there exists some $hat(x) in X$,
      and we can observe that $card(X without {hat(x)}) = card(X) - 1 = (k + 1) - 1 = k$.
      By the _inductive hypothesis,_ we then know $card(PP(X without {hat(x)})) = |2^k|$,
      which means there exists a bijection $rho: PP(X without {hat(x)}) to {z in NN st z lt 2^k}$ by definition.
      We now construct a new function $lambda: PP(X) to {z in NN st z lt 2^(k + 1)}$ as follows.
      For any $W subset X$,
      $
        lambda(W) := cases(
          rho(W)                        & quad #say[if] hat(x) in.not W,
          rho(W without {hat(x)}) + 2^k & quad #say[if] hat(x) in W
        )
      $
      Let's prove $lambda$ is a bijection.
      #fragment(title: "Injectivity", numbering: false)[
        Let $A, B in PP(X)$ and assume $lambda(A) = lambda(B)$.
        We take two cases.
        #case[
          Suppose $hat(x) in.not A$.
          Then, $lambda(A) = rho(A)$, so $0 lt.eq lambda(A) = lambda(B) lt 2^k$.
          Towards a contradiction, suppose $hat(x) in B$; by definition, this would imply $lambda(B) = rho(B without {hat(x)}) + 2^k gt.eq 2^k$, contradicting our earlier observation.
          #contradiction
          Thus, $hat(x) in.not B$, so that $rho(A) = lambda(A) = lambda(B) = rho(B)$.
          Since $rho$ was injective, we conclude that $A = B$.
        ]
        #colbreak()
        #case[
          Suppose $hat(x) in A$.
          Then, $lambda(A) = rho(A without {hat(x)}) + 2^k$.
          Since $rho(A without {hat(x)}) in NN$, we can observe $2^k = 0 + 2^k lt.eq rho(A without {hat(x)}) + 2^k = lambda(A) = lambda(B) lt 2^(k + 1)$.
          Towards a contradiction, supposing $hat(x) in.not B$ implies $lambda(B) = rho(B) lt 2^k$, which would contradict the observation we just made.
          #contradiction
          Thus, $hat(x) in B$.
          We therefore have $rho(A without {hat(x)}) + 2^k = lambda(A) = lambda(B) = rho(B without {hat(x)}) + 2^k$,
          from which we can derive $rho(A without {hat(x)}) = rho(B without {hat(x)})$.
          Since $rho$ is an injection, this tells us $A without {hat(x)} = B without {hat(x)}$, letting us conclude $A = B$.
          #marginalis[
            This follows directly from the _axiom of extensionality_ if we recall $hat(x) in.not A$ and $hat(x) in.not B$.
          ]
        ]
      ]
      #fragment(title: "Surjectivity", numbering: false)[
        Let $n in {z in NN st z lt 2^(k + 1)}$.
        We take two cases based on where $n$ lies.
        #case[
          Suppose $0 lt.eq n lt 2^k$.
          This puts $n$ squarely within the codomain of $rho$, which means there exists some $W in PP(X without {hat(x)})$ such that $rho(W) = n$ because of the fact that $rho$ is a surjection.
          Now, notice $W subset X without{hat(x)}$ and $X without {hat(x)} subset X$, so $W subset X$, putting $W$ in the domain of $lambda$.
          Since $hat(x) in.not W$, we can apply the definition of $lambda$ to reveal $lambda(W) = rho(W) = n$.
        ]
        #case[
          Suppose $2^k lt.eq n lt 2^(k + 1)$.
          Then, $0 lt.eq n - 2^k lt 2^(k + 1) - 2^k = 2^k(2 - 1) = 2^k$,
          demonstrating to us that $n - 2^k$ is in the codomain of $rho$.
          Again, since $rho$ is a surjection, this means there exists some $W in PP(X without hat(x))$ such that $rho(W) = n - 2^k$.
          By the same observation as in the previous case, we know $W subset X$, and $hat(x) in X$, so it should be clear that $W union {hat(x)} subset X$.
          If we recall that $(W union {hat(x)}) without {hat(x)} = W$, we can then observe the following.
          $
            lambda(W union {hat(x)})
              & = rho(W union {hat(x)} without {hat(x)}) + 2^k \
              & = rho(W) + 2^k \
              & = (n - 2^k) + 2^k \
              & = n
          $
        ]
      ]
      Therefore, we have that $lambda$ is a bijection between $PP(X)$ and ${z in NN st z lt 2^(k + 1)}$.
      We thus conclude that $card(PP(X)) = card(2^(k + 1))$ as desired.
    ]
    By the graces of the theorem of _weak induction,_ we can finally admire the conclusion that $(forall n in NN)(forall X (card(X) = card(n) implies card(PP(X)) = card(2^n)))$
  ]
