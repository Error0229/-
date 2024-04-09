#import "@preview/algo:0.3.3": algo, i, d, comment, code
#set text(font: "New Computer Modern") 
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms Assignment \#2*
])
#align(right, [資工三 110590004 林奕廷])
= 1.
== (a)
#algo(title: "Alternating Disk", parameters: ("n", "d"))[
  for $i <- 1$ to $n$ do:#i\
  for $j <- i$ to $2n - 1$ do:#i\
  if $d_j$ is dark and $d_(j+1)$ is light then:#i\
  swap $d_j$ and $d_(j+1)$#d\
  end if#d\
  end for#d\
  end for\
] 
The total number of swaps is $n + (n-1) + (n-2) + ... + 1 = (n(n+1))/2$.

== (b)
Due to the fact that moving the dark disk at position $1 + 2k$ to $n - k$ requires
at least $n - k$ swaps\( k from 0 to n - 1\), the total number of swaps is $1 + 2 + 3 + ... + n = (n(n+1))/2$.\
Hence the lower bound is $Omega(n^2)$. And the lower bound is tight because the
given algorithm has a complexity of $O(n^2)$.\
= 2.
$"let" k = lg n$\
#align(
  left,
)[
  #block(
    $
      T(n) &=2T(n/2) + n/(lg n)\
           &= 2^k + n/(lg n) + 2 (n/2)/(lg (n/2)) + 4 (n/4)/(lg (n/4)) + ... + 2^(k-1) (n / 2^(k-1))/(lg n/2^(k-1))\
           &= n + n sum^(k-1)_(i=0) 1/(lg n - i)\
           &<= n + n sum^(k-1)_(i=0) 1/(lg n - k + 1) = n + n lg n = O(n lg n)
    $,
  )
]
Assume $forall m \(m < n -> T(m) <= c dot m lg m \)$\
#align(left)[
  #block($
    T(n) &<= 2 c n/2 lg n/2 + n/(lg n)\
         &= c n (lg n - 2) + n/(lg n)\
         &= c n lg n - n(2c + 1/(lg n))\
         &<= c n lg n\
  $)
]
Q.E.D.

#set enum(numbering: "1°")
= 3.
a. 
$T(n) = 2T(n/2) + c$\
$a = 2, b = 2, f(n) = c $\
+ $n^(log_b a) = n^1 = n$\
+ $h(m) = c/n = O(m^(-1)), -1 <= 0$\
+ $T(n) = n[T(1) + O(1)] = O(n)$\
b.
$T(n) = 4T(n/2) + c n$\
$a = 4, b = 2, f(n) = c n$\
+ $n^(log_b a) = n^2$\
+ $h(m) = (c m)/m^2 = c/m = O(m^(-1)), -1 <= 0$\
+ $T(n) = n^2[T(1) + O(1)] = O(n^2)$\
c.
$T(n) = 4T(n/2) + c n^3$\
$a = 4, b = 2, f(n) = c n^3$
+ $n^(log_b a) = n^2$\
+ $h(m) = (c m^3)/m^2 = c m = O(m), 1 > 0$\
+ $T(n) = n^2[T(1) + O(n)] = O(n^3)$\
d.
$T(n) = 4T(n/3) + c n$\ 
$a = 4, b = 3, f(n) = c n$\
+ $n^(log_b a) = n^(log_3 4) = n^(1.26)$\
+ $h(m) = (c n)/(n^1.26) = O(n^-0.26), -0.26 < 0$
+ $T(n) = n^(log_3 4)[T(1) + O(1)] = O(n^(1.26))$
Result: a < d < b < c

= 4.
#algo(
  title: "Multiply",
  parameters: ("x", "y",),
)[
  if $x = 0$ or $y = 0$ then:#i\
  return 0#d\
  end if\
  $n <- max("length(x)", "length(y)")$\
  if n = 1 then:#i\
  return $ x dot y$#d\
  end if\
  $x_l, x_h <- "leftmost" floor(n/2) "bits of" x, "rightmost" floor(n/2) "bits of" x$\
  $y_l, y_h <- "leftmost" floor(n/2) "bits of" y, "rightmost" floor(n/2) "bits of" y$\
  $z_0 <- "Multiply"(x_l, y_l)$\
  $z_1 <- "Multiply"(x_h, y_h)$\
  $z_2 <- "Multiply"(x_h + x_l, y_h + y_l) - z_0 - z_1$\
  return $z_1 dot 2^(n) + z_2 dot 2^(n/2) + z_0$\
]

$T(n) = cases(3T(n/2) + O(n) &"if" n > 1, O(1) &"otherwise")$\

By master theorem, $a = 3, b = 2, f(n) = n$\
+ $n^(log_b a) = n^1.58$\
+ $h(m) = (c m)/m^(1.58) = O(n^(-0.58)), -0.58 < 0$\
+ $T(n) = n^(1.58)[T(1) + O(1)] = O(n^(1.58))$\
Q.E.D.
