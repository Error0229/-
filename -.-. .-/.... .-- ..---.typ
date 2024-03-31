#import "@preview/algo:0.3.3": algo, i, d, comment, code
#set text(
  font: "New Computer Modern"
) 
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms
Assignment \#2*
])
#align(right, [資工三 110590004 林奕廷])
= 1.
== (a)
  #algo(
    title: "Alternating Disk",
    parameters: ("n", "d")
  )[
    for $i <- 1$ to $n$ do:#i\
      for $j <- i$ to $2n - 1$ do:#i\
        if $d_j$ is dark and $d_(j+1)$ is light then:#i\
          swap $d_j$ and $d_(j+1)$#d\
        end if#d\
      end for#d\
    end for\
  ] 
  The total number of swaps is $n^2$ in the worst case, which occurs when the disks are in the reverse order and each black disk must be moved n times.
== (b)
?

= 2.

$T(n)=2T(n/2) + n/(lg n)$\
$ k = lg n$\
$T(n) = 2^k + n/(lg n) + 2 (n/2)/(lg (n/2)) + 4 (n/4)/(lg (n/4)) + ... + 2^(k) (n / 2^k)/(lg n/2^k)$\
$T(n) = n + sum^k_(i=0) n/(lg n - i)$
