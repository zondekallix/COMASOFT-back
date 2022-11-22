%*************************************************************
%DETERMINACION DE LOS COEFICIENTES EFECTIVOS PARA EL CASO
%EN QUE EL ANGULO ES pi/2 y FIBRAS rigidas.
%*************************************************************
%*************************************************************
clear all
%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%*************************************************************
texto='ESPERE UN MOMENTO, ESTOY CALCULANDO ';
disp(texto)
%*************************************************************
%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%*************************************************************
%   Epoxy   Epoxyresine  Lagache(Ta.1,4)   florencia  Aboudi(54pp)              Abo.pp58  hassel
%                                                      epoxy epoxy    Aluminio  polyester aluminio
Eam=[3.45   1.7097  2.9     4        2.8   3.42   4.14  5.35  1.72    0.715    3  3.4...
     6.4731   3.4  0.49580  0.5  3.21   3.50   4  0.6  0.5];
Etm=[3.45   1.7097  2.9     4        2.8   3.42   4.14  5.35  1.72    0.715    3  3.4...
     6.4731   3.4  0.49580  0.5  3.21   3.50   4  0.6  0.5];
Gam=[1.28   1.2759  1.0357  1.4925   1.12  1.27   1.59  1.97  0.59    0.267    1.087 1.25...
     0.892   1.2593 0.185   0.1852 1.1889  1.2963  1.4815  0.2222 0.185];
Pam=[0.35   0.34    0.40    0.34     0.25  0.34   0.3   0.354  0.45   0.341   0.38  0.36...
     0.35    0.35  0.34     0.35  0.35   0.35 0.35  0.35  0.35];
Ptm=[0.35    0.34   0.40    0.34     0.25  0.34   0.3   0.354 0.45    0.341   0.38  0.36...
      0.35   0.35  0.34     0.35  0.35  0.35  0.35  0.35 0.35];

Gtm=Etm./(2*(1+Ptm));
%length(Gtm)

%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA FIBRA                       *
%*************************************************************
% datos de entrada
%   Graphite E-glass                                 glass  graphite            boron
%Eaf=[345   34.5103    73     84       85.5   68.94  165.5  232 70.3   3.979  72 238 ...
%     153  57.2   131  72   10.0080  10.6  70  72.72 80   50 10.5];
%Etf=[9.66  34.5103    73     84       85.5   68.94  13.79  15  70.3   3.979  72  40 ...
%    10.9  20.1  6.33  72  10.0080   10.6  70  72.72  80 2  10.5];
%  Gaf=[2.07  28.75    29.91   34.42    35.04   28.72  27.58  24  29.04 1.763    22 29.8...
% 5.6  5.9  2.3   29.5082  4.17   4.3443 29.1667   30.30  32.0 10 4.38];
% Paf=[0.20  0.2        0.22   0.22    0.22   0.2   0.3   0.279  0.21  0.129   0.25  0.22...
%      0.3   0.262   0.35  0.22   0.2   0.22  0.2  0.20 0.25  0.20 0.20];
% Ptf=[0.30  0.2        0.22   0.22    0.22   0.2   0.15   0.49  0.21  0.129  0.2  0.22...
%      0.021  0.092  0.35   0.22  0.2   0.22  0.2  20   0.25  0.15 0.20];
%**************
%Gtf=Etf./(2*(1+Ptf));
%length(Eaf)

%******************************** 
matrix=1;
%fibre=23;
%***** Inicio de un  ciclo para variar la combinacion
for a=matrix:matrix;
   
%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%************************************************************

mat=zeros(6,6);
mat(1,1)=1/Etm(a);
mat(1,2)=-Ptm(a)/Etm(a);
mat(1,3)=-Pam(a)/Eam(a);
mat(2,1)=-Ptm(a)/Etm(a);
mat(2,2)=1/Etm(a);
mat(2,3)=-Pam(a)/Eam(a);
mat(3,1)=-Pam(a)/Eam(a);
mat(3,2)=-Pam(a)/Eam(a);
mat(3,3)=1/Eam(a);
mat(4,4)=1/Gam(a);
mat(5,5)=1/Gam(a);
mat(6,6)=1/Gtm(a);


