#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "solution set",
  number: 0,
  date: datetime(year: 2026, month: 01, day: 25),
)

+ We will determine the truth value of each of the following sentences.

  + "Every integer is either even or odd."
    is #emph[#text(fill: green)[true].]

    // Using the intuition that a number $x$ is "even" if $frac(x, 2, style: "skewed")$ is an integer,
    We will call a number $z$ "even" if $z$ is an integer multiple of $2$, and we will call $z$ "odd" if it is one more than a multiple of $2$.

    Using this intuition, we can see that $0$ is even because $0 = 0 dot.c 2$.
    Since $2x + 2 = 2(x + 1)$,
    we obtain all of the positive even integers by starting at $0$ and continually adding $2$.
    Because $2x - 2 = 2(x - 1)$,
    we obtain the negative even integers by starting at $0$ and continually adding $-2$.

    The only numbers left over after this process must lie between two even integers.
    // since we found the even integers by starting at $0$ and then skipping one integer at-a-time in the positive and negative directions.
    However, after every even integer $2x$,
    there is an odd#marginalis[
      This follows from our definition of "odd."
    ]
    integer $2x + 1$,
    and the next number after that $2x + 2$, which equals $2(x + 1)$, is even.
    So, these numbers that lie between the even integers are precisely the odd integers.
    Therefore, every integer is either even or odd.
    // Sin
    // // This means that every odd number must 

    // As a consequence, we can show that every odd number lies between two even integers.
    // Take an arbitrary positive integer $z$ and suppose $z$ is odd.

  + "Every number is either even or odd."
    is #emph[#text(fill: red)[false].]

    Consider the number $frac(1, 2, style: "skewed")$.
    To see that there is no way to write this as a multiple of $2$, suppose that we _could._
    That would mean $frac(1, 2, style: "skewed") = 2x$ for some integer $x$,
    // and we therefore have
    // $ x = 1/2 dot.c 1/2 = (2x) (2x) = 4x^2 $
    and therefore $x = frac(1, 4, style: "skewed")$.
    We can see that $0 lt x lt 1$, which is absurd because there are no integers between $0$ and $1$.

    Therefore, $frac(1, 2, style: "skewed")$ is not even.
    By repeating a similar argument, we can see that $frac(-1, 2, style: "skewed")$ is also not even.
    This shows $frac(1, 2, style: "skewed")$ is also not odd, since the number it is one greater than is not even.

  + "Every non-empty set of integers has a least element."
    is #emph[#text(fill: red)[false].]

    To see that this sentence is false, we will find an example of a non-empty set of integers with no least element.
    Consider, for example, the set of all even integers.
    To see that this set has no least element, take an arbitrary even integer $z$ and notice that $z - 2$ is also even and is less than $z$.
    This argument generalizes to any even integer, so this set has no least element.

  + "Every non-empty set of natural numbers has a least element."
    is #emph[#text(fill: green)[true].]

    Recall that $0$ is the smallest natural number.
    Consider an arbitrary non-empty set of natural numbers $A$ and let $a_0$ be one of its elements.#marginalis[
      Notice that we know there exists such an element $a_0$ in the first place because $A$ is non-empty.
    ]
    \
    If $a_0$ is not the least element of $A$, then there must be an element $a_1$ such that $a_1 lt.eq a_0 - 1 lt a_0$.
    Now, if $a_1$ is not the least element of $A$, there must be an element $a_2$ such that $a_2 lt.eq a_1 - 1 lt a_1$.
    We can continue asking this question, looking for the least element of $A$, and after at most $a_0$ iterations of this process we will exhaust all of the numbers between $0$ and $a_0$.
    Since there are no natural numbers less than $0$, one of the numbers between $0$ and $a_0$ must be the least element of $A$.

    #colbreak()

  + "Every natural number is boring."
    is #emph[#text(fill: red)[false].]

    For example, $0$ has the interesting property that $0 lt.eq x$ for any natural number $x$.
    This precludes the natural number $0$ from being boring.

  + "No natural number is boring."
    is #emph[#text(fill: green)[true].]

    To show that every natural number is interesting, suppose towards the contrary that there is at least one boring number.
    Now, consider the set of all boring numbers $B$.
    This is a non-empty set of natural numbers, so it has a least element $b$.
    This number $b$ is the _smallest_ boring number... a very interesting property!
    This means $b$ is _not_ boring, contradicting the fact that $b$ is the smallest _boring_ number.
    Therefore, our assumption that there exists at least one boring number was mistaken, and there are no boring natural numbers.

