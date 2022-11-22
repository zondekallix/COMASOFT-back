%*************************************************************
%DETERMINACION DE LOS COEFICIENTES EFECTIVOS PARA EL CASO
%EN QUE EL ANGULO ES pi/2 y FIBRAS VACIAS.
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
     6.4731   3.4  0.49580  0.5  3.21   3.50   4  0.6  0.5 3.45];
Etm=[3.45   1.7097  2.9     4        2.8   3.42   4.14  5.35  1.72    0.715    3  3.4...
     6.4731   3.4  0.49580  0.5  3.21   3.50   4  0.6  0.5 3.45];
Gam=[1.28   1.2759  1.0357  1.4925   1.12  1.27   1.59  1.97  0.59    0.267    1.087 1.25...
     0.892   1.2593 0.185   0.1852 1.1889  1.2963  1.4815  ...
     0.2222 0.185 1.2777778];
Pam=[0.35   0.34    0.40    0.34     0.25  0.34   0.3   0.354  0.45   0.341   0.38  0.36...
     0.35    0.35  0.34     0.35  0.35   0.35 0.35  0.35  0.35 0.35];
Ptm=[0.35    0.34   0.40    0.34     0.25  0.34   0.3   0.354 0.45    0.341   0.38  0.36...
      0.35   0.35  0.34     0.35  0.35  0.35  0.35  0.35 0.35 0.35];

Gtm=Etm./(2*(1+Ptm));

%******************************** 
matrix=1;
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

       
%********************************************************
dt1=c66m(a);
dt2=(c11m(a)+c12m(a))/2;
dt3=c13m(a);
dt5=c44m(a);
%******************************************************************************************
%CASO CELDA CUADRADA Y CIRCULO


ang=pi/2;
xas=0;
x1=3-4*(c12m(a)/(c11m(a)+c12m(a)));
S(4)=3.1512114; 
gam1=-5*S(4)/pi;
xasx1=xas*x1;
B=1;
E=-1;
A=-1;
alf3=-A/B;
x=0;
X=1;
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



%*******************************************************************************************

%   Matriz factorial
clear fact
for n=1:40,
   for k=1:n,
   fact(n,k)=prod(1:1:n)/(prod(1:1:k)*prod(1:1:n-k));

   end
end

%******************************************************************************************
%matriz unitaria
for n=1:40,
   for k=1:40,
      if n==k,
         di(n,k)=1;
      else di(n,k)=0;
      end   

   end
end


%****************************************************************************************
% Comienzo de un ciclo para variar el volumen de la fibra 
lam=0:0.01:pi/4;
%lam=0:0.05:0.8;
%lam=0.785;
%*************************************************************
for jj=1:length(lam),  %comienzo de ciclo de lam
r=sqrt(lam(jj)*sin(ang)/pi);
Ao=B*lam(jj)*(x1-gam1/pi);
G=0.5+lam(jj)/(x1-1);
C=-1/G;
P=0.5/G;

%*********************************************************************************
%Matriz Eta

for n=1:2:20,
   for k=1:2:20,

Eta(n,k)=-(fact(n+k-1,k))*S(n+k)*(r^(n+k));

   end
end
% 
%*******************************************************************************************
%Matriz Rnk
for n=1:2:20,
   for k=1:2:20,
      suma=0;
      
      for i=3:2:10,
        suma=Eta(n,i)*Eta(i,k)+suma;
      end
        Rnk(n,k)=suma;
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
      
         %************************************************ 
k1=-(1/(2*G))*((lam(jj)-1-B*(x1+1)*(1/(2*G))*N1IZN2));
k2=1+(x1+1)*E/(X2-R);
k3=(-1+2/((x+1)*(1+lam(jj)*X-(X^2)*N1IYN2)));
%********************************************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%********************************************************************************************
c11=c11m(a)*(1-lam(jj))+lam(jj)*(k2*dt1-(dt2)^2*k1/c66m(a));

c12=c12m(a)*(1-lam(jj))-lam(jj)*(k2*dt1+(dt2)^2*k1/c66m(a));

c13=c13m(a)*(1-lam(jj))-lam(jj)*(dt2*dt3*k1/c66m(a));

c33=c33m(a)*(1-lam(jj))-lam(jj)*(dt3^2*k1/c66m(a));

c66=c66m(a)-c66m(a)*(x1+1)*B*lam(jj)/(X3-V1IVV2);

c44=c44m(a)*(1-lam(jj)) -lam(jj)*(k3*dt5);

%*******************************************************************************

rigidez=zeros(6,6);
rigidez(1,1)=c11;
rigidez(1,2)=c12;
rigidez(1,3)=c13;
rigidez(2,1)=c12;
rigidez(2,2)=c11;
rigidez(2,3)=c13;
rigidez(3,1)=c13;
rigidez(3,2)=c13;
rigidez(3,3)=c33;
rigidez(4,4)=c44;
rigidez(5,5)=c44;
rigidez(6,6)=c66;


