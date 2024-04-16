#import "@preview/algo:0.3.3": algo, i, d, comment, code
#set text(font: "New Computer Modern") 
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms Assignment \#3*
])
#align(right, [資工三 110590004 林奕廷])
#set heading(numbering: "1.a.")
#set enum()
=
== 
By the definition of maximum subarray, when we want to obtain the maximum
subarray after adding a new element $A_(j+1)$, we can either include the new
element in the maximum subarray or not. If we do not include the new element,
the new maximum subarray will be the maximum subarray of $A[1 .. j]$. If we
include the new element, the new maximum subarray must be a subarray that ends
at $A_(j+1)$, which can be represented as $A[i .. j+1]$ where $1 <= i <= j+1$.

==
To complete the algorithm, we need to further discuss the case that the new
element is included in the maximum subarray. In such case, the new maximum
subarray may be either
+ the subarry that start from the original subarray 
+ the subarray that starts after the last element of original maximum subarry 
and ends at the new element. The new maximum subarray can be represented as $A[i .. j+1]$ where $1 <= i <= j+1$.
#algo(
  title: "Maximum Subarray",
  parameters: ("A", "n"),
)[
  let $"max" <- 0 $\
  let $"vac" <- 0$\
  let $"prefix" <- 0$\
  for $i <- 1$ to $n$ do :#i\
  if $"prefix" + A_i >= "max" "and" "prefix" > "max" + "vac"$ :#i#comment[case 1.]\
  $"max" <- "prefix" + A_i$\
  $"vac, pre" <- 0$#d\
  else if $"max" + "vac" + A_(i) >= "max"$ :#i#comment[case 2.]\
  $"max" <- "max" + "vac" + A_(i)$\
  $"vac, pre" <- 0$#d\
  else :#i\
  $"vac" <- "vac" + A_i$\
  if $"prefix" + A_i < 0$ :#i\
  $"prefix" <- 0$#d\
  else :#i\
  $"prefix" <- "prefix" + A_i$#d\
  end if#d\
  end if#d\
  end for#i\
]
The algorithm has a linear time complexity of $O(n)$.

= 

#algo(
  title: "Shortest Path Around",
  parameters: ("P", "A", "B"),
)[
  $"CH" <- "ConvexHull"(P)$#comment[$n lg n$]\
  if line $"AB"$ does not intersect with $"CH"$ :#i\
  return $"Length"(A, B)$#d\
  end if\
  let $t_("A1"), t_("A2"), t_("B1"), t_("B2")$ The tangent points $"for"$ $A$ $"and"$ $B$ on
  the $"CH"$\
  return $min \(A "to" t_A + "Path around CH"(t_A, t_B) + B "to" t_B\)$
   
]
Cause the convex hull is a convex polygon, the path around the convex hull is
the shortest path between two points that outside the convex hull. By
constructing the tangent points, we can easily obtain 2 x 2 possible shortest
paths. The shortest path around the convex hull is the shortest path among these
4 paths. If the line $"AB"$ does not intersect with the convex hull, the
shortest path is the direct path between $A$ and $B$.\
Since we know that the convex hull has at most $n$ vertices, the time complexity
for constructing the convex hull is $O(n lg n)$. And the time complexity for
finding the tangent points is $O(n)$. To construct 4 possible shortest paths,
the time complexity is $O(n)$. Therefore, the overall time complexity is $O(n lg n)$.

= 
Let P be the sorting problem, Q be the closet number problem. Q can reduce to P
in $O(n)$ time by doing linear search in the sorted sequence. And we know that
the sorting problem have a tight lower bound of $O(n lg n)$ time complexity.
Therefore, the closet number problem also has a tight lower bound of $O(n lg n)$ time
complexity.
