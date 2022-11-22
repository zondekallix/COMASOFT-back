clear
clear rest
v1=[0.35];%matrix a
v2=[0.22];%fibra b
%E2E1=[21.19 25.19 30 35.19 40.19 400];%c 
c11m=5.5370371;
c12m=2.9814815;
c13m=2.9814815;
c33m=5.5370371;
c44m=1.2777778;
c66m=1.2777778;
km=0.5*(c11m+c12m);
mm=0.5*(c11m-c12m);

E1=c33m-4*km*v1^2;
miulan1=(1-2*v1)./(2*v1);
miulan2=(1-2*v2)./(2*v2);
EE=2*v1./(1-2*v1);


ang=pi/3;

x1=3-4.*v1;
x2=3-4.*v2;
d1=pi/sin(ang);
gam1=0;
%**********************************************************

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
     % Comienzo de un ciclo para variar el volumen de la fibra y x asterisco
%lam=0:0.01:0.785;
lam=0:0.01:pi/4/sin(pi/3);
xas=[0.9 6 20 120];

  for ii=1:length(xas),


      for jj=1:length(lam),  %comienzo de ciclo de lam

   
   clear r rd Eta Rnk Gnk
  
   
   r=sqrt(lam(jj)*sin(ang)/pi);
   
   
   %******************************************************************************************
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

Gnk(n,k)=-n*((fact(n+k+2,n+1))*(S(n+k+2))*(r^(n+k+2))-...
         (fact(n+k,n))*(T(n+k+1))*(r^(n+k)));

   end
end
   
   %**************************************************

xasx1=xas(ii)*x1;
B=(1-xas(ii))/(1+xasx1);
E=-1/(1+xasx1);
A=B*(xasx1-x2)/(xas(ii)+x2);
Ao=B*lam(jj)*(x1-gam1/pi);
Wo=xas(ii)*(1-lam(jj))+((lam(jj))/(x1-1)+0.5)*(x2-1);
C=B*(1+xasx1-xas(ii)-x2)/Wo;
P=B*(x2-1)/(2*Wo);
alf3=-A/B;
%*********************************************************
Ae=-1;
Be=1;
G=0.5 + lam(jj)/(x1-1);
Ce=-1/G;
PPe=1/(2*G);
Ee=1;
Xe=1;
alf3e=-Ae/Be;
Aoe=Be*lam(jj)*(x1-gam1/pi);
%........................................................................
Ar=-1;
Br=-1/x1;
Cr=(1-x1)/(x1*(1-lam(jj)));
Xr=-1;
alf3r=-Ar/Br;
Aor=Br*lam(jj)*(x1-gam1/pi);

%........................................................................

AA=xas(ii)*((1-v2)/(1-2*v2))*((1-2*v1)/(1-v1));
BB=(xas(ii)-1)*((1-2*v1)/(2*(1-v1)));
CC=(xas(ii)-1)/EE;
DD=xas(ii)*(v2/v1)*((1-2*v1)/(1-2*v2));
X2=1+Ao+ B*Gnk(1,1)+A*Rnk(1,1);
X=(1-xas(ii))/(1+xas(ii));
X3=1+B*(x1+gam1/pi)*lam(jj)-B*Gnk(1,1)+A*Rnk(1,1);
%****************************************************************************

X2e=1+Aoe+ Be*Gnk(1,1)+Ae*Rnk(1,1);
X3e=1+Be*(x1+gam1/pi)*lam(jj)-Be*Gnk(1,1)+Ae*Rnk(1,1);
X2r=1+Aor+ Br*Gnk(1,1)+Ar*Rnk(1,1);
X3r=1+Br*(x1+gam1/pi)*lam(jj)-Br*Gnk(1,1)+Ar*Rnk(1,1);

