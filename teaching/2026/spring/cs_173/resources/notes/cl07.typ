#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 7",
  number: 7,
  date: datetime(year: 2026, month: 03, day: 11),
)

= Induction and Recursion

#definition(name: "The Unique Existential Quantifier")[
  For every wff $phi$ with at most one free variable,
  we define what it means to say #define[there exists a unique]
  #marginalis[
    Notice that the word _"unique"_ means _"only one";_
    this is a _unary_ predicate that says $x$ is the _only_ thing with some given property.
    It _does *not*_ mean the same as the word _"distinct,"_ which is a _binary_ predicate indicating that $x eq.not y$.
  ]
  object that $phi$ is _true_ about below.
  $
    exists! x (phi(x)) deff exists x (phi(x) and forall y (phi(y) implies y = x))
    #apostille[
      $exists!$
    ]
  $
  Given a set $X$, we can extend this definition in a similar way to _restricted quantifier notation_
  #marginalis[
    _Definition 6.1_ from _clavicula 6_
  ]
  to make complicated sentences more convenient to express.
  $
    (exists! x_1, dots x_n in X)(phi(x)) deff exists! x_1 dots x_n ((x_1 in X and dots and x_n in X) and phi(x))
  $
]

== What is a Function?

#definition(name: "Function")[
  Let $X$ and $Y$ be sets.
  We define what it means for $f$ to be a #define[function from $X$ to $Y$] below.
  #apostille[
    function
  ]
  $
    f: X to Y deff f subset X times Y and (forall x in X)(exists! y in Y)((x, y) in f)
    #apostille[
      $f thin : thin X thin to thin Y$
    ]
  $
  // We say by definition that a set $f$ is a #define[function from $X$ to $Y$]
  // _if and only if_ both of the following conditions are satisfied.

  // 1. $f subset X times Y$
  // 2. $(forall x in X)(exists! y in Y)((x, y) in f)$
  We use the notation $f: X to Y$ to indicate that $f$ is a function from $X$ to $Y$.
  #marginalis[
    The expression $f: X to Y$ is a _complete sentence_ that is usually read in English as #linebreak(justify: true) _"$f$ is a function from $X$ to $Y$."_
  ]
  The set $X$ in this definition, called the #define[domain] of $f$,
  // #apostille[domain]
  is the set of all inputs to $f$;
  we will use the notation $dom(f)$ to denote the domain of $f$.
  #apostille[$dom(dot)$]
  The set $Y$ contains all of the _possible outputs_ of $f$;
  we call this the #define[codomain] of $f$ and use the notation $cod(f)$ to denote it.
  #apostille[$cod(dot)$]
  When $f$ is a function from $X$ to $Y$, we define the following convenient notation for every $x in X$ and $y in Y$.
  $
    f(x) = y deff (x, y) in f
    #apostille[$f(x) = y$]
  $
]

Here is a basic, but important, example of a function.
Consider $id_NN: NN to NN$ given by $id_NN (x) := x$ for every $x in NN$.
Below are some of the first few values of this function.

$
  id_NN (0) & = 0 \
  id_NN (1) & = 1 \
  id_NN (2) & = 2 \
            & space dots.v
$

In fact, for any set $A$, we can define a version of this function---called the
#apostille[identity function]
#define[identity function on $A$]---denoted by $id_A$.
We define $id_A: A to A$ such that $id_A (a) := a$ for every $a in A$.

In order for $f$ to be a function from $X$ to $Y$, every element $x in X$ needs to have exactly one corresponding element $y in Y$ such that $f(x) = y$.
However, notice that the converse _does not have to hold!_
Let's see why.

First, it is possible to have a function where two distinct inputs produce the same output.
Formally, there might exist sets $X$ and $Y$ and a function $g: X to Y$ such that:
$
  (exists x_1, x_2 in X)((x_1 eq.not x_2) and (g(x_1) = g(x_2)))
$
For example, consider the function $g: {0, 1, 2, 3} to {0, 1}$ given by the mapping below.
$
  g(0) &:= 0 & wide & g(1) &:= 1 \
  g(2) &:= 0 & wide & g(3) &:= 1 \
$

Second, it is possible for there to be elements of the codomain of a function that _are not actually outputs_ of that function.
Formally, there might exist sets $X$ and $Y$ and a function $h: X to Y$ such that the following sentence is satisfied.
$
  (exists y in Y)(forall x in X)(h(x) eq.not y)
$
For example, consider the function $h: NN to NN$ given by $h(x) := x + 1$ for each $x in NN$.
Notice that $0 in cod(h)$, but $(forall x in dom(h))(h(x) eq.not 0)$.
We will revisit these ideas soon.

== Sequences and Iteration

#definition(name: "Sequence")[
  Suppose that $A$ is a set.
  We say that #define[$f$ is an infinite sequence over $A$] $deff f: NN to A$.
  #apostille[sequence] \
  We say that #define[$f$ is a finite sequence over $A$] $deff (exists n in NN)(f: n to A)$.
  Usually, if we call something a _"sequence"_ without qualification, it is assumed we are referring to an _infinite_ sequence;
  though, of course, it is best to be specific when possible.
  #marginalis[
    Note that we have _*not* yet defined_ what _"infinity"_ or _"finity"_ are.
    We _do *not*_ yet have a formal understanding of what it means for a set to be _"infinite"_ or _"finite"_ yet.
  ]
]

// For example, the function $f: NN to {0, 1}$ given by $f(x) := $
For example, the binary sequence "0, 1, 0, 1, 1, 0, 1, 1, 1, 0, ..." is formally just a function $beta: NN to {0, 1}$ where $beta(0) := 0$, and $beta(1) := 1$, and $beta(2) := 0$, and $beta(3) := 1$, _et cetera..._

