function [RR] = AHMelasticoHex(z1,z2,lam)
 %***********************************************************
% Metodo de Homogenizacion Asintotica
%*************************************************************
% Simetría Hexagonal.
% Caso Elastico y Transversalmente isotrópico.
%*************************************************************


c11m=z1(1);
c12m=z1(2);
c13m=z1(3);
c33m=z1(4);
c44m=z1(5);
c66m=(c11m-c12m)/2;
                     
c11f=z2(1);
c12f=z2(2);
c13f=z2(3);
c33f=z2(4);
c44f=z2(5);
c66f=(c11f-c12f)/2;
                    
%deben entrar los datos de la siguiente forma
% (c11m,c12m,c13m,c33m,c44m...
%  c11f,c12f,c13f,c33f,c44f,Vf)

RR=zeros(length(lam),6);
c66m=(c11m-c12m)/2;
c66f=(c11f-c12f)/2;
km=(c11m+c12m)/2;
kf=(c11f+c12f)/2;

%*************************************************************
%CONTRASTE ENTRE LAS PROPIEDADES DE LA MATRIZ Y LA FIBRA     *
%*************************************************************
dt1=c66m-c66f;
dt2=(c11m-c11f+c12m-c12f)/2;
dt3=(c13m-c13f);
dt5=c44m-c44f;
%Diferencia entre las fibras y la matriz
%***********************************************************
ang=pi/3;
xas=c66f/c66m;
x1=3-4*(c12m/(c11m+c12m));
x2=3-4*(c12f/(c11f+c12f));
gam1=0;
xasx1=xas*x1;
B=(1-xas)/(1+xasx1);
E=-1/(1+xasx1);
A=B*(xasx1-x2)/(xas+x2);
d1=pi/sin(ang);
x=(c44f)/(c44m);
X=(1-x)/(1+x);

S=0;T=0;

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

  
r=sqrt(lam*sin(ang)/pi);
Ao=B*lam*(x1-gam1/pi);
Wo=xas*(1-lam)+((lam)/(x1-1)+0.5)*(x2-1);
C=B*(1+xasx1-xas-x2)/Wo;
P=B*(x2-1)/(2*Wo);

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
      
      for i=1:2:15,
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
% Cálculo de las  matrices: H,Y,D

for t=1:2,
   for s=1:2;
  %*********************************
% La matriz H  de los problemas I11,I22,I33      
   H(2*t-1,2*s-1)=di(6*t-3,6*s-3)+A*Rnk(6*t-3,6*s-3); %H11 de la submatriz H_ts
   H(2*t-1,2*s)=B*Gnk(6*t-3,6*s+1);                %H12 de la submatriz H_ts
   H(2*t,2*s)=di(6*t+1,6*s+1)+A*Rnk(6*t+1,6*s+1); %H22 de la submatriz H_ts     
   H(2*t,2*s-1)=B*Gnk(6*t+1,6*s-3);               %H21 de la submatriz H_ts
   %***************************
% La matriz H  del problema I12      
   H12(2*t-1,2*s-1)=di(6*t-3,6*s-3)+A*Rnk(6*t-3,6*s-3);%H11 de la submatriz H_ts
   H12(2*t-1,2*s)=-B*Gnk(6*t-3,6*s+1);              %H12 de la submatriz H_ts
   H12(2*t,2*s)=di(6*t+1,6*s+1)+A*Rnk(6*t+1,6*s+1); %H22 de la submatriz H_ts      
   H12(2*t,2*s-1)=-B*Gnk(6*t+1,6*s-3);              %H21 de la submatriz H_ts
%********************************************
   D(t,s)=di(6*t-1,6*s-1)+A*Rnk(6*t-1,6*s-1)+B*Gnk(6*t-1,6*s-1)+C*Eta(1,6*s-1)*Eta(6*t-1,1);
   Y(t,s)=di(6*t-1,6*s-1)-(X^2)*Rnk(6*t-1,6*s-1)-(X^2)*Eta(6*t-1,1)*Eta(1,6*s-1);

    end
 end 
 
  H1=inv(H);
  H12=inv(H12);

  D1=inv(D);
 IY=inv(Y);
          

%*********************************************************************************************
%Cáculo de Vectores
%*********************************
% Los vectores b1 y b2 del problema I11,I22,I33      

    for s=1:2
      b1(2*s-1)=B*Gnk(1,6*s-3); %lugar impar
      b1(2*s)=A*Rnk(1,6*s+1);   %lugar par
      b2(2*s-1)=B*Gnk(6*s-3,1); %lugar impar
      b2(2*s)=A*Rnk(6*s+1,1);   %lugar par
%*********************************
% Los vectores b1 y b2 del problema I12      
      b12(2*s-1)=-B*Gnk(1,6*s-3); %lugar impar
      b12(2*s)=A*Rnk(1,6*s+1);    %lugar par
      b22(2*s-1)=-B*Gnk(6*s-3,1); %lugar impar
      b22(2*s)=A*Rnk(6*s+1,1);    %lugar par
%*****************************************
      N2(s,1)=Eta(6*s-1,1);
      N1(1,s)=Eta(1,6*s-1);

    end

      R=b1*(H1*b2');
      R12=b12*(H12*b22');
      
      F1=(x1+1)*P*N1*(D1*N2);
      N1IYN2=(X^2)*N1*(IY*N2);

            
%********************************************************************************************
%F1=0;
%R=0;
%N1IYN2=0;
k1=(x2-1)*((1-lam)+ F1)/(2*Wo);% alfa1
%***********************************************
k2=1+(x1+1)*E/(1+Ao+A*Rnk(1,1)-R); % alfa2 que aparece en los papeles JMPS1-D, pag 20
k21=1+(x1+1)*E/(1+Ao+A*Rnk(1,1)-R12);% alfa3 que aparece en los papeles JMPS1-D, pag 20
%***********************************************
k3=(-1+2/((1+lam*X-N1IYN2)*(x+1)));% alfa4 problema antiplano 

%******************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%******************************************************************
%******************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%******************************************************************
c11=c11m*(1-lam)+c11f*lam +lam*(k2*dt1-(dt2)^2*k1/c66m);

c12=c12m*(1-lam)+c12f*lam -lam*(k2*dt1+(dt2)^2*k1/c66m);

c13=c13m*(1-lam)+c13f*lam -lam*(dt2*dt3*k1/c66m);

c33=c33m*(1-lam)+c33f*lam -lam*(dt3^2*k1/c66m);

c66=(c11-c12)/2;

k=(c11+c12)/2;
%*****************************************************************
%(PROBLEMAS ANTIPLANOS)
c44=c44m*(1-lam)+c44f*lam -lam*(k3*dt5);

%*****************************************************************

RR=[c11 c12 c13 c33 c44 c66 k];

end



