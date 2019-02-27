function[entro] = ex5(Fonte,Alfa)

%transforma a matriz num vector
Fonte = reshape(Fonte,1,[]);
lenFonte = length(Fonte);

%cria uma matriz em que cada elemento é a combinação de dois elementos do
%alfabeto
lenAlfa = length(Alfa);
nCasos = zeros(lenAlfa,lenAlfa);
step = Alfa(2)-Alfa(1);
%preenche a matriz com o numero de ocorencias de cada combinação
for i = 1:lenFonte-1
    x = (Fonte(i)-Alfa(1))/step+1;
    y = (Fonte(i+1)-Alfa(1))/step+1;
    nCasos(x,y)= nCasos(x,y) + 1;
end;
%calcula a probablidade de cada combinaç
prob = nCasos/(lenFonte-1);
prob = reshape(prob,1,[]);
prob = prob(prob~=0);

%calcula a entropia
entro = - sum(prob.*log2(prob))/2;
bar(prob), title('entroipia com agrupamento');
pause;
