//Arquitetura da rede
disp ('Rede Neural ');
//[ENTRADA, Nº NODOS CAMADA OCULTA, SAÍDAS]
N=[4,3,1]; // 4 entradas, uma camada oculta com 3 nodos, uma saída
disp (N,'Arquitetura');
//Faz com que o gerador de #aleatórios ...
rand('seed',0);
//Parâmetros do treinamento
aprendizagem = 0.01;
momentum = 0.5;
disp (aprendizagem,'Aprendizagem');
disp (momentum,'Momento');
lp = [aprendizagem, 0, momentum, 0];
T = 10000;//epocas
tol = 0.0001;//tolerancia
contT = 1;//contador de epocas
erroQ = tol;
Erroepoca = [];
disp('Inicializando a rede...');
//Comandos para contar tempo de máquinas/relógio
tic();
timer();
//------------------------------------------------
W = ann_FF_init(N);//Inicializa a rede
disp('Treinando a rede...');
//O Software exige que as saídas estejam em um vetor, assim, foi 
//necessário inverter a matriz de saídas de coluna para linha
X=trein_3(2:5,:)//Entradas
Y=trein_3(6,:)//Saidas
while ( (contT <= T) & (erroQ >= tol) ) do
  W = ann_FF_Mom_online(X,Y,N,W,lp,1);//Pesos
  Y0 = ann_FF_run(X,N,W);
  val = Y - Y0;
  for i = 1 : size(val,1)
    for j = 1 : size(val,2)
      val(i,j) = (val(i,j))^2;
    end
  end
  val = sum(val);//val^2
  erroQ = val;
  Erroepoca = [Erroepoca erroQ];
  E = ann_sum_of_sqr(Y0,Y);
  contT = contT + 1;
end
disp('Fim');
disp (tempo=toc(), 'Tempo em segundos');
disp(timer(),'tempo CPU')
W_trein=W;
Erroepocat_trein=Erroepoca;
E_trein=E;
Y0_trein=Y0;
//disp(E_trein, 'Erro')
disp(E_trein*100, 'Erro%')
//disp(Y0_trein, 'Saídas')
epoca=1:T;
scf(1);//Nova Janela
plot2d(epoca,Erroepocat_trein)



