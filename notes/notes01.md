(Instructor's lecture notes)

See https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/resources/mit6_042jf10_chap03/

# Lecture 1 - Proofs of correctness, induction

What is a proof?

> A mathematical proof is a verification of a proposition by a chain of logical deductions from a set of axioms.

> 2 + 3 = 5
- Proposition is a statement that is either true or false.

> $\forall n \in \N, n^2 + n + 41$ is a prime number.
- Quantifier $\forall$. this is referred to as the universe of discourse. It's the space of all the things we're talking about. We're only talking about natural numbers here. 
- A predicate is a proposition whose truth depends on the value of a variable-- in this case, n.

For the proposition to be true, the predicate must be true for every natural number. 
let's try 0 ... 39.

> "Now, this is a great example because in a lot of fields-- physics, for example; statistics, often-- you checked 40 examples. That's above and beyond the call of duty. It's always true. So yeah, this must be true, right? No, wrong. Often, you'll see this in a lot of scientific fields. It is not true. Can anybody give me an example of n for which n squared plus n plus 41 is not prime?"

> Ex.  $a^4 + b^4 + c^4 = d^4$ has no positive integer solutions
- Euler's conjecture, 1769. Disproved, 1988, Noam Elkies

> ${\displaystyle 95800^{4}+217519^{4}+414560^{4}=422481^{4}}$

So the correct statement:

> $\exists a,b,c,d \in \N^{+}, a^4 + b^4 + c^4 = d^4$ 
another quantifier "there exists"

>> Why bother? "This equation is an example of what's called an elliptic curve-- elliptic curve. You study these if you're really a specialist in mathematics in graduate school, or if you work for certain three-letter agencies because it's central to the understanding of how to factor large integers."

>> "And I said, OK, who cares about factoring? Well, factoring is the way to break cryptosystems like RSA, which are used for everything that we do electronically today. You have a Paypal account. You buy something online. You're using SSL. They're all using cryptosystems, almost all of which are based on number theory. And in particular, they're based on factoring. And if you can find good solutions to things like this, or solutions to things like this, all of a sudden, you can get an angle and a wedge on factoring. And it's because of that that now RSA uses 1,000 digit moduluses instead of hundred digit moduluses like they used to use, because people figured out how to factor and how to break the cryptosystem. If you could break those cryptosystems, well, you can't rule the world, but it's close."

> four color map theorem, states that no more than four colors are required to color the regions of any map so that no two adjacent regions have the same color.

One proposed proof was given by Alfred Kempe in 1879, which was widely acclaimed, shown false 11 years later. 
- one issue: proof by picture ... doesn't work well

---

> Ex. every even integer greater than two is the sum of two prime numbers.

Christian Goldbach (1742). Goldbach's conjecture is one of the oldest unsolved problems in number theory and in all of mathematics.

---



A template for induction proofs & a clean writeup
3.2.3 and 3.2.4 in https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/resources/mit6_042jf10_chap03/


---

>> "During the development of MIT’s famous Stata Center, as costs rose further and
further beyond budget, there were some radical fundraising ideas. One rumored
plan was to install a big courtyard with dimensions $2^n \times 2^n$
(as shown in Figure 3.1
for the case where n = 3) and to have one of the central squares (In the special case n = 0, the whole courtyard consists of a single central square; otherwise,
there are four central squares.) be occupied by a
statue of a wealthy potential donor (who we will refer to as “Bill”, for the purposes
of preserving anonymity). A complication was that the building’s unconventional
architect, Frank Gehry, was alleged to require that only special L-shaped tiles (show
in Figure 3.2) be used for the courtyard. It was quickly determined that a courtyard
meeting these constraints exists, at least for n = 2. (See Figure 3.3.) But what
about for larger values of n? Is there a way to tile a $2^n \times 2^n$ courtyard with L-shaped tiles around a statue in the center?

- unsuccessful attempt : predicate with "central square" in statement
- successful : generalize - strengthen the IH -- counter intuitive, but sometimes making an even more expansive statement makes it easier to prove with induction.
    - also gives a constructive algorithm to actual find the tiling, along with the stronger result

>> Sometimes finding just the right induction hypothesis requires trial, error, and insight.


---
## Invariants

>> One of the most important uses of induction in computer science involves proving
that a program or process preserves one or more desirable properties as it proceeds.
A property that is preserved through a series of operations or steps is known as an
invariant. Examples of desirable invariants include properties such as a variable
never exceeding a certain value, the altitude of a plane never dropping below 1,000
feet without the wingflaps and landing gear being deployed, and the temperature of
a nuclear reactor never exceeding the threshold for a meltdown.
We typically use induction to prove that a proposition is an invariant. In particular, we show that the proposition is true at the beginning (this is the base case) and
that if it is true after t steps have been taken, it will also be true after step t + 1 (this is the inductive step). We can then use the induction principle to conclude that  proposition is indeed an invariant, namely, that it will always hold.

- The Diagonally-Moving Robot (page 15, PDF)
- 8-puzzle (pg 18)
```
ABC
DEF
HG-
```
- Making change (pg 24)



### Show a claim step-by-step.
- “Base Case” – show the calculation “starts” in the right place (usually that variables store the right values, or some property is true about what we’ve calculated so far).

> If the property/variables is/are right before step $n$, then it/they are right after step $n$.

- “inductive hypothesis” – if our property is true before step $n$
- “inductive step” – then it is still true after step $n$




### Invariants

Prove a loop does the right thing.
- Before the loop starts, everything is right.
- Each time through, if the variables start with the right information, then they are updated correctly.
- Therefore, after we exit the loop, we have the right answer.

### Prove recursive code works

- The base case of the recursion produces the right value.
- If the recursive calls we make produce the right value, then we return the right value.
- Therefore, the first (overall) recursive call also produces the right answer.

### Induction in 5 easy(?) steps

1. Define 𝑃(𝑛). State that your proof is by induction on 𝑛.
2. Base Case(s): Show the smallest value 𝑃(𝑏𝑚𝑖𝑛) is true.
3. Inductive Hypothesis: Suppose 𝑃 (𝑏𝑚𝑖𝑛) ∧ 𝑃 (𝑏𝑚𝑖𝑛 + 1) ∧ ⋯ ∧ 𝑃(𝑘) for an
arbitrary 𝑘 ≥ 𝑏𝑚𝑎𝑥. (The smallest value of 𝑘 assumes all bases cases, but
nothing else)
4. Inductive Step: Show 𝑃( 𝑘 + 1) (i.e. get [P(b𝑚𝑖𝑛) ∧ ⋯ ∧ 𝑃 (𝑘) ] → 𝑃(𝑘 + 1))
5. Conclude by saying 𝑃 (𝑛) is true for all 𝑛 ≥ 𝑏𝑚𝑖𝑛 by the principle of
induction.

### Things to check for

𝑃(𝑛) should:
1. be Boolean valued (i.e. output “true” or “false)
2. Take in an integer.
3. If you knew 𝑃(𝑛) holds for all 𝑛, you should know your main claim.

If your inductive step goes back exactly 𝑠 steps every time, then you need 𝑠
base cases. (good rule of thumb: if you’re analyzing recursive code with
multiple base cases, your induction proof needs multiple base cases)

Be careful with your IH! You want to suppose everything from the base
case(s) up to some fixed value 𝑘.





## Credits

- https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/resources/lecture-1-introduction-and-proofs/