+ We will determine the truth value of each of the following sentences.

  + "This sentence is _true._"
    could have #emph[#text(fill: blue)[either truth value].]

    I mean, literally just read it.
    If you believe it, then the sentence is certainly _true._
    However, if you don't believe it, then you would say that the sentence is _false_ and you would believe the opposite of what it says: that the sentence is _false._
    In either case, there's no problem with assigning either truth value to the sentence.

  + "This sentence is _false._"
    is #emph[#text(fill: blue)[neither truth nor false].]

    Let $S$ be the sentence $#sentence[$S$ is _false_]$ and suppose $S$ is _true._
    Then, we should believe what $S$ says, and therefore we believe $S$ is _false,_ immediately contradicting our assumption.

    On the other hand, assuming $S$ is _false,_ we should then believe the opposite of what $S$ says.
    This means we believe $S$ is not _false,_ again contradicting our assumption.

    Since we run into contradictions in either case, there is no consistent truth value that can be assigned to that sentence.

  + "The set of all sets that contain themselves contains itself."
    could have #emph[#text(fill: blue)[either truth value].]

    We should first suppose that such an object like "the set of all sets that contain themselves" exists and that we can talk about it in a consistent way.
    Let's give this set the name $B$.
    The elements of $B$ are all and only those sets $x$ such that $x$ contains $x$ as an element.
    // Supposing that such an object like "the set of all sets" exists and we can talk about it, call this set $U$.
    // Every set that contains itself is an element of $U$.

    If the given sentence is _true,_ then we should believe that $U$ contains itself as an element.
    By the definition of $U$, that means that $U$ is an element of $U$, which agrees with the observation we just made.
    It seems that no contradictions are introduced.
    // Since all of the elements of $U$ are sets that contain themselves, this seems to line up well with the definition of $U$, and there are no problems.

    If we instead suppose that the given sentence is _false,_ then we would _not_ believe that $U$ contains itself.
    By the definition of $U$, we then know $U$ is _not_ one of the sets that contains itself, meaning that $U$ does not contain itself.
    This agrees with our observation that the given sentence is _false,_ and again it seems like all is right with the world.
    // As before, this does not introduce a contradiction.

    Therefore, much like the sentence in 2.a., this sentence could consistently hold either truth value.

    // Now, we can ask the question: does $U$ contain itself or not?

    // If $U$ contained itself, then it would be one of those sets 
    // This set $U$ has the property that it contains every set that contains itself.
    // Since $U$ itself is a set, we can conclude that $U$ is an element of $U$ by definition.

    // #colbreak()

  + "The set of all sets that do not contain themselves does not contain itself."
    is #emph[#text(fill: blue)[neither true nor false].]

    Suppose that such a set exists, and call it $R$.
    If the sentence is _true,_ then $R$ contains $R$ as an element, and therefore $R$ is one of the sets that does not contain itself, contradicting the fact that $R$ contains $R$.

    Alternatively, suppose the sentence is _false._
    Then, $R$ is _not_ an element of $R$, so $R$ is not one of the sets that contains themselves.
    However, since $R$ does not contain itself, it qualifies as one of the elements of $R$ by definition, contradicting our previous observation.

  + "If this sentence is _false,_ then $7$ is a prime number."
    is #emph[#text(fill: green)[true].]

    Call the sentence above $S$, so that it says $#sentence[If $S$ is _false,_ then $7$ is prime.]$
    If $S$ were _false,_ this would imply that $7$ is prime.
    But $7$ is actually prime, so the inference that $#sentence[if $S$ is _false,_ then $7$ is prime]$ is _true,_ meaning that $S$ is _true,_ contradicting the fact that we assumed $S$ was _false._

    If we simply say that $S$ is _true,_ then $S$ is a conditional statement with a _false_ premise, which is _true_ by default, and all is right with the world.

  + "If this sentence is _true,_ then $7$ is not a prime number."
    is #emph[#text(fill: blue)[neither true nor false].]

    Let $C$ be the sentence above.
    $C$ says $#sentence[If $C$ is _true,_ then $7$ is not prime.]$

    First, assume $C$ is _false._
    That means $C$ is an implication with a _false_ premise and _true_ conclusion.
    However, this contradicts the fact that we know $7$ _is_ prime.

    Second, assume $C$ is _true._
    This means the premise of $C$ is _true,_ and thus we know the conclusion of $C$ must be _true._
    This tells us $7$ is not prime, which again contradicts the fact that $7$ is prime.

    Therefore, neither truth value can consistently be assigned to $C$.

+ Consider the infinite sequence of sentences indexed by natural numbers
  $ S_0, S_1, S_2, ..., S_i, ... $
  in which each sentence asserts that every sentence following it is _false._#marginalis[
    The variable $i$ in the definition of $S_i$ ranges over all of the natural numbers $0, 1, 2, ...$
  ]
  $ S_i := #say[#{sym.quote.l.double}$S_j$ is _false_ for all $j gt i$#{sym.quote.r.double}] $
  We will show that #text(fill: blue)[_none of these sentences has a consistent truth value._]

  Consider the first sentence $S_0$ and suppose $S_0$ is _true._
  We then know that all of the sentences $S_1, S_2, S_3, ... $ are _false._
  In particular, this means that $S_1$ is _false,_ which implies that _not all_ of the sentences $S_2, S_3, S_4, ...$ are _false._
  That means that there is some sentence $S_i$ such that $S_i$ is _true,_ where $i gt 1$.
  However, according to $S_0$, we know that $S_i$ is _false_ because $i gt 1$.
  #contradiction

  Let's then analyze what would happen if $S_0$ were _false._
  That would mean that not all of the sentences $S_1, S_2, S_3, ...$ are _false,_ so there must be a sentence $S_k$ such that $S_k$ is _true,_ where $k gt 0$.
  // But now we can repeat our argument from before.
  Following similar logic as before, this implies $S_(k + 1)$ is _false,_ which means there is some sentence $S_i$ such that $S_i$ is _true,_ where $i gt k + 1$.
  However, $S_i$ being _true_ with $i gt k + 1 gt k$ contradicts the fact that we said $S_k$ was _true._
  #contradiction

  Thus, there is no consistent way to assign a truth value to $S_0$.
  We can take this argument about $S_0$ and generalize it to any sentence in this sequence, and therefore none of them have consistent truth values.
