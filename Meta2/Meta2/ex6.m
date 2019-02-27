function [infMutua] = ex6(Query,Fonte,Alfa,Step)

lenQuery = length(Query);
lenFonte = length(Fonte);
lenAlfa = length(Alfa);
%numero de janelas
max = (lenFonte-lenQuery)/Step+1;
for i=1:max
    %cria a matriz de ocorencias para essa janela
    nAlfa = zeros(lenAlfa+1,lenAlfa+1);
    for j=1:lenQuery
        x = (Query(j)-Alfa(1))/Step+1;
        y = (Fonte((i-1)*Step+j)-Alfa(1))/Step+1;
        nAlfa(x,y) = nAlfa(x,y)+1;
    end;
    %calcula a entropia da janela
    ini = (i-1)*Step+1;
    fim = (i-1)*Step+lenQuery;
    Janela= Fonte(ini:fim);
    entroJanela=entropia(Janela,Alfa);
    %entropia da query
    entroQuery=entropia(Query,Alfa);
    %entropia conjunta
    Compara = nAlfa/lenQuery;
    Compara = reshape(Compara,1,[]);
    Compara = Compara(Compara~=0);
    entroConj = - sum(Compara.*log2(Compara));
    %informaçao conjunta 
    infMutua(i) = entroJanela + entroQuery - entroConj;
end;