%**************************************************************************
% Cálculo de otras matrices: H, I, J, K ,D
for t=1:2,
for s=1:2,
% La matriz H  de los problemas I11,I22,I33      
H(2*t-1,2*s-1)=di(6*t-3,6*s-3)+A*Rnk(6*t-3,6*s-3); %H11 de la submatriz H_ts
H(2*t-1,2*s)=B*Gnk(6*t-3,6*s+1);                %H12 de la submatriz H_ts
H(2*t,2*s)=di(6*t+1,6*s+1)+A*Rnk(6*t+1,6*s+1); %H22 de la submatriz H_ts     
H(2*t,2*s-1)=B*Gnk(6*t+1,6*s-3);               %H21 de la submatriz H_ts
%***************************
D(t,s)=di(6*t-1,6*s-1)+A*Rnk(6*t-1,6*s-1)+B*Gnk(6*t-1,6*s-1)+C*Eta(1,6*s-1)*Eta(6*t-1,1);
Y(t,s)=di(6*t-1,6*s-1)-(X^2)*Rnk(6*t-1,6*s-1)-(X^2)*Eta(6*t-1,1)*Eta(1,6*s-1);

end
end 
%........................................................... 
% Cálculo de otras matrices: He, Ie, Je, Ke ,De
for t=1:2,
for s=1:2,
% La matriz He  de los problemas I11,I22,I33   
He(2*t-1,2*s-1)=di(6*t-3,6*s-3)+Ae*Rnk(6*t-3,6*s-3); %H11 de la submatriz
%H_ts
He(2*t-1,2*s)=Be*Gnk(6*t-3,6*s+1);                %H12 de la submatriz
%H_ts
He(2*t,2*s)=di(6*t+1,6*s+1)+Ae*Rnk(6*t+1,6*s+1); %H22 de la submatriz H_ts   
He(2*t,2*s-1)=Be*Gnk(6*t+1,6*s-3);               %H21 de la submatriz H_ts
%***************************
De(t,s)=di(6*t-1,6*s-1)+Ae*Rnk(6*t-1,6*s-1)+Be*Gnk(6*t-1,6*s-1)...
        +Ce*Eta(1,6*s-1)*Eta(6*t-1,1);
Ye(t,s)=di(6*t-1,6*s-1)-(Xe^2)*Rnk(6*t-1,6*s-1)-...
        (Xe^2)*Eta(6*t-1,1)*Eta(1,6*s-1);

end
end 
%...........................................................

H1=inv(H);
D1=inv(D);
IY=inv(Y);
%...........................................................

H1e=inv(He);
D1e=inv(De);
IYe=inv(Ye);
%**************************************************************************
% Cálculo de otras matrices: Hr, Ir, Jr, Kr ,Dr
for t=1:2,
for s=1:2,
% La matriz Hr  de los problemas I11,I22,I33
Hr(2*t-1,2*s-1)=di(6*t-3,6*s-3)+Ar*Rnk(6*t-3,6*s-3); %H11 de la submatriz
%H_ts
Hr(2*t-1,2*s)=Br*Gnk(6*t-3,6*s+1);                %H12 de la submatriz
%H_ts
Hr(2*t,2*s)=di(6*t+1,6*s+1)+Ar*Rnk(6*t+1,6*s+1); %H22 de la submatriz H_ts
Hr(2*t,2*s-1)=Br*Gnk(6*t+1,6*s-3);               %H21 de la submatriz H_ts
%***************************
Dr(t,s)=di(6*t-1,6*s-1)+Ar*Rnk(6*t-1,6*s-1)+Br*Gnk(6*t-1,6*s-1)+...
        Cr*Eta(1,6*s-1)*Eta(6*t-1,1);
Yr(t,s)=di(6*t-1,6*s-1)-(Xr^2)*Rnk(6*t-1,6*s-1)-...
        (Xr^2)*Eta(6*t-1,1)*Eta(1,6*s-1);

end
end 
%...........................................................
H1r=inv(Hr);
D1r=inv(Dr);
IYr=inv(Yr);
%...........................................................

  %linea 219          

%************************************************************************
%Cáculo de Vectores

