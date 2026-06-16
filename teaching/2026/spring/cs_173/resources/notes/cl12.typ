#import "@local/article:0.0.1": *

#show: article.with(
  author: "Daniel Gonzalez Cedre",
  title: "Clavicula 11",
  number: 11,
  date: datetime(year: 2026, month: 05, day: 01),
)

= Putting Things Together

#definition(name: "Graph")[
  henlo
]

#definition(name: "Path")[
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

#definition(name: "Cycle")[
  Given $k in NN$, a #define[circuit of length $k$] on a graph $G$ is a walk $w: k + 1 to V(G)$ that starts and ends at the same place, meaning $w(0) = w(k)$.
  If a circuit does not repeat any nodes other than the first and last ones,
  #marginalis[... meaning the walk is essentially a _path_ except for the fact that the first and last nodes are the same...]
  then we call this circuit a #define[cycle].
  // A graph that contains no cycles is usually called #define[acyclic].
]
