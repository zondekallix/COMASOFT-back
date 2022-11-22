
clear all
clc;

   disp('Constantes ingenieriles_VS_coeficiente de proporcion mesofase');
   %Imprimimos los nombres de los materiales
  disp('Materiales disponibles');
   for i=[1:61 ];
      [Z,nombre]=LeerDatosingenieriles(i);
      disp('-------------------------------------------------------------------------')
       fprintf('  %d-  %s \n',i,nombre);
        DT=num2str(Z,3);%produces the string matrix
        disp(' E_{a}     E_{t}   G_{a}   G_{t}   \nu_{a}   \nu_{t} ')
        disp(DT)
   end

%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA MATRIZ                      *
%*************************************************************
a=input('Matriz  = ');
[Z,MatrixName]=LeerDatosingenieriles(a); % buscar datos ingenieriles
Im=Z;
cm=rigidez(Z); % coeficientes termolelasticos



%*************************************************************
%INTRODUCCION DE LOS DATOS DE LA FIBRA                       *
%*************************************************************
b=input('Inclusion o Fibra  = ');
[Z,InclusionName]=LeerDatosingenieriles(b);% buscar datos ingenieriles
If=Z;
cf=rigidez(Z); % coeficientes termolelasticos 

 
  % Homogeneización por AHM y SECEF
  lam2=input('Volume fraction fiber  = ');
      
         for i=1:length(lam2)
         % AHM
         RR=AHMelasticohex(cm,cf,lam2(i));
         CEAHM(i,:)=[RR];
         IRR=ingenieriles(RR);
         ICEAHM(i,:)=[IRR];
     end
     


disp([ 'Matriz:' ' '  MatrixName])
disp([ 'Fibra:' ' ' InclusionName])   
disp(' *********************************************************************')
disp('       Vf      Ea        Et       Ga         Gt         Pa       Pt  ')
disp(' *********************************************************************')
disp([lam2' ICEAHM])


disp(' *******************************************************************************')
disp('       Vf      c11       c12       c13       c33       c44       c66       k    ')
disp(' *******************************************************************************')
disp([lam2' CEAHM])


     
figure(1);

subplot(3,2,1)
 plot(lam2,CEAHM(:,1),'k-')
  ylabel('c_{11}')  
  
 subplot(3,2,2)
 plot(lam2,CEAHM(:,2),'k-')
  ylabel('c_{12}')     
  
 subplot(3,2,3)
 plot(lam2,CEAHM(:,3),'k-')
  ylabel('c_{13}')    
  
  subplot(3,2,4)
 plot(lam2,CEAHM(:,4),'k-')
  ylabel('c_{33}')    
  
   subplot(3,2,5)
 plot(lam2,CEAHM(:,5),'k-')
  ylabel('c_{44}') 
  xlabel('Fraccion volumetrica de la fibra')
  
   subplot(3,2,6)
 plot(lam2,CEAHM(:,6),'k-')
  ylabel('c_{66}') 
  xlabel('Fraccion volumetrica de la fibra')
  
  
  
 