compliance=inv(rigidez);

Ea=1/compliance(3,3); % Ea efectivo
Et=1/compliance(1,1); % Et efectivo
Ga=1/compliance(4,4); %Ga efectivo
Gt=1/compliance(6,6); %Gt efectivo
Pa=-compliance(1,3)/compliance(3,3); % Poisson a efectivo
Pt=-compliance(1,2)/compliance(1,1); % Poisson t efectivo
kas=(c11+c12)/2;

%*****************************************************************************************
%Deposito de los coeficientes para la salida de las constantes ingenieriles efectivas
%*****************************************************************************************

RR(jj,1,a)=lam(jj);
RR(jj,2,a)=Ea; %Modulo Axial de Young efectivo
RR(jj,3,a)=Pa; %Poisson Axial efectivo
RR(jj,4,a)=Ga; %Modulo  Axial de cizalladura efectivo

RR1(jj,1,a)=lam(jj);
RR1(jj,2,a)=Gt; %Modulo de cizalladura efectivo
RR1(jj,3,a)=Et;%Modulo de Young efectivo
RR1(jj,4,a)=Pt;% Poisson t efectivo
RR1(jj,5,a)=kas;%Modulo de Bulk

%******** Coeficientes efectivos
RR2(jj,1,a)=lam(jj);
RR2(jj,2,a)=c11;
RR2(jj,3,a)=c12;
RR2(jj,4,a)=c13;
RR2(jj,5,a)=c33;
RR2(jj,6,a)=c44;
RR2(jj,7,a)=c66;
RR2(jj,8,a)=(c11-c12)/2;
% cotas
%RR3(jj,1,a,b)=lam(jj);
%RR3(jj,2,a,b)=LEa;
%RR3(jj,3,a,b)=Ea;
%RR3(jj,4,a,b)=UEa;
%RR3(jj,5,a,b)=LEt;
%RR3(jj,6,a,b)=Et;
%RR3(jj,7,a,b)=UEt;

%cotas
%RR4(jj,1,a,b)=lam(jj);
%RR4(jj,2,a,b)=LGa;
%RR4(jj,3,a,b)=Ga;
%RR4(jj,4,a,b)=UGa;
%RR4(jj,5,a,b)=LGt;
%RR4(jj,6,a,b)=Gt;
%RR4(jj,7,a,b)=UGt;


%cotas
%RR5(jj,1,a,b)=lam(jj);
%RR5(jj,2,a,b)=LPa;
%RR5(jj,3,a,b)=Pa;
%RR5(jj,4,a,b)=UPa;
%RR5(jj,5,a,b)=LPt;
%RR5(jj,6,a,b)=Pt;
%RR5(jj,7,a,b)=UPt;



%cotas
%RR6(jj,1,a,b)=lam(jj);
%RR6(jj,2,a,b)=Lk;
%RR6(jj,3,a,b)=kas;
%RR6(jj,4,a,b)=Uk;

end  % fin del ciclo donde se incrementa lam

%end  % fin de ciclo para variar la fibra 

%end  % fin de ciclo para variar la matriz

%******************************************************************************
% Formato de salida

%for a=comb1:comb1;
 %  for b=comb2:comb2;
 %***********************************************a********************************
 % Formato de salida

 disp('      ')
disp('   Coeficientes Effectivos')
disp('      ')
disp('       Vf        c11        c12      c13      c33       c44       c66 ')    
disp(' ------------------------------------------------------------------------')
%format short
format long
disp(RR2(:,:,a))
pause

 
 figure (1);
plot(RR(:,1,a),RR(:,2,a)/Eam(a),'-', ...
     RR(:,1,a),RR(:,3,a)/Pam(a),'-.', ...
     RR(:,1,a),RR(:,4,a)/Gam(a),'.')
axis([0 0.785 0 1.1])
xlabel('V_{2}') ,
ylabel('E_{a} / E_{1} (-),  p / \mu_{1} (.),  \nu_{a} / \nu_{1} (-.)')
print figura5extrameguidkalamkarov.ps -deps   
   pause
   
   figure (2);
plot(RR1(:,1,a),RR1(:,3,a)/Eam(a),'-', ...
RR1(:,1,a),RR1(:,4,a)/Pam(a),'-.', ...	
RR1(:,1,a),RR1(:,2,a)/Gam(a),'.') 
axis([0 0.785 0 1.1])
xlabel('V_{2}') ,
ylabel('E_{t} / E_{1} (-),  m / \mu_{1} (.),  \nu_{t} / \nu_{1} (-.)')
print figura5ameguidkalamkarov.ps -deps
