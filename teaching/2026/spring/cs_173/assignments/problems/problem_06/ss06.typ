#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 6,
  date: datetime(year: 2026, month: 04, day: 01),
)

1. We will prove that $(forall a, b, x, y, n in ZZ)((n divides x and n divides y) implies (n divides a x + b y))$.
  #proof[
    Let $a, b, x, y, n in ZZ$ and assume that $n divides x$ and $n divides y$.
    By definition, this means there exist $k_x in ZZ$ such that $n dot k_x = x$,
    and there exists $k_y in ZZ$ such that $n dot k_y = y$.
    $
      n dot k_x = x & implies n dot (a dot k_x) = a dot x \
      n dot k_y = y & implies n dot (b dot k_y) = b dot y
    $
    By adding these equations together and factoring out $n$, we obtain the following.
    $
      a dot x + b dot y = (n dot (a dot k_x)) + (n dot (b dot k_y)) = n dot (a dot k_x + b dot k_y)
    $
    Since $a dot k_x + b dot k_y in ZZ$, we conclude that $n divides a dot x + b dot y$ by definition.
  ]

2. 

  + We will prove $(forall z in ZZ)(2 divides.not z or 2 divides.not (z - 1))$.
    #proof[
      Let $z in ZZ$ and suppose, towards a contradiction, that $2 divides z$ and $2 divides z - 1$.
      Then we know there exist $k in NN$ and $ell in NN$ such that $2k = z$ and $2 ell = z - 1$ by definition.
      From this, we can see that $z = 2 ell + 1$, so that $2k = 2 ell + 1$.
      Observe.
      $
        2k = 2 ell + 1
          & implies 2k - 2 ell = 1 \
          & implies 2 (k - ell) = 1
      $
      Since $k - ell in ZZ$, this implies that $2 divides 1$, so that $abs(2) lt.eq abs(1)$.
      The fact that $1 in NN$ and $2 in NN$ implies $0 lt.eq 1$ and $0 lt.eq 2$,
      so we have that $1 = abs(1)$ and $2 = abs(2)$,
      so that $2 lt.eq 1$,
      from which we can deduce $2 = 1 or 2 in 1$ by definition.
    ]

  + We will prove $(forall z in ZZ)((even(z)) iff (odd(z + 1)))$.
    #proof[
      Let $z in ZZ$ and observe.
      $
        even(z)
          & iff 2 divides z                        && quad #say[by definition of _"even"_] \
          & iff (exists k in ZZ)(2k = z)           && quad #say[by definition of divisibility] \
          & iff (exists k in ZZ)(2k = (z + 1) - 1) && quad #say[since] (z + 1) - 1 = z \
          & iff 2 divides (z + 1) - 1              && quad #say[by definition of divisibility] \
          & iff odd(z + 1)                         && quad #say[by definition of _"odd"_]
      $
      Therefore, $even(z)$ iff $odd(z)$.
    ]

  + We will prove $(forall n in NN)((even(n)) or (odd(n)))$ by _weak induction._
    #proof[
      #case-basis[
        Notice that $2 dot 0 = 0$, so that $2 divides 0$ by definition, showing us $even(0)$.
      ]
      #case-inductive[
        Let $k in NN$ and assume that $(even(k)) or (odd(k))$.
        We take two cases.
        #marginalis[_inductive hypothesis_]
        #case[
          Suppose $even(k)$, meaning $2 divides k$ by definition.
          Since $(k + 1) - 1 = k$, this clearly implies that $2 divides (k + 1) - 1$,
          so that $odd(k + 1)$ by definition.
          Thus, $(even(k + 1)) or (odd(k + 1))$.
        ]
        #case[
          Suppose that $odd(k)$, meaning $2 divides k - 1$ by definition.
          This means there exists $ell in ZZ$ such that $2 ell = k - 1$ by definition.
          Adding $2$ to both sides yields $2 ell + 2 = (k - 1) + 2$,
          which simplifies to $2 (ell + 1) = k + 1$.
          Since $ell + 1 in ZZ$, we can deduce $2 divides k + 1$,
          telling us $even(k + 1)$ by definition.
          Thus, $(even(k + 1)) or (odd(k + 1))$.
        ]
        In either case, we have shown that either $even(k + 1)$ or $odd(k + 1)$.
      ]
      Therefore, we can conclude that $(forall n in NN)((even(n)) or (odd(n)))$.
    ]

