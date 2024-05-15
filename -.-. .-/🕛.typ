#set text(font: "New Computer Modern")
#align(center, text(16pt)[
  *Design and Analysis of Computer Algorithms Sample midterm*
])

#set enum(numbering: "1. 1")
+ \ 
  + $T(n) &= T(n-1) + 1/n\
         &= T(n-2) + 1/(n-1) + 1/n\
         &= sum_(i = 3)^n 1/i + d\
         &= O(log n) "by harmonic series"\ $
   
  + $T(n) &= 2 T(n/2) + n / (log n)\
         &= 2^k + n/(lg n) + 2 (n/2)/(lg (n/2)) + 4 (n/4)/(lg (n/4)) + ... + 2^(k-1) (n / 2^(k-1))/(lg n/2^(k-1))\
         &= n + n sum^(k-1)_(i=0) 1/(lg n - i)\
         &<= n + n sum^(k-1)_(i=0) 1/(lg n - k + 1) = n + n lg n = O(n lg n) $
   
  + $T(n) &= 4 T(n/2) + n^2 sqrt(n)\
         &= n^2 sqrt(n) $
  + $T(n) &= 4 T(n/2) + n^2\
         &= n^2 lg n $
  + $T(n) &= 2 T(n/4) + sqrt(n)\
         &= sqrt(n) lg n $
+ \ 
  + True
  + False
  + True
  + False
  + True
  + False
  + True
  + False
+ \
  + False, we can't obtain the solution from B back to A
  + True
  + False, the the new lower bound is $O(n)$
  + False, the lower bound is unknown
+ \
  $T(n) = cases(T(n/2) + T(n/4) + T(n/8) + 2n & "if" n > 1, 1 & "if" n = 1)$
  +
