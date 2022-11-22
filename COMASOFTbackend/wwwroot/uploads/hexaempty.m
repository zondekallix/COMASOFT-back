%*************************************************************
%DETERMINACION DE LOS COEFICIENTES EFECTIVOS PARA EL CASO
%EN QUE EL ANGULO ES pi/3. COMPARACION CON LAS COTAS REPORTADAS
%EN HASHIN, 1979, J. APPLIED MECHANICS, VOL. 46, 543-550.
%*************************************************************
%*************************************************************
clear all
%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%*************************************************************
texto='ESPERE UN MOMENTO, ESTOY CALCULANDO';
disp(texto)
%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%*************************************************************
%   Epoxy   Epoxy resine  Lagache(Ta.1,4)   florencia
Eam=[74.5 3.45   1.7097          2.9         4        2.8 3.45];
Etm=[74.5 3.45   1.7097          2.9         4        2.8 3.45];
Gam=[12.8 1.28   1.2759          1.0357      1.4925   1.12 1.2777778];
Gtm=[12.8 1.28   1.2759          1.0357      1.4925   1.12 1.2777778];
Pam=[0.10 0.35   0.34            0.40        0.34     0.25 0.35];
Ptm=[0.10 0.35    0.34           0.40        0.34     0.25 0.35];
%*************************************************************
matrix=2;
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
%*************************************************************
%*************************************************************
%CONTRASTE ENTRE LAS PROPIEDADES DE LA MATRIZ Y LA FIBRA     *
%*************************************************************

dt1=c66m(a);
dt2=(c11m(a)+c12m(a))/2;
dt3=c13m(a);
dt5=c44m(a);


%***********************************************************
ang=pi/3;
xas=0;
x1=3-4*(c12m(a)/(c11m(a)+c12m(a)));
gam1=0;
xasx1=xas*x1;
B=1;
E=-1;
A=-1;
x=0;
X=1;
%*******************************************************************************************
S(6)=5.8630316;                    T(5)=5.6568027;
S(12)=6.00096399;                  T(11)=6.0301854;
S(18)=5.9997183;                   T(17)=5.9991792;  
S(24)=6.0000116;                   T(23)=6.0000352;
S(30)=5.9999996;                   T(29)=5.9999987; 
S(36)=6.0000000;                   T(35)=6.0000000; 
S(42)=6.0000000;                   T(41)=6.0000000; 
S(48)=6.0000000;                   T(47)=6.0000000;
S(54)=6.0000000;                   T(53)=6.0000000;
S(60)=6.0000000;                   T(59)=6.0000000;
S(66)=6.0000000;                   T(65)=6.0000000;
S(72)=6.0000000;                   T(71)=6.0000000;
S(78)=6.0000000;                   T(77)=6.0000000;
S(84)=6.0000000;                   T(83)=6.0000000;
S(90)=6.0000000;                   T(89)=6.0000000;
S(96)=6.0000000;                   T(95)=6.0000000; 
S(102)=6.0000000;                  T(101)=6.0000000;


%******************************************************************************************
%   Matriz factorial
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

lam=0:0.01:pi/4/sin(ang);
for jj=1:length(lam),  %comienzo de ciclo de lam
   
r=sqrt(lam(jj)*sin(ang)/pi);
Ao=B*lam(jj)*(x1-gam1/pi);
G=0.5+lam(jj)/(x1-1);
C=-1/G;
P=0.5/G;

