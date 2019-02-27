function a = Huffman(fonte,alfa)
%cria um vector com o nº de casos de cada valor de alfa
freq = histograma(fonte,alfa);
%calcula o numero de bits necessario para codificar cada bit
nBits = hufflen(freq);
%calcula 
a = sum(nBits.*(freq/sum(freq)));