for s=1:2
b1(2*s-1)=B*Gnk(1,6*s-3); %lugar impar
b1(2*s)=A*Rnk(1,6*s+1);   %lugar par
b2(2*s-1)=B*Gnk(6*s-3,1); %lugar impar
b2(2*s)=A*Rnk(6*s+1,1);   %lugar par
%*********************************
N2(s,1)=Eta(6*s-1,1);
N1(1,s)=Eta(1,6*s-1);

end

R=b1*(H1*b2');
F1=(x1+1)*P*N2'*(D1*N1');
N1IYN2=N2'*(IY*N1');

%************************************************************************
%Cáculo de Vectores (empty)

for s=1:2
b1e(2*s-1)=Be*Gnk(1,6*s-3); %lugar impar
b1e(2*s)=Ae*Rnk(1,6*s+1);   %lugar par
b2e(2*s-1)=Be*Gnk(6*s-3,1); %lugar impar
b2e(2*s)=Ae*Rnk(6*s+1,1);   %lugar par
%*********************************
N2e(s,1)=Eta(6*s-1,1);
N1e(1,s)=Eta(1,6*s-1);

end

Re=b1e*(H1e*b2e');
F1e=(x1+1)*PPe*N2e'*(D1e*N1e');
N1eIYeN2e=N2e'*(IYe*N1e');

%************************************************************************
%Cáculo de Vectores (rigid)

for s=1:2
b1r(2*s-1)=Br*Gnk(1,6*s-3); %lugar impar
b1r(2*s)=Ar*Rnk(1,6*s+1);   %lugar par
b2r(2*s-1)=Br*Gnk(6*s-3,1); %lugar impar
b2r(2*s)=Ar*Rnk(6*s+1,1);   %lugar par
%*********************************
N2r(s,1)=Eta(6*s-1,1);
N1r(1,s)=Eta(1,6*s-1);

end

Rr=b1r*(H1r*b2r');
%F1r=(x1+1)*Pr*N2r'*(D1r*N1r');
F1e=N2e'*(D1e*N1e');
N1rIYrN2r=N2r'*(IYr*N1r');
%....................................................................
Ke=PPe*((1-lam(jj))+(1+x1)*PPe*F1e)/Be;
Me=(1+x1)*Ee/(X2e-Re);
Pe=1/(1+lam(jj)-N1eIYeN2e);
%....................................................................
Kr=1+((x1-1)/(1-lam(jj)))*(G-(1+x1)*Br*N2r'*(D1r*N1r')/(1-lam(jj)));
Mr=(1+x1)/(x1*(X2r-Rr));
Pr=1/(1-lam(jj)-N1rIYrN2r);

%.................................................................

%Coeficientes efectivos para empty fibres

kempty=km*(1-lam(jj) - lam(jj)*km*Ke/mm);

lempty=c13m*(1-lam(jj) - lam(jj)*km*Ke/mm);
nempty=c33m*(1-lam(jj) - lam(jj)*(c13m)^2*Ke/(c33m*mm));
pempty=c44m*(1-2*lam(jj)*Pe);
mempty=mm*(1-lam(jj)*Me);
%mempty=mm*(lam(jj)*Me)/(1/(1/(lam(jj)*Me)-1));
%mempty=mm/(1+(lam(jj)*Me)+(lam(jj)*Me)^2+(lam(jj)*Me)^3+...
%            (lam(jj)*Me)^4+(lam(jj)*Me)^5+(lam(jj)*Me)^6 ... 
%);

c11empty=kempty+mempty;
c12empty=kempty-mempty;
%Ptempty=(c12empty*nempty-(lempty)^2)/(c11empty*nempty-(lempty)^2);