clear Eta Rnk Gnk H D Y Y1 b1 b2 n1 n2 R F1 N1IYN2 N1IY1N2 k1 k2 k3 k4 
clear c11 c12 c13 c33 e31 e33 k33 F1 D D1 
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
   
   %**************************************************`

%********************************************************************************************
% Cálculo de otras matrices: H, I, J, K ,D
for t=1:2,
   for s=1:2;
   H(2*t-1,2*s-1)=di(6*t-3,6*s-3)+A*Rnk(6*t-3,6*s-3);
   H(2*t,2*s-1)=B*Gnk(6*t+1,6*s-3);
   H(2*t,2*s)=di(6*t+1,6*s+1)+A*Rnk(6*t+1,6*s+1);      
   H(2*t-1,2*s)=B*Gnk(6*t-3,6*s+1);
   D(t,s)=di(6*t-1,6*s-1)+A*Rnk(6*t-1,6*s-1)+B*Gnk(6*t-1,6*s-1)+C*Eta(1,6*s-1)*Eta(6*t-1,1);
   Y(t,s)=di(6*t-1,6*s-1)-(X^2)*Rnk(6*t-1,6*s-1)-(X^2)*Eta(6*t-1,1)*Eta(1,6*s-1);

    end
 end 
 
      H1=inv(H);
      D1=inv(D);
      IY=inv(Y);
          
  %linea 219          

%*********************************************************************************************
%Cáculo de Vectores

    for s=1:2
      b1(2*s-1)=B*Gnk(1,6*s-3);
      b1(2*s)=A*Rnk(1,6*s+1);
      b2(2*s-1)=B*Gnk(6*s-3,1);
      b2(2*s)=A*Rnk(6*s+1,1);
      N2(s,1)=Eta(6*s-1,1);
      N1(1,s)=Eta(1,6*s-1);

    end

      R=b1*(H1*b2');
      F1=(x1+1)*P*N2'*(D1*N1');
      N1IYN2=(X^2)*N2'*(IY*N1');

            
%********************************************************************************************
%F1=0;
%R=0;
%N1IYN2=0;

k1=((1-lam(jj))+ F1)/(2*G);
k2=1+(x1+1)*E/(1+Ao+A*Rnk(1,1)-R);
k3=(-1+2/((1+lam(jj)*X-N1IYN2)*(x+1)));

%********************************************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (ELASTICOS)
%********************************************************************************************

c11=c11m(a)*(1-lam(jj)) +lam(jj)*(k2*dt1-(dt2)^2*k1/c66m(a));
c12=c12m(a)*(1-lam(jj)) -lam(jj)*(k2*dt1+(dt2)^2*k1/c66m(a));
c13=c13m(a)*(1-lam(jj)) -lam(jj)*(dt2*dt3*k1/c66m(a));
c33=c33m(a)*(1-lam(jj)) -lam(jj)*(dt3^2*k1/c66m(a));
c66=c66m(a)*(1-lam(jj)) +lam(jj)*(k2*dt1);
c44=c44m(a)*(1-lam(jj)) -lam(jj)*(k3*dt5);
k=(c11+c12)/2;
m=(c11-c12)/2;



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
mm=c33/Ea;
Ga=1/compliance(4,4); %Ga efectivo
Gt=1/compliance(6,6); %Gt efectivo
%Gt=c66;
Pa=-compliance(1,3)/compliance(3,3); % Poisson a efectivo
%Pt=1-2/(1+k/(mm*m));
%Pt=-compliance(1,2)/compliance(1,1); % Poisson t efectivo
%Pt=c13*2*c66/(c11*c33-c11^2);
Pt=-compliance(1,3)/compliance(1,1);

%Pt=Et/(2*c66)-1;
%Pt=-compliance(2,1)/compliance(2,2); % Poisson t efectivo
%Pt=(k-c44*c33/Ea)/(k+c44*c33/Ea);

% Pt=(k-mm*m)/(k+mm*m);
Pto=(km(a)-c33m(a)/Eam(a)*c66m(a))/(km(a)+c33m(a)/Eam(a)*c66m(a));
%Pt=1-2*mm*m/(k+mm*m);
Pt1=1-2/(1+k/(mm*m));
Pt2=-compliance(1,2)/compliance(1,1); % Poisson t efectivo
Pt3=Et/(2*c66)-1;
Pt4=(k-mm*m)/(k+mm*m);
%Pt=1-2*mm*m/(k+mm*m);



kas=(c11+c12)/2;
%*******************************************************************************
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

RR3(jj,1,a)=lam(jj);
RR3(jj,2,a)=compliance(1,3);
RR3(jj,3,a)=compliance(3,3);

RR4(jj,1,a)=lam(jj);
RR4(jj,2,a)=Et;
RR4(jj,3,a)=2*m;
RR4(jj,4,a)=Et/(2*m);


RR5(jj,1,a)=Pt1;
RR5(jj,2,a)=Pt2;
RR5(jj,3,a)=Pt3;
RR5(jj,4,a)=Pt4;
RR5(jj,5,a)=lam(jj);

RR6(jj,1,a)=lam(jj);
RR6(jj,2,a)=k-m*c33/Ea;
RR6(jj,3,a)= k+m*c33/Ea;
RR6(jj,4,a)=(k-m*c33/Ea)/(k+m*c33/Ea);

% cotas
end  % fin del ciclo donde se incrementa lam

%end  % fin de ciclo para variar la fibra 

%end  % fin de ciclo para variar la matriz

%******************************************************************************
% Formato de salida

%for a=comb1:comb1;
 %  for b=comb2:comb2;
 %*********************************************************************

  figure (1);
  plot(RR(:,1,a),RR(:,2,a)/Eam(a),'-', ... 
       RR(:,1,a),RR(:,3,a)/Pam(a),'-.', ...
       RR(:,1,a),RR(:,4,a)/Gam(a),'.')
legend('Axial Young`s modulus','Axial Poisson`s ratio','Axial shear modulus',0);
%axis([0 0.785 0 1.1]) 
xlabel('V_{2}') ,
ylabel('E^{*}_{a} / E_{1},  p^{*} / \mu_{1},  \nu^{*}_{a} / \nu_{1}')
print figura1emptyhexa.ps -deps   
pause

figure (2);
plot(RR1(:,1,a),RR1(:,3,a)/Eam(a),'-', ...
RR1(:,1,a),RR1(:,4,a)/0.35,'-.', ...     
RR1(:,1,a),RR2(:,7,a)/Gam(a),'.')     
legend('Transverse Young`s modulus','Transverse Poisson`s ratio',...
       'Transverse shear modulus',0); 
%axis([0 0.785 0 1.1])
xlabel('V_{2}') ,
ylabel('E^{*}_{t} / E_{1},  m^{*} / \mu_{1},  \nu^{*}_{t} / \nu_{1}')
  print figuraemptyhexa.ps -deps 
	
pause





       
disp('    ')
disp(' Coeficientes en Poisson transversal al hallar inversa de C')
disp('    ')
disp('     Vf           S12        S11   ')
disp('------------------------------------------------')
format short
disp(RR3(:,:,a))       

pause

disp('    ')
disp(' Coeficientes en Poisson transversal segun Et/2m -1')
disp('    ')
disp('     Vf         Et        2m         Et/2m   ')
disp('------------------------------------------------')
format short
disp(RR4(:,:,a))       

pause

disp('    ')
disp(' Coeficientes en Poisson transversal segun Et/2m -1')
disp('    ')
disp('     Pt1         Pt2        Pt3         Pt4     Vf')
disp('------------------------------------------------')
format short
disp(RR5(:,:,a))       

pause

disp('  ')
disp('    V2       k-m*n/Ea       k+m*n/Ea   numerador/denominadoe ')
format short
disp(RR6(:,:,a))

















