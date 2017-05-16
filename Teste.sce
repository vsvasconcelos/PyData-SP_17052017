T = 10000;//epocas
tol = 0.0001;//tolerancia
contT = 1;//contador de epocas
erroQ = tol;
Erroepoca = [];
X=teste_3(2:5,:)//Entradas
Y=teste_3(6,:)//Saidas
//------------------------------------------------
tic();
timer();
disp('Testando a rede...');
//------------------------------------------------
clear Y0;
while ( (contT <= T) & (erroQ >= tol) ) do
  W = ann_FF_Mom_online(X,Y,N,W,lp,1);//Pesos
  Y0 = ann_FF_run(X,N,W);
  val = Y - Y0;
  for i = 1 : size(val,1)
    for j = 1 : size(val,2)
      val(i,j) = (val(i,j))^2;
    end
  end
  val = sum(val);
  erroQ = val;
  Erroepoca = [Erroepoca erroQ];
  E = ann_sum_of_sqr(Y0,Y);
  contT = contT + 1;
end
disp('Fim');
disp (tempo=toc(), 'Tempo em segundos');
disp(timer(),'tempo CPU')
plot2d(epoca,Erroepoca)
W_teste=W;
Erroepoca_teste=Erroepoca;
E_teste=E;
Y0_teste=Y0;
//disp(E_teste, 'Erro')
disp(E_teste*100, 'Erro%')
//disp(Y0_teste, 'Saídas')
scf(2);//Nova Janela
plot2d(epoca,Erroepoca_teste)