nat=inv(mat);



c11m(a)=nat(1,1);
c12m(a)=nat(1,2);
c13m(a)=nat(1,3);
c21m(a)=nat(2,1);
c22m(a)=nat(2,2);
c23m(a)=nat(2,3);
c31m(a)=nat(3,1);
c32m(a)=nat(3,2);
c33m(a)=nat(3,3);
c44m(a)=nat(4,4);
c55m(a)=nat(5,5);
c66m(a)=nat(6,6);
km(a)=(c11m(a)+c12m(a))/2;
end
%******************************************************************************************
%CASO CELDA CUADRADA Y CIRCULO


ang=pi/2;
%xas=c66m(a)/c66f(b);
%xas=0;
%xas=c66f(b)/c66m(a);
x1=3-4*(c12m(a)/(c11m(a)+c12m(a)));
%x2=3-4*(c12f(b)/(c11f(b)+c12f(b)));
S(4)=3.1512114; 
gam1=-5*S(4)/pi;
%xasx1=xas*x1;
%B=(1-xas)/(1+xasx1);
B=-1/x1;
%E=-1/(1+xasx1);
%E=-1;
%A=B*(xasx1-x2)/(xas+x2);
A=-1;
alf3=-A/B;
%x=c44f(b)/c44m(a);
%x=0;
%X=(1-x)/(1+x);
X=-1;
S=0;T=0;


%**************************************
                                    T(3)=0;
S(4)=3.1512114;                    T(7)=4.5155155;                      
S(8)=4.2557731;                    T(11)=3.8807309;
S(12)=3.9388490;                   T(15)=4.0315403;
S(16)=4.0156950;                   T(19)=4.031499;                            
S(20)=3.9960967;                   T(23)=3.992203;                          
S(24)=4.0009768;                   T(27)=3.9995118; 
S(28)=3.9997559;                   T(31)=4.0001221; 
S(32)=4.000610;                    T(35)=3.9999695; 
S(36)=3.9999847;                   T(39)=4.0000076;
S(40)=4.0000038;                   T(43)=3.9999981;
S(44)=3.9999990;                   T(47)=4.0000005;
S(48)=4.0000002;                   T(51)=3.9999999;    
S(52)=3.9999999;                   T(55)=4.0000000;    
S(56)=4.0000000;                   T(59)=4.0000000;
S(60)=4.0000000;                   T(63)=4.0000000;
S(64)=4.0000000;                   T(67)=4.0000000;
S(68)=4.0000000;                   T(71)=4.0000000; 
S(72)=4.0000000;                   T(75)=4.0000000;

S(76)=4.0000000;                   T(79)=4.0000000;
S(80)=4.0000000;                   T(83)=4.0000000;
S(84)=4.0000000;                   T(87)=4.0000000;
S(88)=4.0000000;                   T(91)=4.0000000; 
S(92)=4.0000000;                   T(95)=4.0000000;
S(96)=4.0000000;
S(100)=4.0000000;
S(104)=4.0000000;
S(108)=4.0000000;
S(112)=4.0000000;
S(116)=4.0000000;
S(120)=4.0000000;
S(124)=4.0000000;
%*******************************************************************************************

%   Matriz factorial
clear fact
for n=1:140,
   for k=1:n,
   fact(n,k)=prod(1:1:n)/(prod(1:1:k)*prod(1:1:n-k));

   end

end

%******************************************************************************************
%matriz unitaria
for n=1:140,
   for k=1:140,
      if n==k,
         di(n,k)=1;
      else di(n,k)=0;
      end   

   end
end


%****************************************************************************************
% Comienzo de un ciclo para variar el volumen de la fibra 

lam=0:0.01:0.785; 
%lam=0:0.05:0.8;
%lam=0.785; 
%*************************************************************
for jj=1:length(lam),  %comienzo de ciclo de lam
r=sqrt(lam(jj)*sin(ang)/pi);
Ao=B*lam(jj)*(x1-gam1/pi);
%Wo=xas*(1-lam(jj))+((lam(jj))/(x1-1)+0.5)*(x2-1);
%C=B*(1+xasx1-xas-x2)/Wo;
G=0.5+lam(jj)/(x1-1);
C=(1-x1)/(x1*(1-lam(jj)));
%P=B*(x2-1)/(2*Wo);
%P=0.5/G;

