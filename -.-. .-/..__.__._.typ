
#import "@preview/lovelace:0.2.0": *
#show: setup-lovelace
#set text(font: "New Computer Modern") 
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms Assignment \#5*
])
#align(right, [資工三 110590004 林奕廷])
#set heading(numbering: "1.a.")
#set enum()
=
== 
Since the bucket sort use the insertion sort to sort the elements in each
bucket, the worst case will happen when all the elements are in the same bucket.
In this case, the time complexity of the bucket sort will be $O(n^2)$.

== 
To make the worst case time complexity of the bucket sort to be $O(n log n)$, we
can use the merge sort to sort the elements in each bucket. Since the quick sort
has the time complexity of $O(n log n)$, the time complexity of the bucket sort
will be $O(n log n)$.

= 
To add a cost to the rod-cutting problem, we can simply update the optimal
substructure of the problem. The new optimal substructure is as follows:
$ "CutRod"(n) = max(p_n, max(p_i + "CutRod"(n - i - 1) - c) "for" i in 1... n-1) $

#algorithm(
  caption: [Cutting a rod with cost],
  pseudocode(
    no-number,
    [*input:*\ Sequence of prices $p_1, p_2, dots, p_n$,\ Length of the rod $n$, \ Cost
      of cutting the rod $c$],
    no-number,
    [*output:* Maximum revenue that can be obtained by cutting the rod],
    no-number,
    [*define* $"dp"[0...n]$ as an array],
    no-number,
    [*function* $"Cutting-Rod-With-Cost"(P, n, c)$],
    ind,
    [*for* $i = 1$ *to* $n$],
    ind,
    [*let* $"q" = p_i$],
    [*for* $j = 1$ *to* $i - 1$],
    ind,
    [$"q" = max(q, p_i + "dp"[i - j] - c)$],
    ded,
    [$"dp"[i] = q$],
    ded,
    [*return* $"dp"[n]$],
  ),
)
The time complexity of the above algorithm is $O(n^2)$.
#pagebreak()

=
#algorithm(caption: [Longest palindromic subsequence], pseudocode(
  no-number,
  [*Input:* string $s$],
  no-number,
  [*Output:* longest palindromic subsequence],
  $l <- "length of" s$,
  $"dp is a 2D array of size" l times l$,
  [*for* $i$ = 1 *to* $l$],
  ind,
  $"dp"[i][i] <- 1$,
  ded,
  [*for* $k = 2$ *to* $l$],
  ind,
  [*for* $i$ = 1 *to* $l - k + 1$],
  ind,
  $j <- i + k - 1$,
  [*if* $s[i] = s[j]$ *then*],
  ind,
  $"dp"[i][j] <- "dp"[i + 1][j - 1] + 2$,
  ded,
  [*else*],
  ind,
  $"dp"[i][j] <- max("dp"[i + 1][j], "dp"[i][j - 1])$,
  ded,
  ded,
  ded,
  no-number,
  [*Construct the longest palindromic subsequence*],
  [*if* $"dp"[1][l] = 1$ *then*],
  ind,
  [*return* $s[1]$],
  ded,
  [*let* $"result" <- "empty string"$],
  $i <- 1$,
  $j <- l$,
  [*repeat*],
  ind,
  [*if* $"dp"[i][j - 1] = "dp"[i][j]$ *then*],
  ind,
  $j <- j-1$,
  ded,
  [*else*],
  ind,
  $"result" <- s[j] + "result"$,
  $i <- i + 1$,
  $j <- j - 1$,
  [*if* $"dp"[i][j] = 1$ *then*],
  ind,
  [*if* $"dp"[i - 1][j + 1] = 2$ *then*],
  ind,
  [*return* $"reverse(result)" + "result"$],
  ded,
  [*else*],
  ind,
  [*return* $"reverse(result)" + s[j] + "result"$],
  ded,
  ded,
  ded,
  [*end*],
))

The time complexity of the above algorithm is $O(n^2)$.

#pagebreak()

=
