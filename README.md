
PSM12 - Métodos numéricos de otimização <img src="https://www.unifei.edu.br/files/LogoEFEI_small.jpg" align="right" alt="unifei">
===========

Engenharia de Controle e Automação
----------------------------------

Por: [Adriano Henrique Rossette Leite](http://lattes.cnpq.br/0344999175185128), Bs.

Este repositório contém o código fonte (para o [Octave](https://www.gnu.org/software/octave/)) dos algoritmos implementados na disciplina Métodos de Otimização (PSM12) do Programa de Pós-Graduação em Engenharia de Produção da Universidade Federal de Itajubá (UNIFEI).

***

### [mnouvsr](#mnouvsr): métodos numéricos de otimização para uma variável sem restrição

Este [arquivo](#mnouvsr/comparacao) faz comparação e mostra como usar como um dos seguintes métodos numéricos de otimização:

- [Método de Redução Unilateral](#mnouvsr/redUni.m)
- [Método de Redução Bilateral](#mnouvsr/redBi.m)
- [Método de Busca de Fibonacci](#mnouvsr/fib.m)
- [Método de Busca Golden Section](#mnouvsr/gs.m)
- [Método de Interpolação Quadrática](#mnouvsr/intQuad.m)
- [Método de Newton](#mnouvsr/newton.m)
- [Método Quasi-Newton](#mnouvsr/quasiNewton.m)

A função objetivo e suas derivadas de primeira e segunda ordens são definidas, respectivamente, nos arquivos [f.m](#mnouvsr/f.m), [df.m](#mnouvsr/df.m) e [d2f.m](#mnouvsr/d2f.m).

### [mnomvsr](#mnomvsr): métodos numéricos de otimização para multíplas variáveis sem restrição