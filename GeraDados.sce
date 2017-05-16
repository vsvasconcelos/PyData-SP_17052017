//Carrega toobox de redes neurais
exec('/home/vagner/MSC/ANN_Toolbox_0.4.2.5.bin/ANN_Toolbox/loader.sce', -1)
//Chama a função que ambaralha os dados.
exec('/home/vagner/MSC/embaralhar_2206.sci', -1)
//Leitura dos dados sem pre-processamento
dados = fscanfMat('/home/vagner/MSC/dados.csv');
//Zona, População, Matrículas escolares, Empregos, Renda per capita e 
//Demanda de Passageiros 
[L,ND]=size(dados);//ND = nº de dados
//----------------------------------------------------------------------
//Mormalização dos dados
a=0.1;
b=0.9;
dados_norm=dados;
// Varre as linhas, a partir da 2ª (Zona é só cabeçalho), e encontra os
// valores máximo e mínimo por linha
for j=2:L
    xmax=max(dados(j,:))
    xmin=min(dados(j,:))
    dados_norm(j,:)=(b-a)*[(dados(j,:)-xmin)/(xmax-xmin)]+a;
end;
//----------------------------------------------------------------------
//Mistura aleatoriamente os dados
dados_1=embaralhar(dados_norm);
dados_2=embaralhar(dados_norm);
dados_3=embaralhar(dados_norm);
//Definição da Qde. de dados para treinamento, testes e validação
ND_trein=int(ND*0.5);//50% para treinamento
ND_teste=int(ND*0.25);//25% para testes
ND_valid=ND-ND_trein-ND_teste;//~25% (restante) para validação 
disp(ND, 'Qde de dados=')
disp(ND_trein,'#treinamento')
disp(ND_teste,'#Testes')
disp(ND_valid,'# validação')
//----------------------------------------------------------------------
//Nestes conj. de treinamentos, as linhas de 2 até 5 são as entradas
//e a linha 6 é a saída
//Ex.: X1=trein_1(2:5,:); Y1=trein_1(6,:)
//Primeiro conjunto de dados
trein_1= dados_1(1:L,1:ND_trein);
teste_1= dados_1(1:L,ND_trein+1:ND_trein+ND_teste);
valid_1= dados_1(1:L,ND_trein+ND_teste+1:ND);
//----------------------------------------------------------------------
//Segundo conjunto de dados
trein_2= dados_2(1:L,1:ND_trein);
teste_2= dados_2(1:L,ND_trein+1:ND_trein+ND_teste);
valid_2= dados_2(1:L,ND_trein+ND_teste+1:ND);
//----------------------------------------------------------------------
//Terceiro conjunto de dados
trein_3= dados_3(1:L,1:ND_trein);
teste_3= dados_3(1:L,ND_trein+1:ND_trein+ND_teste);
valid_3= dados_3(1:L,ND_trein+ND_teste+1:ND);
//----------------------------------------------------------------------
