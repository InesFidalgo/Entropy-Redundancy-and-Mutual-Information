fprintf('Trabalho realizado por:\nRicardo Costa 2013154238\n');
fprintf('Ana Inês Fidalgo 2013134819\nAndré Monteiro 2013171072\n\n ');
%--------------------------------------------------------------------------
%---------------------------------kid.bmp----------------------------------
%--------------------------------------------------------------------------
fprintf('\tFicheiro: kid.bmp\n');
ficheiro = 'dados/kid.bmp';
%lê o ficheiro criando uma matriz
fonte = imread(ficheiro);
%converte a matriz num vector
fonte = reshape(fonte,1,[]);
%cria um vector com o alfabeto
alfa = 0:1:255;
%faz o histograma
histo = histograma(fonte,alfa);
bar(histo),title('Histograma');
pause;
%calcula a entropia
entro = entropia(fonte,alfa);
fprintf('Entropia = %d\n',entro);
%calcula o nº min de bits 
huff = Huffman(fonte,alfa);
fprintf('Huffman = %d\n',huff);
%calcula a entrupia com combinações
comb = ex5(fonte,alfa);
fprintf('Entropia com combinações = %f\n\n',comb);
%--------------------------------------------------------------------------
%--------------------------------homer.bmp---------------------------------
%--------------------------------------------------------------------------
fprintf('\tFicheiro: homer.bmp\n');
ficheiro = 'dados/homer.bmp';
%lê o ficheiro criando uma matriz
fonte = imread(ficheiro);
%converte a matriz num vector
fonte = reshape(fonte,1,[]);
%cria um vector com o alfabeto
alfa = 0:1:255;
%faz o histograma
histo = histograma(fonte,alfa);
bar(histo),title('Histograma');
pause;
%calcula a entropia
entro = entropia(fonte,alfa);
fprintf('Entropia = %d\n',entro);
%calcula o nº min de bits 
huff = Huffman(fonte,alfa);
fprintf('Huffman = %d\n',huff);
%calcula a entrupia com combinações
comb = ex5(fonte,alfa);
fprintf('Entropia com combinações = %d\n\n',comb);
%--------------------------------------------------------------------------
%-------------------------------homerbin.bmp--------------------------------
%--------------------------------------------------------------------------
fprintf('\tFicheiro: homerbin.bmp\n');
ficheiro = 'dados/homerbin.bmp';
%lê o ficheiro criando uma matriz
fonte = imread(ficheiro);
%converte a matriz num vector
fonte = reshape(fonte,1,[]);
%cria um vector com o alfabeto
alfa = 0:1:255;
%faz o histograma
histo = histograma(fonte,alfa);
bar(histo),title('Histograma');
pause;
%calcula a entropia
entro = entropia(fonte,alfa);
fprintf('Entropia = %d\n',entro);
%calcula o nº min de bits 
huff = Huffman(fonte,alfa);
fprintf('Huffman = %d\n',huff);
%calcula a entrupia com combinações
comb = ex5(fonte,alfa);
fprintf('Entropia com combinações = %d\n\n',comb);
%--------------------------------------------------------------------------
%-----------------------------guitarSolo.wav-------------------------------
%--------------------------------------------------------------------------
fprintf('\tFicheiro: guitarSolo.wav\n');
ficheiro = 'dados/guitarSolo.wav';
%lê o ficheiro criando Y o vector da fonte
%e nbits o numero de bits 
[Y, fs, nbits] = wavread(ficheiro);
%cria um vector com o alfabeto
h=2/(2^nbits);
alfa = -1:h:1-h;
%faz o histograma
histo = histograma(Y,alfa);
bar(histo),title('Histograma');
pause;
%calcula a entropia
entro = entropia(Y,alfa);
fprintf('Entropia = %d\n',entro);
%calcula o nº min de bits 
huff = Huffman(Y,alfa);
fprintf('Huffman = %d\n',huff);
%calcula a entrupia com combinações
comb = ex5(Y,alfa);
fprintf('Entropia com combinações = %d\n\n',comb);
%--------------------------------------------------------------------------
%--------------------------------english.txt-------------------------------
%--------------------------------------------------------------------------
fprintf('\tFicheiro: english.txt\n');
ficheiro = 'dados/english.txt';
%lê o ficheiro
f = fopen(ficheiro,'r');
fonte = fscanf(f,'%s');
%cria um vector com o alfabeto
alfa = 0:1:255;
%faz o histograma
histo = histograma(fonte,alfa);
bar(histo),title('Histograma');
pause;
%calcula a entropia
entro = entropia(fonte,alfa);
fprintf('Entropia = %d\n',entro);
%calcula o nº min de bits 
huff = Huffman(fonte,alfa);
fprintf('Huffman = %d\n',huff);
%calcula a entrupia com combinações
comb = ex5(fonte,alfa);

%--------------------------------------------------------------------------
%------------------------------------EX6-----------------------------------
%--------------------------------------------------------------------------

disp('Informacao Mutua');
subplot(1,1,1);

[query, Fs, nB] = wavread('dados/guitarSolo.wav');
query = query(:,1);
alfa = -1:(2/(2^nB)):1-(2/(2^nB));
step = length(query)/4;

[target, Fs, nB] = wavread('dados/target01 - repeat.wav');
target = target(:,1);

disp('guitarSolo.wav vs target01 - repeat.wav');
disp(ex6(query,target,alfa,step));
pause

[target, Fs, nB] = wavread('dados/target02 - repeatNoise.wav');
target = target(:,1);

disp('guitarSolo.wav vs target02 - repeatNoise.wav');
disp(ex6(query,target,alfa,step));
pause

disp('         ----- Simulador -----')
rSimular = zeros(7,1);

[target, Fs, nB] = wavread('dados/Song01.wav');
target = target(:,1);
fprintf('\nSong01\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(1) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song02.wav');
target = target(:,1);
fprintf('\nSong02\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(2) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song03.wav');
target = target(:,1);
fprintf('\nSong03\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(3) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song04.wav');
target = target(:,1);
fprintf('\nSong04\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(4) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song05.wav');
target = target(:,1);
fprintf('\nSong05\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(5) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song06.wav');
target = target(:,1);
fprintf('\nSong06\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(6) = max(infos);
disp(max(infos));
pause

[target, Fs, nB] = wavread('dados/Song07.wav');
target = target(:,1);
fprintf('\nSong07\n');
infos = ex6(query,target,alfa,step);
disp(infos)
fprintf('Maximo: \n');
rSimular(7) = max(infos);
disp(max(infos));
pause

[final,indexs] = sort(rSimular,1,'descend');
fprintf('Resultados da simulacao\n\n');
for i = 1:7
    fprintf('%d - Ficheiro Song0%d.wav - Informacao Mutua: %f\n',i,indexs(i),final(i));
end;