%*********************************************************************************
%Matriz Eta


for n=1:2:62,
   for k=1:2:62,

Eta(n,k)=-(fact(n+k-1,k))*S(n+k)*(r^(n+k));

   end
end
% 
%*******************************************************************************************
%Matriz Rnk
for n=1:2:62,
   for k=1:2:62,
      suma=0;
      
      for i=3:2:10,
        suma=Eta(n,i)*Eta(i,k)+suma;
      end
        Rnk(n,k)=suma;
   end
end
%*******************************************************************************************
%Matriz Rnkprueba
for n=1:2:62,
   for k=1:2:62,
      suma=0;
      
      for i=5:4:10,
        suma=Eta(n,i)*Eta(i,k)+suma;
      end
        Rnkprueba(n,k)=suma;
   end
end
%*******************************************************************************************

%Matriz Gnk
for n=1:2:20,

   for k=1:2:20,

Gnk(n,k)=-n*((fact(n+k+2,n+1))*(S(n+k+2))*(r^(n+k+2))-(fact(n+k,n))*(T(n+k+1))*(r^(n+k)));

   end
end


%*************************************************************************************
X2=1+Ao+ B*Gnk(1,1)+A*Rnk(1,1);
X3=1+B*(x1+gam1/pi)*lam(jj)-B*Gnk(1,1)+A*Rnk(1,1);
%*************************************************************************************
% Cálculo de otras matrices:  U V Y Z
for t=1:2,
   for s=1:2,
      
 U(t,s)=di(4*t+1,4*s+1)+B*Gnk(4*t+1,4*s+1)+A*Rnk(4*t+1,4*s+1);
 Z(t,s)=di(4*t-1,4*s-1)+A*Rnk(4*t-1,4*s-1)+B*Gnk(4*t-1,4*s-1)+C*Eta(4*t-1,1)*Eta(1,4*s-1);
 Y(t,s)=di(4*t-1,4*s-1)-X^2*Rnk(4*t-1,4*s-1)-X^2*Eta(4*t-1,1)*Eta(1,4*s-1);
 %Y(t,s)=di(4*t-1,4*s-1)-X^2*Rnkprueba(4*t-1,4*s-1);
 V(t,s)=di(4*t+1,4*s+1)-B*Gnk(4*t+1,4*s+1)+A*Rnk(4*t+1,4*s+1);


    end
 end 
 
      IU=inv(U);
      IZ=inv(Z);
      IY=inv(Y); 
      IV=inv(V);
          
            

%*********************************************************************************************
%Cálculo de Vectores

    for s=1:2
      U1(1,s)=Gnk(1,4*s+1)-(alf3)*Rnk(1,4*s+1);
      U2(s,1)=Gnk(4*s+1,1)-(alf3)*Rnk(4*s+1,1);
      
      V1(1,s)=Gnk(1,4*s+1)+(alf3)*Rnk(1,4*s+1);
      V2(s,1)=Gnk(4*s+1,1)+(alf3)*Rnk(4*s+1,1);

      
      N2(s,1)=Eta(4*s-1,1);
      N1(1,s)=Eta(1,4*s-1);

    end


      R=(B^2)*U1*(IU*U2);
      N1IZN2=N1*(IZ*N2);
      N1IYN2=N1*(IY*N2);
     V1IVV2=(B^2)*V1*(IV*V2);
      
      %R=0;
      %N1IZN2=0;
      %N1IYN2=0;  %Con este cero se reproduce exactamente Ban Fo Fi
      %V1IVV2=0;
         %************************************************ 
      
%********************************************************************************************

Kr=1+((x1-1)/(1-lam(jj)))*(G-(1+x1)*B*N1IZN2/(1-lam(jj)));
Mrp=(x1+1)/(x1*(X2-R));
Mr=(x1+1)/(x1*(X3-V1IVV2));
Pr=2/(1-lam(jj)-N1IYN2);