%prueba=1-lam(jj)*Me;
%prueba1=1/(1+(lam(jj)*Me)+(lam(jj)*Me)^2+(lam(jj)*Me)^3+ ...
%            (lam(jj)*Me)^4+(lam(jj)*Me)^5+(lam(jj)*Me)^6+ ... 
%            (lam(jj)*Me)^7+(lam(jj)*Me)^8+(lam(jj)*Me)^9+ ...
%            (lam(jj)*Me)^10+(lam(jj)*Me)^11+(lam(jj)*Me)^12+...
%            (lam(jj)*Me)^13+(lam(jj)*Me)^14+(lam(jj)*Me)^15+ ... 
%            (lam(jj)*Me)^16+(lam(jj)*Me)^17+(lam(jj)*Me)^18+ ... 
%            (lam(jj)*Me)^19+(lam(jj)*Me)^20+(lam(jj)*Me)^21+ ... 
%            (lam(jj)*Me)^22+(lam(jj)*Me)^23+(lam(jj)*Me)^24+ ...
%            (lam(jj)*Me)^25+(lam(jj)*Me)^26+(lam(jj)*Me)^27+ ...
%            (lam(jj)*Me)^28+(lam(jj)*Me)^29+(lam(jj)*Me)^30+ ... 
%            (lam(jj)*Me)^31+(lam(jj)*Me)^32+(lam(jj)*Me)^33+ ... 
%            (lam(jj)*Me)^34+(lam(jj)*Me)^35+(lam(jj)*Me)^36+ ...
%            (lam(jj)*Me)^37+(lam(jj)*Me)^38+(lam(jj)*Me)^39+ ...
%	    (lam(jj)*Me)^40+(lam(jj)*Me)^41+(lam(jj)*Me)^42+ ...
%	    (lam(jj)*Me)^43+(lam(jj)*Me)^44+(lam(jj)*Me)^45+ ...
%	    (lam(jj)*Me)^46+(lam(jj)*Me)^47+(lam(jj)*Me)^48+ ...
%	    (lam(jj)*Me)^49+(lam(jj)*Me)^50+(lam(jj)*Me)^51+ ...
%	    (lam(jj)*Me)^52+(lam(jj)*Me)^53+(lam(jj)*Me)^54+ ...
%	    (lam(jj)*Me)^55+(lam(jj)*Me)^56+(lam(jj)*Me)^57+ ...
%	    (lam(jj)*Me)^58+(lam(jj)*Me)^59+(lam(jj)*Me)^60+ ...
%	    (lam(jj)*Me)^61+(lam(jj)*Me)^62+(lam(jj)*Me)^63+ ...
%	    (lam(jj)*Me)^64+(lam(jj)*Me)^65+(lam(jj)*Me)^66+ ...
%	    (lam(jj)*Me)^67+(lam(jj)*Me)^68+(lam(jj)*Me)^69+ ...
%	    (lam(jj)*Me)^70+(lam(jj)*Me)^71+(lam(jj)*Me)^72+ ...
%	    (lam(jj)*Me)^73+(lam(jj)*Me)^74+(lam(jj)*Me)^75+ ...
%	    (lam(jj)*Me)^76+(lam(jj)*Me)^77+(lam(jj)*Me)^78+ ...
%	    (lam(jj)*Me)^79+(lam(jj)*Me)^80+(lam(jj)*Me)^81+ ...
%	    (lam(jj)*Me)^82+(lam(jj)*Me)^83+(lam(jj)*Me)^84+ ...
%	    (lam(jj)*Me)^85+(lam(jj)*Me)^86+(lam(jj)*Me)^87+ ...
%	    (lam(jj)*Me)^88+(lam(jj)*Me)^89+(lam(jj)*Me)^90+ ...
%	    (lam(jj)*Me)^91+(lam(jj)*Me)^92+(lam(jj)*Me)^93+ ...
%	    (lam(jj)*Me)^94+(lam(jj)*Me)^95+(lam(jj)*Me)^96+ ...
%	    (lam(jj)*Me)^97+(lam(jj)*Me)^98+(lam(jj)*Me)^99+ ...
%	    (lam(jj)*Me)^100+(lam(jj)*Me)^101+(lam(jj)*Me)^102+ ...
%	    (lam(jj)*Me)^103+(lam(jj)*Me)^104+(lam(jj)*Me)^105+ ...
%	    (lam(jj)*Me)^106+(lam(jj)*Me)^107+(lam(jj)*Me)^108+ ...
%	    (lam(jj)*Me)^109+(lam(jj)*Me)^110+(lam(jj)*Me)^111+ ...
%	    (lam(jj)*Me)^112+(lam(jj)*Me)^113+(lam(jj)*Me)^114);
%mempty=mm*prueba1;
c11empty=kempty+mempty;
c12empty=kempty-mempty;
pto=v1;
Paempty=lempty/(2*kempty);
Eaempty=nempty-(lempty*lempty)/kempty;
%Eaempty=nempty-4*kempty*(Paempty)^2;
pto=v1;
%Paempty=lempty/(2*kempty);
%Eaempty=nempty-(lempty*lempty)/kempty;
%Eaempty=nempty-4*kempty*(Paempty)^2;

