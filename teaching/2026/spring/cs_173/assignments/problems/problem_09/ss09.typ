#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 8,
  date: datetime(year: 2026, month: 04, day: 28),
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
      Then we know there exist $k in NN$ and $ell in NN$ such that $2 k = z$ and $2 ell = z - 1$ by definition.
      From this, we can see that $z = 2 ell + 1$, so that $2 k = 2 ell + 1$.
      Observe.
      $
        2 k = 2 ell + 1 & implies 2 k - 2 ell = 1 \
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
        even(z) & iff 2 divides z                         && quad #say[by definition of _"even"_] \
                & iff (exists k in ZZ)(2 k = z)           && quad #say[by definition of divisibility] \
                & iff (exists k in ZZ)(2 k = (z + 1) - 1) && quad #say[since] (z + 1) - 1 = z \
                & iff 2 divides (z + 1) - 1               && quad #say[by definition of divisibility] \
                & iff odd(z)                              && quad #say[by definition of _"odd"_]
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
        Suppose $k + 1 gt 5$. Notice $k + 1 gt 5 iff k gt 4 iff k gt.eq 5$ because $k in NN$.
        We can then apply our _inductive hypothesis_ and see $k^2 lt 2^k$.
        Now, observe.
        $
          k gt.eq 5 & implies k - 1 gt.eq 4 gt 0 \
                    & implies (k - 1)^2 gt (k + 1) dot 0 = 0 \
                    & implies k^2 - 2 k + 1 gt 0 \
        $
        $
          k^2 gt k + 1 & iff k^2 - k - 1 gt 0
        $
        $
          (k + 1)^2 & = k^2 + 2 k + 1 \
                    & = k^2 + 2 k + 1 \
        $
      ]
    ]
  ]

4. We will show $(forall n in NN)(n gt.eq 4 implies 2^n lt n!)$.
  #proof[
    henlo
  ]

5. We will show $(forall n in NN)(display(sum_(i = 1)^(n) fib(2i - 1) = fib(2n)))$.
  #proof[
    henlo
  ]