// Here's another famous example of a sequence of natural numbers.
// #definition(name: "Fibonacci Sequence")[
//   The #define[Fibonacci sequence] is the recursive function $F: NN to NN$ defined below for all $n in NN$.
//   $
//     F(0)     & := 0 \
//     F(1)     & := 1 \
//     F(n + 2) & := F(n + 1) + F(n) \
//   $
// ]

#definition(name: "Iterated Addition")[
  Let $f: NN to NN$ be a sequence of natural numbers.
  We recursively define the #define[iterated sum]
  #apostille[$sum$]
  of finitely many values of $f$ below for every $a in NN$ and $b in NN$.
  $
    sum_(i = a)^(b) f(i)      & := 0                                  && quad #say[if] b lt a \
    sum_(i = a)^(a) f(i)      & := f(a)                               && quad #say[if] b = a \
    sum_(i = a)^(suc(b)) f(i) & := (sum_(i = a)^(b) f(i)) + f(suc(b)) && quad #say[if] b gt a \
  $
]

#theorem[
  For all $n in NN$, we have that $2 dot display(sum_(i = 0)^(n) i) = n dot (n + 1)$.
]
#proof[
  We will prove $(forall n in NN)(2 dot sum_(i = 0)^(n) i = n dot (n + 1))$ by _weak induction._
  #case-basis[
    Observe the following.
    #marginale[
      In the _basis step,_ we need to prove $2 dot sum_(i = 0)^(0) i = 0 dot (0 + 1)$.
    ]
    $
      2 dot sum_(i = 0)^(0) i & = 2 dot 0       && quad #say[by definition of iterated addition] \
                              & = 0             && quad #say[by definition of multiplication] \
                              & = 0 dot 0       && quad #say[by definition of multiplication] \
                              & = (0 dot 0) + 0 && quad #say[by definition of addition] \
                              & = 0 dot suc(0)  && quad #say[by definition of multiplication] \
                              & = 0 dot 1       && quad #say[by definition of] 1 \
                              & = 0 dot (0 + 1) && quad #say[because] (forall x in NN)(0 + x = x) \
    $
    Thus, we now know $2 dot sum_(i = 0)^(0) i = 0 dot (0 + 1)$ as desired.
  ]
  #case-inductive[
    Let $k in NN$, and assume $2 dot sum_(i = 0)^(k) i = k dot (k + 1)$.
    #marginale[
      In the _inductive step,_ we must prove,
      for every $k in NN$, #linebreak(justify: true)
      $2 sum_(i = 0)^(k) i = k (k + 1)$ implies #linebreak(justify: true)
      #box(width: 110.0%, $2 sum_(i = 0)^(suc(k)) i = suc(k) (suc(k) + 1)$).
      // #box(width: 112.0%)[$2 sum_(i = 0)^(suc(k)) i = suc(k) (suc(k) + 1)$.]
    ]
    We can now observe the following.
    $
      2 dot sum_(i = 0)^(suc(k)) i & = 2 dot ((sum_(i = 0)^(k)i) + suc(k))        && quad #say[by definition of iterated addition] \
                                   & = (2 dot sum_(i = 0)^(k) i) + (2 dot suc(k)) && quad #say[by distributivity of] dot #say[over] + \
                                   & = (k dot (k + 1)) + (2 dot suc(k))           && quad #say[by the _inductive hypothesis_] \
                                   & = (k dot (k + 1)) + (2 dot (k + 1))          && quad #say[because] (forall x in NN)(suc(x) = x + 1) \
                                   & = ((k + 1) dot k) + ((k + 1) dot 2)          && quad #say[by commutativity of multiplication] \
                                   & = (k + 1) dot (k + 2)                        && quad #say[by distributivity of] dot #say[over] + \
                                   & = (k + 1) dot (k + (1 + 1))                  && quad #say[because] 1 + 1 = 2 \
                                   & = (k + 1) dot ((k + 1) + 1)                  && quad #say[by associativity of addition] \
                                   & = suc(k) dot (suc(k) + 1)                    && quad #say[because] (forall x in NN)(suc(x) = x + 1) \
    $
    Thus, we have shown $2 dot sum_(i = 0)^(suc(k)) i = suc(k) dot (suc(k) + 1)$ as required.
  ]
  Therefore, we can conclude $(forall n in NN)(2 dot sum_(i = 0)^(n) i = n dot (n + 1))$.
]

// #theorem[
//   For all $n in NN$, we have that $6 dot display(sum_(i = 0)^(n) i^2) = n dot (n + 1) dot (2n + 1)$.
// ]
// #proof[
//   We will prove $(forall n in NN)(6 sum_(i = 0)^(n) i = n (n + 1) (2n + 1))$ by _weak induction._
//   #case-basis[
//     henlo
//   ]
//   #case-inductive[
//     henlo
//   ]
// ]

#definition(name: "Iterated Multiplication")[
  Let $f: NN to NN$ be a sequence of natural numbers.
  We define the #define[iterated product]
  #apostille[$product$]
  of finitely many values of $f$ recursively below for every $a in NN$ and $b in NN$.
  $
    product_(i = a)^(b) f(i)      & := 1                                        && quad #say[if] b lt a \
    product_(i = a)^(a) f(i)      & := f(a)                                     && quad #say[if] b = a \
    product_(i = a)^(suc(b)) f(i) & := (product_(i = a)^(b) f(i)) dot f(suc(b)) && quad #say[if] b gt a \
  $
]