mmmempty=nempty/Eaempty; %formula 3 p.544 de Hashin 1979

%mmmempty=1+(4*kempty*(Paempty)^2)/Eaempty;
%Ptempty=(kempty-mmmempty*mempty)/(kempty+mmmempty*mempty);
%Etempty=2*(1+Ptempty)*mempty;
Etempty=4*kempty*mempty/(kempty+mmmempty*mempty);
%Ptempty=1-2/(1+kempty/(mmmempty*mempty));


%mmmempty=nempty/Eaempty; %formula 3 p.544 de Hashin 1979
%mmmempty=0;


%mmmempty=1+(4*kempty*(Paempty)^2)/Eaempty;
%Ptempty=(kempty-mmmempty*mempty)/(kempty+mmmempty*mempty);
%Etempty=2*(1+Ptempty)*mempty;
%Etempty=4*kempty*mempty/(kempty+mmmempty*mempty);
%Ptempty=1-2/(1+kempty/(mmmempty*mempty));

pto=v1;
Paempty=lempty/(2*kempty);
Eaempty=nempty-(lempty*lempty)/kempty;
%Eaempty=nempty-4*kempty*(Paempty)^2;

%mmmempty=1+(4*kempty*(Paempty)^2)/Eaempty;
%kempty=0;
%Ptempty=(kempty-mmmempty*mempty)/(kempty+mmmempty*mempty);
%Etempty=2*(1+Ptempty)*mempty;
%Etempty=4*kempty*mempty/(kempty+mmmempty*mempty);
%Ptempty=1-2/(1+kempty/(mmmempty*mempty)); 
%Ptempty=Etempty/(2*mempty)-1;
%Ptempty=Etempty/(2*mempty)*(1-2*mempty/Etempty);
%Ptempty=(kempty-mempty*nempty/Eaempty)/(kempty+mempty*nempty/Eaempty);
%Ptempty=(kempty-pempty*nempty/Eaempty)/(kempty+pempty*nempty/Eaempty);
%Ptempty=((1/(2*mempty)-1/Etempty)/(1/(Etempty*2*mempty)))/(2*mempty);
%Ptempty=(Etempty)/(1/(1/(2*mempty)-1/Etempty));
P13empty=2*lempty/kempty;
P12empty=(c12empty*nempty-lempty^2)/(c11empty*nempty-lempty^2);
P31empty=lempty*2*mempty/(c11empty*nempty-lempty^2);
Ptempty=lempty*2*mempty/(c11empty*nempty-lempty^2);

