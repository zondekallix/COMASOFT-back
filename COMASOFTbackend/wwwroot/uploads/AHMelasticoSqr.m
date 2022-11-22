function RR = AHMelasticoSq(z1,z2,lam)
                       
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
                    
%***********************************************************
% Metodo de Homogenizacion Asintotica
%*************************************************************
% Simetr�a Hexagonal.
% Caso Elastico y Transversalmente isotr�pico.
%*************************************************************
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
ang=pi/2;
xas=c66f/c66m;
x1=3-4*(c12m/(c11m+c12m));
x2=3-4*(c12f/(c11f+c12f));
dd=1;
d1=pi;
S(4)=3.1512114; 
d1=pi/sin(ang);
gam1=-5*S(4)/pi;
xasx1=xas*x1;
B=(1-xas)/(1+xasx1);
E=-1/(1+xasx1);
A=B*(xasx1-x2)/(xas+x2);
alf3=-A/B;
x=c44f/c44m;
X=(1-x)/(1+x);
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


%*******************************************************************************************
   
r=sqrt(lam/pi);
rd=lam;
Ao=B*lam*(x1-gam1/pi);
Wo=xas*(1-rd)+((rd)/(x1-1)+0.5)*(x2-1);
C=B*(1+xasx1-xas-x2)/Wo;
P=B*(x2-1)/(2*Wo);

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
X3=1+B*(x1+gam1/pi)*lam-B*Gnk(1,1)+A*Rnk(1,1);
%*************************************************************************************
% C�lculo de otras matrices:  U V Y Z
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
%C�lculo de Vectores

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

k1=-(x2-1)/(2*Wo)*((lam-1-B*(x1+1)*((x2-1)/(2*Wo))*N1IZN2));
k2=1+(x1+1)*E/(X2-R);
k3=(-1+2/((x+1)*(1+dd*lam*X-(X^2)*N1IYN2)));
%********************************************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%********************************************************************************************
c11=c11m*(1-lam)+c11f*lam +lam*(k2*dt1-(dt2)^2*k1/c66m);

c12=c12m*(1-lam)+c12f*lam -lam*(k2*dt1+(dt2)^2*k1/c66m);

c13=c13m*(1-lam)+c13f*lam -lam*(dt2*dt3*k1/c66m);

c33=c33m*(1-lam)+c33f*lam -lam*(dt3^2*k1/c66m);

c66=c66m-c66m*(x1+1)*B*lam/(X3-V1IVV2);

c44=c44m*(1-lam)+c44f*lam -lam*(k3*dt5);

k=(c11+c12)/2;
%  Deposito de los coeficientes para la salida

RR(1)=c11;
RR(2)=c12;
RR(3)=c13;
RR(4)=c33;
RR(5)=c44;
RR(6)=c66;
RR(7)=k;

%******************************************************************************************

%******************************************************************************************
