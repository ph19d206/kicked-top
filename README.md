# kicked-top
 Exhilarating exploration of the dynamics of the kicked top! We'll dive into its classical phase space and quantum behavior, uncovering the mysteries of this fascinating system. Main focus will be on the captivating concepts of quantum chaos and information scrambling, promising a thrilling journey of discovery.

## Single kicked-top
Hamiltonian is,
$$H_1 = \alpha J_{y_1} + \frac{k_1}{2J_1}J_{z_1}^2 \sum_{n=-\infty}^{\infty}\delta(t-n\tau)$$,
Where $\large{\alpha = \frac{\hslash p}{\tau}}$ from Haake paper on Kicked top[^1].

The floquet evolution operator is, $$U_{1} = exp(-i\frac{k}{2(J_1+1/2)}J_{1y}^2)\cdot exp(-i\alpha J_{1z})$$.

Classical and quantum chaos for a kicked top by Haake[^1], is a good reference to understanding single kicked.


## Coupled kicked-top
Hamiltonian of coupld kicked top is,
$$H = H_1 + H_2 + H_{12}$$,
Where $$H_{12}=\frac{\delta}{2\sqrt{(J_1+1/2)(J_2+1/2)}}J_{1y}J_{2y}\sum_{n=-\infty}^{\infty}\delta(t-n\tau)$$.

Therefore, Floquet evolution operator is, 
$$U=U_{12}(U_1\otimes U_2)$$
where, $U_{12} = exp({-i\frac{\delta}{2\sqrt{(J_1+1/2)(J_2+1/2)}}J_{1y}J_{2y}})$. For more details about coupled kicked we can look, [^2][^3].



















 [^1]: [Classical and quantum chaos for a kicked top by Haake](https://link.springer.com/article/10.1007/BF01303727)
 [^2]: [Entanglement in coupled kicked tops with chaotic dynamics](https://arxiv.org/pdf/1910.13447.pdf)
[^3]: [Signatures of chaos in the entanglement of two coupled quantum kicked tops](https://journals.aps.org/pre/pdf/10.1103/PhysRevE.60.1542)


