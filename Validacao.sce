exec('/home/vagner/MSC/Desnormalizar.sci', -1)
X=valid_2(2:5,:)//Entradas
Y=valid_2(6,:)//Saidas Reias
//------------------------------------------------
tic();
timer();
disp('Validando a rede...');
//------------------------------------------------
clear Y0;
  Y0 = ann_FF_run(X,N,W);
  val = Y - Y0;
  for i = 1 : size(val,1)
    for j = 1 : size(val,2)
      val(i,j) = (val(i,j))^2;
    end
  end
  val = sum(val);
  erroQ = val;
  E = ann_sum_of_sqr(Y0,Y);
disp('Fim');
disp (tempo=toc(), 'Tempo em segundos');
disp(timer(),'tempo CPU')
E_valid=E;
Y0_valid=Y0;
//disp(E_valid, 'Erro')
disp(E_valid*100, 'Erro%')
//disp(Y0_valid, 'Saídas')
//disp(dados_denorm=Desnormalizar(Y0_valid),'Dados De Saída Previstos')
