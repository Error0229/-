#import "@preview/algo:0.3.3": algo, i, d, comment, code
#set text(font: "New Computer Modern") 
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms Assignment \#4*
])
#align(right, [資工三 110590004 林奕廷])
#set heading(numbering: "1.a.")
#set enum()
=
== 
By the given definition, the maximum will appear in root of max-heap, and
minimum will appear in the root of min-heap; Time complexity of finding the
maximum and minimum is $O(1)$.

== 
Assume the array $A$ has a length of $n$. If we store the left subtree at the
left $n/2$ elements of the array and the right subtree at the right $n/2$ elements
of the array, we can obtain the corresponding element at the other heap by
simply $plus.minus n/2$ to the given index, which is $O(1)$.

==

First, we insert the value at min-heap, and then check whether the deap property
is satisfied. If not, swap the inserted value from min-heap to max-heap by the
corresponding index. And do a heapify on the max-heap. The time complexity of
this operation is $O(log n)$.

=
A Binomial tree $B_k$ of order $k$ is defined recursively as follows:
1. $B_0$ consists of a single node.
2. $B_k$ is formed by taking two disjoint Binomial trees $B_{k-1}$ and making one
  tree's root the leftmost child of the other tree's root.

== 
1. Base Case $k=0$:
  - $T$ is a $B_0$ tree.
  - $T_0$ is a single node $v$.
  - There are no other nodes to attach.
  - This satisfies the conditions trivially.

2. Induction Hypothesis:
  - Assume the property holds for $B_{k-1}$ trees.

3. Inductive Step:
  - Consider a binomial tree $B_k$.
  - By definition, $B_k$ is formed by linking the root of one $B_{k-1}$ tree to the
    root of another $B_{k-1}$ tree.
  - Let $T$ be this $B_k$ tree with handle $v$.
  - Let $T'$ and $T''$ be the two $B_{k-1}$ trees that were linked to form $B_k$.
  - By the induction hypothesis, $T'$ and $T''$ can be decomposed into disjoint
    trees $T_0, T_1, dots, T_{k-2}$ with roots $r_0, r_1, dots, r_{k-2}$ respectively,
    such that each $T_i$ is a $B_i$ tree and the roots are linked appropriately.

4. Construction of $T$:
  - To form $T$, we link the root $r_{k-1}$ (which is the root of one $B_{k-1}$ tree)
    to the handle $v$.
  - The trees $T_0, T_1, dots, T_{k-2}$ remain as $B_0, B_1, dots, B_{k-2}$ respectively.
  - The root $r_{k-1}$ is linked to $r_0$, and $r_i$ is linked to $r_{i+1}$ for $0 \le i < k-1$.

This construction satisfies the given conditions:
1. Each $T_i$ is a $B_i$ tree for $0 \le i \le k-1$.
2. $T$ is formed by attaching $v$ to $r_0$, and $r_i$ to $r_{i+1}$ for $0 \le i < k-1$.

== Conclusion
By induction, we have shown that the given characterization holds for any $B_k$ tree.
Thus, the proof is complete.
