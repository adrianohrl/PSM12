
PSM12 - Métodos numéricos de otimização <img src="https://www.unifei.edu.br/files/LogoEFEI_small.jpg" align="right" alt="unifei">
===========

Programa de Pós-Graduação em Engenharia de Produção
---------------------------------------------------

Por: [Adriano Henrique Rossette Leite](http://lattes.cnpq.br/0344999175185128), Bs.

Este repositório contém o código fonte (para o [Octave](https://www.gnu.org/software/octave/)) dos algoritmos implementados na disciplina Métodos de Otimização (PSM12) do Programa de Pós-Graduação em Engenharia de Produção da Universidade Federal de Itajubá (UNIFEI).

***

### [mnouvsr](#mnouvsr): métodos numéricos de otimização para uma variável sem restrição

Este [arquivo](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/comparacao.m) faz comparação e mostra como usar os seguintes métodos numéricos de otimização:

- [Método de Redução Unilateral](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/redUni.m)
- [Método de Redução Bilateral](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/redBi.m)
- [Método de Busca de Fibonacci](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/fib.m)
- [Método de Busca Golden Section](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/gs.m)
- [Método de Interpolação Quadrática](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/interQuad.m)
- [Método de Newton](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/newton.m)
- [Método Quasi-Newton](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/quasiNewton.m)

A função objetivo e suas derivadas de primeira e segunda ordens são definidas, respectivamente, nos arquivos [f.m](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/f.m), [df.m](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/df.m) e [d2f.m](https://github.com/adrianohrl/PSM12/blob/master/mnouvsr/d2f.m).

### [mnomvsr](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr): métodos numéricos de otimização para multíplas variáveis sem restrição

Este [arquivo](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/comparacao.m) faz comparação e mostra como usar os seguintes métodos numéricos de otimização:

- [Método de Máxima Declividade](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/maxDecl.m)
- [Método de Máxima Declividade para função Quadrática](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/maxDeclQuad.m)
- [Método de Newton](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/newton.m)
- [Método Quasi-Newton](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/quasiNewton.m)
- [Método dos Gradientes Conjugados](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/gc.m)
- [Método dos Gradientes Conjugados para função Quadrática](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/gcQuad.m)

A função multi-variável objetivo, seu gradiente e sua hessiana são definidos, respectivamente, nos arquivos [f.m](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/f.m), [gf.m](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/gf.m) e [hf.m](https://github.com/adrianohrl/PSM12/blob/master/mnomvsr/hf.m).