%Coeficientes efectivos para rigid fibres
krigid=km*(1+lam(jj)*Kr);
mrigid=mm*(1+lam(jj)*Mr);
c12rigid=krigid-mrigid;
c11rigid=krigid+mrigid;
prigid=c44m*(1+2*lam(jj)*Pr);
%Ptrigid=(krigid-mrigid)/(krigid + mrigid);	       
%Etrigid=2*(1+Ptrigid)*mrigid;
Etrigid=(4*krigid*mrigid)/(krigid+mrigid);
%Ptrigid=Etrigid/(2*mrigid)-1;
Ptrigid=c12rigid/c11rigid;
%****************************************************************************
alpha1=(1-x2)*((1-lam(jj))+ F1)/(2*Wo);
alpha2=-1-(x1+1)*E/(1+Ao+A*Rnk(1,1)-R);
%***************************************************************************
% FORMULA DE LOS COEFICIENTES EFECTIVOS (PROBLEMAS PLANOS)
%********************************************************************************************
h11=1-lam(jj) + lam(jj)*(AA +BB*alpha2+2*alpha1*((1-v1)/(1-2*v1))*((1-AA+BB)^2));
h12=1-lam(jj) + lam(jj)*(DD + EE*alpha1*((1-DD-CC)^2)-alpha2*CC);
h13=1-lam(jj) + lam(jj)*(DD + EE*alpha1*(1-DD-CC)*(1-DD));
h33=1-lam(jj) + lam(jj)*AA + lam(jj)*alpha1*((1-DD)^2)*(EE^2)/(EE+2);
h44=1-2*X*lam(jj)/(1+X*lam(jj)-X^2*N1IYN2);
%h66=(h11-h12)/2;
k=.5*(h11*c11m+h12*c12m);
%m=0.5*(h11-h12);
%c66m=0.5*(c11m-c12m);
m=.5*(h11*c11m-h12*c12m);
Pa=.5*h13*c13m/k;
Ea=h33*c33m-4*k*(Pa)^2;
mmm=h33*c33m/Ea;
%Pt=(k-h44*c44m*c33m*h33/Ea)/(k+h44*c44m*c33m*h33/Ea);
% Pt=(k-m*mm*c33m*h33/Ea)/(k+m*mm*c33m*h33/Ea);
Pt=(k-mmm*m)/(k + mmm*m);               

%Pt=h13*c13m*(h11*c11m-h12*c12m)/(h11*c11m*h33*c33m-(h13*c13m)^2);

Et=2*(1+Pt)*m;
%*********************************************************************
%  Deposito de los coeficientes para la salida

%RR0(jj,1,ii)=lam(jj);
%RR0(jj,2,ii)=prueba;
%RR0(jj,3,ii)=prueba1;


RR(jj,1,ii)=lam(jj);
RR(jj,2,ii)=h13;
RR(jj,3,ii)=lempty/c13m;

RR1(jj,1,ii)=lam(jj);
RR1(jj,2,ii)=h33;
RR1(jj,3,ii)=nempty/c33m;

RR4(jj,1,ii)=lam(jj);
RR4(jj,2,ii)=k/km;
RR4(jj,3,ii)=kempty/km;
RR4(jj,4,ii)=krigid/km;

RR5(jj,1,ii)=lam(jj);
RR5(jj,2,ii)=m/mm;
RR5(jj,3,ii)=mempty/mm;
RR5(jj,4,ii)=mrigid/mm;

RR7(jj,1,ii)=lam(jj);
RR7(jj,2,ii)=h44;
RR7(jj,3,ii)=pempty/c44m;
RR7(jj,4,ii)=prigid/c44m;

RR8(jj,1,ii)=lam(jj);
RR8(jj,2,ii)=Et/E1;
RR8(jj,3,ii)=Etempty/E1;
RR8(jj,4,ii)=Etrigid/E1;

RR9(jj,1,ii)=lam(jj);
RR9(jj,2,ii)=Pt/v1;
RR9(jj,3,ii)=Ptempty/v1;
RR9(jj,4,ii)=Ptrigid/pto;


RR10(jj,1)=lam(jj);
RR10(jj,2)=Ptempty/v1;
RR10(jj,3)=Ptrigid;





RR11(jj,1)=lam(jj);
RR11(jj,2)=P13empty/v1;
RR11(jj,3)=P12empty/v1;
RR11(jj,4)=P31empty/v1;

       



%*********************************************************************************
end
end
%figure(15);
%plot(lam,RR0(:,2,1),'--', lam,RR0(:,3,1),'-' )

%pause

