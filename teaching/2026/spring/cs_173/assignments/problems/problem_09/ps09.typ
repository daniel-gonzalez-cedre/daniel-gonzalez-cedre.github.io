#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 9,
  date: datetime(year: 2026, month: 05, day: 12),
)

#let definition = definition.with(numbering: false)
#let lemma = lemma.with(numbering: false)
#let theorem = theorem.with(numbering: false)
#let corollary = corollary.with(numbering: false)

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._

Recall that a graph $G$ is defined by
a _finite_ set of vertices#marginalis[... also called _nodes_...] $V(G)$ and
a set of edges $E(G)$ satisfying $E(G) subset {W st W subset V(G) and card(W) = 2}$.
// For any vertex $v in V(G)$, we have also defined the _neighborhood of $v$_ and _incidence set of $v$_ as follows.
// $
//   N_G(v) &:= {w in V(G) && st {v, w} in E(G)} \
//   I_G(v) &:= {e in E(G) && st v in e}
// $
For any vertex $v in V(G)$, we called $N_(G)(v) := {w in V(G) st {v, w} in E(G)}$ the _neighborhood_
and $I_(G)(v) := {e in E(G) st v in e}$ _incidence set_ of $v$ in $G$ respectively.
The degree function $deg(G): V(G) to NN$ given by $deg(G, v) := card(I_(G)(v))$ defines the _degree_ of a node $v$ by the number of edges incident on it.

#definition(name: "Walks and Paths")[
  Let $G$ be a graph.
  A #emph["walk"] along $G$ is meant to denote a possible way of visiting the vertices of $G$ by traveling along the edges.
  Given a natural number $k in NN$, we define a #define[walk of length $k$ on $G$] to be a function $f: (k + 1) to V(G)$ such that, for each $i lt k$, we have ${f(i), f(i + 1)} in E(G)$.
  #marginalis[
    This means that consecutive nodes $f(i)$ and $f(i + 1)$ along the walk must be connected by an edge in $G$.
  ]
  A _path_ is a walk that does not repeat any nodes;
  more formally, a #define[path of length $k$ on $G$] is an injective walk of length $k$ on $G$.
  #marginalis[
    Notice the _length_ of a walk or path is determined by the number of _edges_ involved, not the number of _vertices._
  ]
]

#definition(name: "Circuits and Cycles")[
  Given $k in NN$, a #define[circuit of length $k$] on a graph $G$ is a walk $w: k + 1 to V(G)$ that starts and ends at the same place, meaning $w(0) = w(k)$.
  If a circuit does not repeat any nodes other than the first and last ones,
  #marginalis[... meaning the walk is essentially a _path_ except for the fact that the first and last nodes are the same...]
  then we call this circuit a #define[cycle].
  // A graph that contains no cycles is usually called #define[acyclic].
]

#definition(name: "Connectivity and Trees")[
  A graph is said to be _connected_ precisely when every distinct pair of nodes is connected by a path.
  Formally, given a graph $G$, we say #define[$G$ is connected] _iff_ the following is satisfied.
  $
    (forall v, w in V(G))(exists k in NN)(exists p: k + 1 to V(G))(path(p) and p(0) = v and p(k) = w)
  $
  // An _acyclic_ graph---a graph that does not contain any cycles---is called a #define[forest].
  // A _connected_ acyclic graph is called a #define[tree].
  Any graph that is connected and does not contain any cycles is called a #define[tree].
  Given a tree $T$ and a node $v in V(T)$, we say $v$ is a #define[leaf] _iff_ $deg(T, v) = 1$;
  any vertex that is not a leaf is usually called an #define[internal] node.
  #marginalis[
    In other contexts, you will encounter the notion of a _rooted_ tree, which is a tree containing a distinguished node called _"the root"_ of the tree.
    In those cases, the #define[height] of a tree is defined to be the length of the longest path between the root node and any leaf in the tree.
  ]
]

#v(1.0em)

// 1. There are currently a total of $632$ students enrolled for the 2026 Spring semester of #mono("CS173") at the University of Illinois Urbana-Champaign.
//   Prove that two of these students must have been born on the same day of the year.

1. Show that, for every tree $T$, there exists a _unique_ path between any two vertices in $T$.

2. Prove that every tree $T$ satisfying $card(V(T)) gt.eq 2$ must contain at least one leaf node.

3. Use induction to prove that every nonempty tree $T$ satisfies $card(V(T)) = card(E(T)) + 1$.

4. Prove any graph $G$ satisfying $(forall v in V(G))(deg(G, v) gt.eq (card(V(G)) - 1)/2)$ is connected.
