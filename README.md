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



















 [^1]: Haake, F., Kuś, M. & Scharf, R. Classical and quantum chaos for a kicked top. Z. Physik B - Condensed Matter 65, 381–395 (1987). [https://doi.org/10.1007/BF01303727](https://doi.org/10.1007/BF01303727)
 [^2]: Herrmann, Tabea, et al. "Entanglement in coupled kicked tops with chaotic dynamics." Physical Review E 101.2 (2020): 022221.[https://link.aps.org/doi/10.1103/PhysRevE.101.022221](https://link.aps.org/doi/10.1103/PhysRevE.101.022221).
[^3]: Miller PA, Sarkar S. Signatures of chaos in the entanglement of two coupled quantum kicked tops. Phys Rev E Stat Phys Plasmas Fluids Relat Interdiscip Topics. 1999 Aug;60(2 Pt A):1542-50. [https://doi: 10.1103/physreve.60.1542. PMID: 11969915](https://doi.org/10.1103/physreve.60.1542).