figure (1);
plot( lam,RR4(:,3,1),'o', ...
      lam,RR4(:,2,1),'--', ...
      lam,RR4(:,2,2),'-.', ...
      lam,RR4(:,2,3),'.',...
      lam,RR4(:,2,4),'*', ...
      lam,RR4(:,4,1),'-')
legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);
%axis([0 0.785 0 7])
xlabel('V_{2}') ,
ylabel('k^{*} / k_{1}')

print hexaemptynormalrigid1.ps -deps
pause

figure (2);
plot(lam,RR5(:,3,1),'o', ...
     lam,RR5(:,2,1),'--', ...
     lam,RR5(:,2,2),'-.', ...
     lam,RR5(:,2,3),'.',...
     lam,RR5(:,2,4),'*', ...
     lam,RR5(:,4,1),'-')
legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);
%axis([0 0.785 0 10])
						  
xlabel('V_{2}') ,
ylabel('m^{*} / \mu_{1}')
print hexaemptynormalrigid2.ps -deps

pause


figure (3);
plot(lam,RR7(:,3,1),'o', ...
     lam,RR7(:,2,1),'--', ...
     lam,RR7(:,2,2),'-.', ...
     lam,RR7(:,2,3),'.',...
     lam,RR7(:,2,4),'*', ...
     lam,RR7(:,4,1),'-')

legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);

%axis([0 0.65 0 5])
 
xlabel('V_{2}') ,
ylabel('p^{*} / \mu_{1}')
print hexaemptynormalrigid3.ps -deps

pause


figure (4);
plot(lam,RR(:,3,1),'o', ...
lam,RR(:,2,1),'--', ...
lam,RR(:,2,2),'-.', ...
lam,RR(:,2,3),'.',...
lam,RR(:,2,4),'*')
legend('0=\mu_2/\mu_1','0.9','6','20','120',0);
%axis([0 0.785 0 4])
xlabel('V_{2}') ,
ylabel('l^{*} / \lambda_{1}') 
print hexaemptynormalrigid4.ps -deps

pause

figure (5);
plot(lam,RR1(:,3,1),'o', ...
lam,RR1(:,2,1),'--', ...
lam,RR1(:,2,2),'-.', ...
lam,RR1(:,2,3),'.',...
lam,RR1(:,2,4),'*')
legend('0=\mu_2/\mu_1','0.9','6','20','120',0);
%axis([0 0.785 0 55])
xlabel('V_{2}') ,
ylabel('n^{*} / (\lambda_{1} + 2\mu_{1})') 
print hexaemptynormalrigid5.ps -deps

pause

figure (6);
plot(lam,RR8(:,3,1),'o', ...
lam,RR8(:,2,1),'--', ...
lam,RR8(:,2,2),'-.', ...
lam,RR8(:,2,3),'.',...
lam,RR8(:,2,4),'*', ...
lam,RR8(:,4,1),'-')
%axis([0 0.785 0 9])
legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);
xlabel('V_{2}') ,
ylabel('E^{*}_{t} / E_{1}')
print hexaemptynormalrigid6.ps -deps


pause

figure (7);
plot(lam,RR9(:,3,1),'o', ...
lam,RR9(:,2,1),'--', ...
lam,RR9(:,2,2),'-.', ...
lam,RR9(:,2,3),'.',...
lam,RR9(:,2,4),'*', ...
lam,RR9(:,4,1),'-')
legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);
%axis([0 0.785 0 9])
xlabel('V_{2}') ,
ylabel('\nu^{*}_{t} / \nu_{1}')
print hexaemptynormalrigid7.ps -deps


%disp('     ')
%format short
%disp(RR10(:,3))


%pause

%figure (8);
%plot(lam,RR11(:,2),'o', ...
%lam,RR11(:,3),'--', ...
%lam,RR11(:,4),'-.')
%legend('0=\mu_2/\mu_1','0.9','6','20','120','infinity',0);
%axis([0 0.785 0 9])
%xlabel('V_{2}') ,
%ylabel('\nu^{*}_{t} / \nu_{1}')
%print hexaemptynormalrigid8.ps -deps
