%********************************************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%********************************************************************************************
k=km(a)*(1+lam(jj)*Kr);
mp=c66m(a)*(1+lam(jj)*Mrp);
m=c66m(a)*(1+lam(jj)*Mr);
%p=c44m(a)*(1+lam(jj)*Pr);
p=(1+lam(jj)*Pr);
p12=(k-mp)/(k+mp);
E22=4*k*mp/(k+mp);
%E22=2*(1+p12)*mp;
c11=k+mp;
c12=k-mp;
%*******************************************************************************

%*******************************************************************************
%Deposito de los coeficientes para la salida de las constantes ingenieriles efectivas
%*****************************************************************************************

RR(jj,1,a)=lam(jj);
RR(jj,2,a)=p12; %Poisson Transversal
RR(jj,3,a)=E22; %Modulo de Young Transversal

RR1(jj,1,a)=lam(jj);
RR1(jj,2,a)=c11; 
RR1(jj,3,a)=c12; 
RR1(jj,4,a)=p; 
RR1(jj,5,a)=m; 
RR1(jj,6,a)=mp; 

RR2(jj,1,a)=lam(jj);
RR2(jj,2,a)=k; 
RR2(jj,3,a)=mp; 
RR2(jj,4,a)=p; 
RR2(jj,5,a)=m; 

end  % fin del ciclo donde se incrementa lam

%end  % fin de ciclo para variar la fibra 

%*******************************
% Formato de salida
% disp(composite(a))

 disp('      ')
disp('   Coeficientes Effectivos')
disp('      ')
disp('       Vf        c11        c12            c44       c66          mp')    
disp(' ------------------------------------------------------------------------')
%format short
format long
disp(RR1(:,:,a))
pause

disp('      ')
disp('   Coeficientes Effectivos Ingenieriles')
disp('      ')
disp('       Vf          k          mp             p         m ')    
disp(' ------------------------------------------------------------------------')
format short
disp(RR2(:,:,a))
pause

disp('      ')
disp('   Coeficientes Effectivos Ingenieriles')
disp('      ')
disp('       Vf       Poisson12       E22 ')    
disp(' ------------------------------------------------------------------------')
format short
disp(RR(:,:,a))
pause
 
 figure (1);
% t='Negro Cota Inferior, Rojo Ea efectivo, Azul Cota superior';
plot(lam,RR(:,2,a)/Pam(a),'k.', ...
     lam,RR(:,3,a)/Eam(a),'r-')
%l1=min(RR3(:,2,a,b));
%l2=max(RR3(:,4,a,b));
%title(t);
%text(10,0.1,'celda hexágono-círculo')
axis([0 0.785 0 12])

   xlabel('Fibre Volume Fraction') ,
  ylabel('Effective Elastic Constants (rigid fibres)')
  % ylabel(' \nu_{12} / \nu_{M}, E_{22} / E_{M} ')
 print figura6ameguidkalamkarov.ps -deps   
   pause
   
 figure (2);
% t='Negro Cota Inferior, Rojo Ea efectivo, Azul Cota superior';
plot(lam,RR(:,2,a)/0.5385,'k-.', ...
     lam,RR(:,3,a)/0.5698,'r-')
axis([0 0.785 0 45])
   xlabel('V_{2}') ,
%  ylabel('Effective Elastic Constants (rigid fibres)')
ylabel('E_{t} / E_{1} (-), \nu_{t} / \nu_{1} (-.) ')
 print figura6meguidkalamkarov.ps -deps   
   pause
   
 figure (3);
% t='Negro Cota Inferior, Rojo Ea efectivo, Azul Cota superior';
plot(lam,RR2(:,2,a)/km(a),'y.', ...
     lam,RR2(:,3,a)/c66m(a),'r-', ...
     lam,RR2(:,4,a),'k-.', ...
     lam,RR2(:,5,a)/c66m(a),'b:')
%l1=min(RR3(:,2,a,b));
%l2=max(RR3(:,4,a,b));
%title(t);
%text(10,0.1,'celda hexágono-círculo')
axis([0 0.785 0 300])
   xlabel('Fibre Volume Fraction') ,
   ylabel('Effective Elastic Constants (rigid fibres)')
   print figura6extrameguidkalamkarov.ps -deps






