1. $\{3n + 2 | n \in N\}$  
### Ans:
- top-down  
the set S is a subset of $N$ which satisfy that - a natural number n is in S if and only if either:  
  1.$n = 2$  
  2.$n-3 \in S$.

- bottom-up  
The set S is the smallest subset of $N$ satisfying the following two properties:  
 1.$2 \in S$  
 2.if $n \in S$, then $n + 3 \in S$.

- rules of inference  
  -  $$2 \in S $$
  - $$\frac{n \in S}{n+3 \in S}$$

2. $\{2n + 3m + 1 | n, m \in N\}$
### Ans:
- top-down  
the set S is a subset of $N$ which satisfy that - a natural number n is in S if and only if either:  
  1.$n = 1$  
  2.$n-2 \in S$.  
  3.$n-3 \in S$.

- bottom-up  
The set S is the smallest subset of $N$ satisfying the following two properties:  
 1.$1 \in S$   
 2.if $n \in S$, then $n + 2 \in S$.  
 3.if $n \in S$, then $n + 3 \in S$. 

- rules of inference  
  -  $$1 \in S $$
  - $$\frac{n \in S}{n+2 \in S}$$
  - $$\frac{n \in S}{n+3 \in S}$$

2. $\{2n + 3m + 1 | n, m \in N\}$
### Ans:
- top-down  
the set S is a subset of $N$ which satisfy that - a natural number n is in S if and only if either:  
  1.$n = 1$  
  2.$n-2 \in S$.  
  3.$n-3 \in S$.

- bottom-up  
The set S is the smallest subset of $N$ satisfying the following two properties:  
 1.$1 \in S$   
 2.if $n \in S$, then $n + 2 \in S$.  
 3.if $n \in S$, then $n + 3 \in S$. 

- rules of inference  
  -  $$1 \in S $$
  - $$\frac{n \in S}{n+2 \in S}$$
  - $$\frac{n \in S}{n+3 \in S}$$

3. $\{(n, 2n + 1) | n \in N\}$
### Ans:
- top-down  
the set S is a subset of $N \times N$ which satisfy that - any pair (n, m) is in S if and only if either:  
  1.$n=0, m=1$.  
  2.$(n-1, m-2)\in S$.

- bottom-up  
The set S is the smallest subset of $N \times N$ satisfying the following two properties:  
 1.$(0, 1) \in S$   
 2.if $(n, m) \in S$, then $(n+1, m+2) \in S$.  

- rules of inference  
  -  $$(0, 1) \in S $$
  - $$\frac{(n, m) \in S}{(n+1, m+2) \in S}$$

4. $\{(n, n^2 ) | n \in N\} $
### Ans:
- top-down  
the set S is a subset of $N \times N$ which satisfy that - any pair (n, m) is in S if and only if either:  
  1.$n=0, m=0$.  
  2.$(n-1, m-2n+1)\in S$.

- bottom-up  
The set S is the smallest subset of $N \times N$ satisfying the following two properties:  
 1.$(0, 0) \in S$   
 2.if $(n, m) \in S$, then $(n+1, m+2n+1) \in S$.  

- rules of inference  
  -  $$(0, 1) \in S $$
  - $$\frac{(n, m) \in S}{(n+1, m+2n+1) \in S}$$