3. We will show $(exists m in NN)(forall n in NN)(n gt.eq m implies n^2 lt 2^n)$.
  #proof[
    // Let $d in NN$, and let $m := 5$.
    Letting $m := 5$, we prove $(forall n in NN)(n gt.eq 5 implies n^2 lt 2^n)$ by _weak induction._
    #marginalis[
      Since we are only proving $n^2 lt 2^n$ when $n gt.eq 5$, we know that the statement we are trying to prove is _vacuously true (because it is a conditional with a false premise)_ whenever $n in {0, 1, 2, 3, 4}$.
      It should therefore be reasonable to _"start"_ our induction by taking $5$ as our basis step because that's the _"real"_ basis that we would have to explicitly prove anyways in the inductive step.
    ]
    #case-basis[
      Observe that $5^2 = 25 lt 32 = 2^5$.
    ]
    #case-inductive[
      Let $k in NN$, and suppose $k gt.eq 5 implies k^2 lt 2^k$.
      #marginalis[
        _inductive hypothesis_
      ]
      Assume $k + 1 gt.eq 5$, so that $k + 1 = 5$ or $k + 1 gt 5$.
      We now take two cases.
      #case[
        If $k + 1 = 5$, we immediately have $(k + 1)^2 lt 2^(k + 1)$ thanks to our basis step.
      ]
      #case[
        Suppose $k + 1 gt 5$.
        Notice that $k + 1 gt 5 iff k gt 4 iff k gt.eq 5 iff k - 2 gt.eq 3$ because $k in NN$.
        So, we know $k gt.eq 5$ and $k - 2 gt.eq 3$.
        The fact that multiplication is monotonic then tells us that $k(k - 2) gt.eq 5 dot 3 = 15 gt 1$.
        Now, observe.
        $
          k(k - 2) gt 1 implies k^2 - 2k gt 1 implies k^2 gt 2k + 1 \
        $
        Recalling that $k gt.eq 5$, we apply our _inductive hypothesis_ to see $k^2 lt 2^k$.
        Taking this in concert with $k^2 gt 2k + 1$, we can now make the following deduction.
        $
          (k + 1)^2
            & =  k^2 + 2k + 1 && quad #say[by distributing several times and] 1 + 1 = 2 \
            & lt k^2 + k^2    && quad #say[since] k^2 lt 2k + 1 \
            & lt 2^k + 2^k    && quad #say[by the _inductive hypothesis_] \
            & lt 2 dot 2^k    && quad #say[by distributivity, commutativity, and] 1 + 1 = 2 \
            & lt 2^(k + 1)    && quad #say[by definition of exponentiation] \
        $
      ]
      Thus, in either case, we have that $(k + 1)^2 lt 2^(k + 1)$.
    ]
    Therefore, we conclude that $(forall n in NN)(n gt.eq 5 implies n^2 lt 2^n)$ as desired.
  ]

4. We will show $(forall n in NN)(n gt.eq 4 implies 2^n lt n!)$ by _weak induction._
  #proof[
    As with the previous problem, we will perform induction on $NN without {0, 1, 2, 3}$.
    #case-basis[
      Observe the following sequences of computations.
      #grid(
        align: center + top,
        columns: (1.0fr, 1.0fr),
        $
          2^4
            & = 2 dot 2^3 \
            & = 2 dot (2 dot 2^2) \
            & = 2 dot (2 dot (2 dot 2^1)) \
            & = 2 dot (2 dot (2 dot (2 dot 2^0))) \
            & = 2 dot (2 dot (2 dot (2 dot 1))) \
            & = 2 dot (2 dot (2 dot 2)) \
            & = 2 dot (2 dot 4) \
            & = 2 dot 8 \
            & = 16 \
        $,
        $
          4!
            & = 4 dot (3!) \
            & = 4 dot (3 dot (2!)) \
            & = 4 dot (3 dot (2 dot (1!))) \
            & = 4 dot (3 dot (2 dot (1 dot 0!))) \
            & = 4 dot (3 dot (2 dot (1 dot 1))) \
            & = 4 dot (3 dot (2 dot 1)) \
            & = 4 dot (3 dot 2) \
            & = 4 dot 6 \
            & = 24 \
        $
      )
      Since $16 lt 24$, we conclude that $2^4 lt 4!$ as required.
    ]
    #case-inductive[
      Let $k in NN without {0, 1, 2, 3}$, so that $k gt.eq 4$, and assume $2^k lt k!$.
      #marginalis[_inductive hypothesis_]
      First, we can notice that $k + 1 gt k gt.eq 4 gt 2$;
      this then implies $2 dot k! lt.eq (k + 1) dot k!$ by the monotonicity of multiplication.
      We can then observe the following sequence of inequalities.
      $
        2^(k + 1)
          & =     2 dot 2^k      && quad #say[by definition of exponentiation] \
          & lt    2 dot k!       && quad #say[by the _inductive hypothesis_] \
          & lt.eq (k + 1) dot k! && quad #say[since] 2 dot k! lt.eq (k + 1) dot k! \
          & =     (k + 1)!       && quad #say[by definition of the factorial function]
      $
      Thus, we arrive at $2^(k + 1) lt (k + 1)!$, concluding our inductive step.
    ]
    Therefore, $(forall n in NN)(n gt.eq 4 implies 2^n lt n!)$.
  ]

5. We will show $(forall n in NN)(display(sum_(i = 1)^(n) fib(2i - 1) = fib(2n)))$ by _weak induction._
  #proof[
    #case-basis[
      First, notice $sum_(i = 1)^(0) fib(2i - 1) = 0$ by definition since $0 lt 1$.
      Second, we can see $fib(2 dot 0) = fib(0) = 0$ by definition.
      Therefore, $sum_(i = 1)^(0) fib(2i - 1) = 0 = fib(2 dot 0)$.
    ]
    #case-inductive[
      Let $k in NN$ and assume $sum_(i = 1)^(k) fib(2i - 1) = fib(2k)$.
      #marginalis[_inductive hypothesis_]
      We can now simply observe.
      $
        sum_(i = 1)^(k + 1) fib(2i - 1)
          & = (sum_(i = 1)^(k) fib(2i - 1)) + fib(2(k + 1) - 1) && quad #say[by definition of] inline(sum) \
          & = fib(2k) + fib(2(k + 1) - 1)                       && quad #say[by the _inductive hypothesis_] \
          // & = fib(2k) + fib(2k + 1)                             && quad #say[by distributing and simplifying] \
          & = fib(2k) + fib(2k + 1)                             && quad #say[because] 2(k + 1) - 1 = 2k + 1 \
          & = fib(2k + 2)                                       && quad #say[by definition of] fib(square.stroked.dotted) \
          & = fib(2(k + 1))                                     && quad #say[since] 2k + 2 = 2(k + 1) \
      $
      Thus, we have that $sum_(i = 1)^(k + 1) fib(2i - 1) = fib(2(k + 1))$ as desired.
    ]
    We therefore conclude $sum_(i = 1)^(n) fib(2i - 1) = fib(2n)$ for all $n in NN$.
  ]
