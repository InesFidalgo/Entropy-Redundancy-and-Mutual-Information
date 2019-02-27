function h=histograma(fonte,alfa)
%cria um array lenght(alfa)x1
h=zeros(length(alfa),1); 
for k=1:length(alfa), 
    %devolver o array [i,j] com as posi��es de alfa(k) em no array fonte
    [i,j]=find(fonte==alfa(k));
    %a posi��o k de h toma o valor do tamanho do array de j, ou seja o n�mero de ocorr�ncias de alfa(k) em fonte
    h(k)=length(j);
end;