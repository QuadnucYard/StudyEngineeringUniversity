## Ch3-exercises

Please construct a **DFA** **with minimum states** for the following regular expression. (10%)
1. `aa*(bab*a)*(a|b)b*`
2. `a(bab*a)*(a|b)b*`
3. `(ab*a)*(a|b)b*`
4. `((ba*)*a)*(a|b)`
5. `aa*((bab*a)*(a|b)b*)*`

## Ch4-Exercises

1.Please eliminate the left recursion and extract maximum common left factors (if there are) from the following context free grammar, and then decide the resulted grammar is whether a LL(1) grammar by **constructing the related LL(1) parsing table**. (20%)
$S \to iCtS~|~iCtSeS~|~a$
$C \to C~\mathrm{or}~D | D$
$D \to D or E | E$
$E \to (C) | b$

## Ch5-exercises

1.Please construct **an annotated parse tree** for the input string `4+@(5*@6+9)*7` where the syntax-directed definition is as following :

| Productions     | Semantic Rules            |
| --------------- | ------------------------- |
| $E \to E_1 * T$ | $E.val = E_1.val * T.val$ |
| $E \to T$       | $E.val = T.val$           |
| $T \to T_1 + F$ | $T.val = T_1.val * F.val$ |
| $T \to F$       | $T.val = F.val$           |
| $F \to (E)$     | $F.val = E.val$           |
| $F \to @F_1$    | $F.val = 0 - F_1.val$     |
| $F \to i$       | $F.val = i.lexval$        |

## Exercises-Ch7

1.We assume that the storage organization and the form of activation record used in C language program run-time stack storage allocation are as following. Please **construct the run-time stack map when it gets the maximum size for the first time** for the following C program (10%).

The C program is as the following:

```c
#include <stdio.h>
int x, y;

int main()
{
	x = 5;
	y = f(x);
}

int f(int n)
{
	if (n <= 1)
		return 1;
	else if ( n == 2)
		return 2;
	else
	{
		int t1, t2, t3, t4, t;
		t1 = f(n - 1);
		t2 = f(n - 2);
		t3 = f(n - 3);
		t4 = t1 + t2
		t = t3 + t4;
		return t
	}
}
```

**Notes:**
 1. Here we assume that the caller’s sp of Main function is the start address of global variable data area, and the returned address in the activation record of a function (including Main function) is filled by the operating system automatically, you might not care it.
 2) The initial value of variable `X` is `5`, the start address of stack used in the program is `K`.
 3) The stack map may get its maximum size for several times, here we ask you draw the stack map at maximum size for the first time.

2.We assume that the storage organization and the form of activation record used in C language program run-time stack storage allocation are as above. Please **construct the run-time stack map when it gets the maximum size** for the following C program (10%).

The C program is as the following:

```c
#include <stdio.h>
int x, y, z;

int main()
{
	x = 40;
	y = 35;
	z = f(x, y);
}

int f(int m, int n)
{
	if (n > m) {
		int t;
		t = f(n, m);
		return t;
	} else if (n == 0)
		return m;
	else {
		int t1, t2;
		t1 = m % n; // remainder of m/n
		t2 = f(n, t1);
		return t2
	}
}
```

**Notes:**
1. Here we assume that the caller’s `sp` of Main function is the start address of global variable data area, and the returned address in the activation record of a function (including Main function) is filled by the operating system automatically, you might not care it.
 2) The initial value of variable `X` and `Y` are `40` and `35` respectively, the start address of stack used in the program is `K`.

## Ch9—exercises

1.Please **construct the DAG** for the following basic block. We assume that only **variable P be used later**, please optimize the block and **rewrite the block** in optimized code form.

```c
E=A+B
F=A-B
G=E*F
H=F+G
I=F-G
L=I+H
M=I*I
M=2*M
N=L+M
P=N+M
```

2.Please **construct the DAG** for the following basic block, optimize the block and **rewrite the block** in optimized code form. Note that we assume **only Variable L would be used later**

```c
A=B*C
D=B/C
E=A+D
F=2*E
G=B*C
H=G*G
F=H*G
L=F
M=L
```
