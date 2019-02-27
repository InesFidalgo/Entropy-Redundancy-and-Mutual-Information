function entro=entropia(fonte,alfa)
%chama a funcao histograma e copia os seus resultados para h
h=histograma(fonte,alfa);
%cria a condicao para eliminar todos os resultados com 0 visto que log2 de 0 e impossivel.
h=h(h~=0);
%converte h em probabilidade
h=h/sum(h);
%formula da entropia
entro= -(h'*(log2(h)));