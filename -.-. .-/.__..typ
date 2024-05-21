#import "@preview/lovelace:0.2.0": *
#show: setup-lovelace
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

1. Base Case $k=0$:
  - $T$ is a $B_0$ tree.
  - $T_0$ is a single node $v$.
  - There are no other nodes to attach.
  - This satisfies the conditions trivially.

2. Induction Hypothesis:
  - Assume the property holds for $B_(k-1)$ trees.

3. Inductive Step:
  - Consider a binomial tree $B_k$.
  - By definition, $B_k$ is formed by linking the root of one $B_(k-1)$ tree to the
    root of another $B_(k-1)$ tree.
  - Let $T$ be this $B_k$ tree with handle $v$.
  - Let $T'$ and $T''$ be the two $B_(k-1)$ trees that were linked to form $B_k$.
  - By the induction hypothesis, $T'$ and $T''$ can be decomposed into disjoint
    trees $T_0, T_1, dots, T_(k-2)$ with roots $r_0, r_1, dots, r_(k-2)$ respectively,
    such that each $T_i$ is a $B_i$ tree and the roots are linked appropriately.

4. Construction of $T$:
  - To form $T$, we link the root $r_(k-1)$ (which is the root of one $B_(k-1)$ tree)
    to the handle $v$.
  - The trees $T_0, T_1, dots, T_(k-2)$ remain as $B_0, B_1, dots, B_(k-2)$ respectively.
  - The root $r_(k-1)$ is linked to $r_0$, and $r_i$ is linked to $r_(i+1)$ for $0 <= i < k-1$.

This construction satisfies the given conditions:
1. Each $T_i$ is a $B_i$ tree for $0 <= i <= k-1$.
2. $T$ is formed by attaching $v$ to $r_0$, and $r_i$ to $r_(i+1)$ for $0 <= i < k-1$.
By induction, we have shown that the given characterization holds for any $B_k$ tree.
Thus, the proof is complete.

=
By using QuickSelect and select the rank $floor(k/2) dot n/k$ number, we can
roughly divide the input $S$ into two equal parts $S_1, S_2$ with length $n/2$.
Then, we can recursively apply the algorithm to $S_1$ and $S_2$ to find the
remaining $k-1$ elements of the output. The running time is defined by the
recurrence 
$ T(n) = cases(2T(n/2) + O(n) &"if" n>k, 1 &"elsewhere") $, which has a $O(n log k)$ time
complexity. 
#algorithm(
  caption: [Find Elements],
  pseudocode(
    no-number,
    [*input:* Sequence $S$ with length $n$ and partition count $k$],
    no-number,
    [*output:* Array $R$ that contains numbers in $S$ that have rank $n/k,(2n)/k,...,((k-1)n)/k$],
    [*define* $R$ as an empty list],
    [*function* $"Find-Elements"(S, k)$],
    ind,
    $ n = "length of S" $,
    $ i = floor(k/2)$,
    $ "pivot" = "QuickSelect"(S, floor(i dot n/k)) $,
    $"Push Find-Elements(" S[1 " to "floor(i dot n/k)], i)" to" R$,
    $"Push Find-Elements(" S[floor(i dot n/k)+1 " to " n], i)" to" R$,
    [*return* $"pivot"$],
  ),
)

Example:

Assume we have a sequence $S = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]$ with length $n = 11$ and
partition count $k = 3$. Our goal is to find the elements in $S$ that have ranks $n/k, (2n)/k, dots, (k-1)n/k$.

1. Initial Call:
  - $S = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 7]$
  - $n = 12$
  - $k = 3$

2. First Partition:
  - Calculate $(floor(k/2)) dot (n)/(k) = 2 dot 12/3 = 8$
  - Use QuickSelect to find the element at rank $8$ in $S$.
  - Let's say QuickSelect returns the 8th smallest element which is $5$.
  - Now, $S$ is roughly divided into $S_1 = [3, 1, 4, 1, 2, 2]$ and $S_2 = [9, 6, 5, 5, 7]$.
 
3. Recursive Calls on $S_1$:
  - $S_1 = [3, 1, 4, 1, 2, 2]$
  - $k = 1$ 
  - Since $k = 1$, the algorithm terminates and returns the array sorted with its
    median.
  - In this example, $S_1$ would be processed to give an array where the median is
    chosen: let's say it is $3$.
 
4. Recursive Calls on $S_2$:
  - $S_2 = [9, 6, 5, 5, 7]$
  - $k = 1$
  - Similarly, for $S_2$, find the median using QuickSelect or a similar method.
  - Let's assume it returns $9$.
 
5. Combine Results:
  - Combine the results from $S_1$ and $S_2$ and include the pivot element $3$.
  - The resulting array $R$ will be $[3, 5, 9]$, representing the elements at ranks $12/3, 2 dot 12/3,3 dot 12/3$.
 
 
= 
Use QuickSelect to find the median of the input array $S$. Then calculate the
difference between the median and each element of $S$ and store the difference
with the number's index in $M$. Finally, find the k-th smallest number index $i$ in
the array $M$ by using QuickSelect. And all the elements in the array $S$ that
correspond to the first $i$ elements in the array $M$ are the output. The time
complexity of this algorithm is $O(n)$.
 
#algorithm(
  caption: [Find Closet],
  pseudocode(
    no-number,
    [*input:* Sequence $S$ with length $n$ and range number $k$],
    no-number,
    [*output* A array contains $k$ numbers that are closet to the median of $S$],
    [*define* $M$ as an empty list],
    [*function* $"Find-Closet"(S, k)$],
    ind,
    $ n = "length of S" $,
    $ "median" = "QuickSelect"(S, floor(n/2)) $,
    $ M = "abs("S - S"[median])" $,
    $ i = "QuickSelect"(M, k) $,
    $ "result" = "S[ All the corresponding numbers of M[1 to i] ]"$,
    [*return* $"result"$],
  ),
)
 
Example: 
$S = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5], k = 3$
1. Use QuickSelect to find the median of $S$ :
- Median is the 6th element in the sorted sequence since $n = 11$ and $floor(11/2)
  = 5$ .
- Sorted $S$: $[1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]$
- Median is 4.
2. Calculate the absolute differences between each element in $S$ and the median,
  and store these in $M$: 
- $M = [1, 3, 0, 3, 1, 5, 2, 2, 1, 1, 1]$
3. Use QuickSelect to find the $k$ smallest differences:
- Find the 3rd smallest difference in $M$, which is 1.
4. Select the corresponding elements in $S$:
  - Elements in $S$ corresponding to the smallest differences: $[3, 4, 5]$.
 
Output: $[3, 4, 5]$
