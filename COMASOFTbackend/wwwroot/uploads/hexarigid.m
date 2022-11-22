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
mm=c66m;

E1=c33m-4*km*v1^2;
miulan1=(1-2*v1)./(2*v1);
miulan2=(1-2*v2)./(2*v2);
EE=2*v1./(1-2*v1);


ang=pi/3;

x1=3-4.*v1;

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
lam=0:0.01:0.91;

   clear r rd Eta Rnk Gnk
for jj=1:length(lam);
   
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

Ar=-1;
Br=-1/x1;
Cr=(1-x1)/(x1*(1-lam(jj)));
Xr=-1;
alf3r=-Ar/Br;
Aor=Br*lam(jj)*(x1-gam1/pi);


X2r=1+Aor+ Br*Gnk(1,1)+Ar*Rnk(1,1);
X3r=1+Br*(x1+gam1/pi)*lam(jj)-Br*Gnk(1,1)+Ar*Rnk(1,1);



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

N1rIYrN2r=N2r'*(IYr*N1r');
%....................................................................
G=0.5+lam(jj)/(x1-1);
%....................................................................
Kr=1+((x1-1)/(1-lam(jj)))*(G-(1+x1)*Br*N2r'*(D1r*N1r')/(1-lam(jj)));
Mr=(1+x1)/(x1*(X2r-Rr));
Pr=1/(1-lam(jj)-N1rIYrN2r);


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
pto=c12m/c11m;
RR(jj,1)=lam(jj);
RR(jj,2)=Etrigid/E1;
%RR(jj,3)=Ptrigid/0.5883;
RR(jj,3)=Ptrigid/pto;

%RR1(jj,1)=lam(jj); 
RR1(jj,1)=prigid/c44m; 

end
%end


 disp('      ')
disp('   Coeficiente Effectivo p')
disp('      ')
disp('       Vf                    p ')    
disp(' -------------------------------------')
format long
disp(RR1(:,:))
pause



figure (1);
plot( lam,RR(:,2),'-', ...
      lam,RR(:,3),'-.')
legend('Transverse Young`s modulus','Transverse Poisson`s ratio',0);
%axis([0 0.785 0 7])
xlabel('V_{2}') ,
ylabel('E^{*}_t / E_1, \nu^{*}_{t} / \nu^{r}_{1}')

print hexarigid1.ps -deps














