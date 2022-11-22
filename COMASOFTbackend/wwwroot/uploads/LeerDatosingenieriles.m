
function [Z,name]=LeerDatosIngenieriles(i)

nombre1='Matrix Lagache Table 2';   nombre2='Fiber Lagache Table 2';
% Lagache tabla2
Ea(1)= 4;                Ea(2)= 84;
Et(1)= 4;                Et(2)= 84;
Ga(1)= 1.4925 ;          Ga(2)= 34.4262 ;
Pa(1)= 0.34 ;            Pa(2)= 0.22 ;
Pt(1)= 0.34;             Pt(2)= 0.22;
Gt(1)=Et(1)/(2*(1+Pt(1))); Gt(2)=Et(2)/(2*(1+Pt(2)));

% Lagache Tabla1 
%(E-Glass)        % Epoxy
nombre3='E-Glass Lagache Tabla1';   nombre4='Epoxy Lagache Tabla1';
Ea(3)= 73;                 Ea(4)= 2.9;
Et(3)= 73;                 Et(4)= 2.9;
Ga(3)= 29.9180 ;           Ga(4)= 1.0357 ;
Pa(3)= 0.22 ;              Pa(4)= 0.40 ;
Pt(3)= 0.22;               Pt(4)= 0.40 ;
Gt(3)=Et(3)/(2*(1+Pt(3))); Gt(4)=Et(4)/(2*(1+Pt(4)));

% Lagache Tabla3    
%mesofase 
nombre5='mesofase Lagache Tabla3';  
Ea(5)= 3.6;               
Et(5)= 3.6;             
Ga(5)= 1.4754 ;         
Pa(5)= 0.22 ;                                   
Pt(5)= 0.22;            
Gt(5)=Et(5)/(2*(1+Pt(5))); 

% Theocaris y varias (1986) Tabla4    
nombre6='mesofase (Theocaris y varias (1986))'; 
nombre7='Matrix (Theocaris y varias (1986)) ';   
nombre8='Fiber (Theocaris y varias (1986))';         

%Matriz                  (E-Glass)                    Mesofase
Ea(7)= 3.21;            Ea(8)= 70;                    Ea(6)= 15.01;
Et(7)= 3.21;            Et(8)= 70;                    Et(6)= 15.01;
Ga(7)= 1.1889;         Ga(8)= 29.1667;                Ga(6)= 5.9563;
Pa(7)= 0.35 ;           Pa(8)= 0.20;                  Pa(6)= 0.26;                  
Pt(7)= 0.35;            Pt(8)= 0.20;                  Pt(6)= 0.26; 
Gt(7)=Et(7)/(2*(1+Pt(7))); Gt(8)=Et(8)/(2*(1+Pt(8))); Gt(6)=Et(6)/(2*(1+Pt(6)));
%
% Theocaris y varias (1986) Tabla 1    
% E-Glass                   Epoxy Resina
nombre9='E-Glass Theocaris y varias (1986)';       
nombre10='Epoxy Resina Theocaris y varias (1986)';
Ea(9)= 10.6;               Ea(10)= 0.5;              
Et(9)= 10.6;               Et(10)= 0.5;         
Ga(9)= 4.3443 ;            Ga(10)= 0.1852 ;           
Pa(9)= 0.22 ;              Pa(10)= 0.35;                            
Pt(9)= 0.22;               Pt(10)= 0.35;   
Gt(9)=Et(9)/(2*(1+Pt(9))); Gt(10)=Et(10)/(2*(1+Pt(10))); 

% Tabla5 Lagache
nombre11='Interfase Tabla5 Lagache';  
Ea(11)= 3.45;                             
Et(11)= 3.45;                       
Ga(11)= 1.3279 ;                      
Pa(11)= 0.299;                                         
Pt(11)= 0.299;                  
Gt(11)=Et(11)/(2*(1+Pt(11))); 

nombre13=' (BMAS Matrix Pagano) Lagache Tabla5';  nombre12='(Nicalon fiber Pagano) Lagache Tabla5 ';
Ea(13)= 106;                                       Ea(12)= 200;              
Et(13)= 106;                                       Et(12)= 200;         
Ga(13)= 40.8006 ;                                  Ga(12)= 81.9672 ;           
Pa(13)= 0.299 ;                                    Pa(12)= 0.22;                            
Pt(13)= 0.299;                                     Pt(12)= 0.22;   
Gt(13)=Et(13)/(2*(1+Pt(13)));                      Gt(12)=Et(12)/(2*(1+Pt(12)));
%
nombre14='Coating 1 (N.J- Pagano and G.P. Tandon 1988)'; 
Ea(14)= 0.345;                             
Et(14)= 0.345; 
Ga(14)= 0.13279;  
Gt(14)=  0.13279; 
Pa(14)= Et(14)/(2*Gt(14))-1;                                          
Pt(14)=  Et(14)/(2*Gt(14))-1;  


nombre15='Coating 2 (N.J- Pagano and G.P. Tandon 1988)'; 
Ea(15)= 3.45;                             
Et(15)= 3.45;                          
Ga(15)= 1.3279;  
Gt(15)=  1.3279; 
Pa(15)= Et(15)/(2*Gt(15))-1;                                          
Pt(15)=  Et(15)/(2*Gt(15))-1;  


nombre16='Coating 3 (N.J- Pagano and G.P. Tandon 1988)'; % Abbossou and Pastor 1996
Ea(16)= 34.5;                             
Et(16)= 34.5;                          
Pa(16)= 0.31;                                          
Pt(16)=  0.31;  
Ga(16)= Ea(16)/(2*(1+Pa(16)));  
Gt(16)= Et(16)/(2*(1+Pt(16))); 


nombre17='Empty ';           
Ea(17)= 0;                                 
Et(17)= 0;                                  
Pa(17)= 0 ;                                                  
Pt(17)= 0; 
Ga(17)= 0; 
Gt(17)=0; %Et(18)/(2*(1+Pt(18)))

nombre18='Glas fiber (Lusti eta l. 2002)';           
Ea(18)= 72.5;                                 
Et(18)= 72.5;                                 
Pa(18)= 0.2 ;                                                  
Pt(18)= 0.2; 
Ga(18)= 30.2083; 
Gt(18)=30.2083; %Et(18)/(2*(1+Pt(18)))

nombre19='Polypropylene (Lusti eta l. 2002)';           
Ea(19)= 1.57;                                 
Et(19)= 1.57;                                 
Pa(19)= 0.335 ;                                                  
Pt(19)= 0.335; 
Ga(19)= 0.5880; 
Gt(19)=0.5880; % Et(19)/(2*(1+Pt(19)));


nombre20='Carbon fibers Aboudi(144)';           
Ea(20)= 231;                                 
Et(20)= 22.4;                                 
Pa(20)= 0.30 ;                                                  
Pt(20)= 0.35; 
Ga(20)= 22.1; 
Gt(20)=8.2963; %Et(20)/(2*(1+Pt(20)));


nombre21='Epoxy Aboudi';           
Ea(21)= 4.27;                                 
Et(21)= 4.27;                                 
Pa(21)= 0.34 ;                                                  
Pt(21)= 0.34; 
Ga(21)= 1.5933; 
Gt(21)=1.5933; 


nombre22='SCS-6 Aboudi';           
Ea(22)= 413.7;                                 
Et(22)= 413.7;                                 
Pa(22)= 0.24 ;                                                  
Pt(22)= 0.24; 
Ga(22)= 166.8145; 
Gt(22)=166.8145; 



nombre23='Glass Aboudi';           
Ea(23)= 72.38;                                 
Et(23)= 72.38;                                 
Pa(23)= 0.2;                                                  
Pt(23)= 0.2; 
Ga(23)= 30.1583;
Gt(23)=30.1583; 


% Hashin 1990      
nombre24='Epoxy Aboudi';           
Ea(24)= 2.75;                                 
Et(24)= 2.75;                                 
Pa(24)= 0.35 ;                                                  
Pt(24)= 0.35; 
Ga(24)= 1.0185; 
Gt(24)=1.0185; 


% Hashin 1990      
nombre25='Hashin 1990 T300';           
Ea(25)= 231;                                 
Et(25)= 22.4;                                 
Ga(25)= 22; 
Gt(25)=8.3; 
Pa(25)= 0.30 ;                                                  
Pt(25)= 0.35;                                   

% Tsai y Hann 1980
%epoxy  y en Dasgupta (1992)        
nombre26='Epoxy en Dasgupta (1992)';           
Ea(26)= 3.45;                                 
Et(26)= 3.45;                                 
Ga(26)= 1.278;                           
Pa(26)= 0.35 ;                                                  
Pt(26)= 0.35;                                   
Gt(26)=Et(26)/(2*(1+Pt(26)));  


% Hashin 1990      
nombre27='Epoxy Hashin 1990 ';           
Ea(27)= 3.45;                                 
Et(27)= 3.45;                                 
Ga(27)= 1.278;                           
Pa(27)= 0.35 ;                                                  
Pt(27)= 0.35;                                   
Gt(27)=Et(26)/(2*(1+Pt(26)));  


%Hashin Grafite y en Dasgupta (1992)
nombre28='Graphite fiber( Hashin  y en Dasgupta (1992))';     
Ea(28)= 345;                                    
Et(28)= 9.66;                                  
Ga(28)= 2.07;                              
Pa(28)= 0.2 ;                                                  
Pt(28)= 0.3;                                     
Gt(28)= Et(28)/(2*(1+Pt(28)));

nombre29='Graphite fiber ((N.J- Pagano and G.P. Tandon 1988))';     
Ea(29)= 345;                                    
Et(29)= 9.66;                                  
Ga(29)= 2.07;                              
Pa(29)= 0.20 ;                                                  
Pt(29)= 0.29;                                     
Gt(29)= Et(29)/(2*(1+Pt(29)));



nombre30='Glas fiber Hine 2002';           
Ea(30)= 72.5;                                 
Et(30)= 72.5;                                 
Pa(30)= 0.2 ;                                                  
Pt(30)= 0.2; 
Ga(30)= Et(30)/(2*(1+Pt(30))); 
Gt(30)=30.2083; 

nombre31='Matrix Hine 2002';           
Ea(31)= 2.28;                                 
Et(31)= 2.28;                                 
Pa(31)= 0.335 ;                                                  
Pt(31)= 0.335; 
Ga(31)= Et(31)/(2*(1+Pt(31))); 
Gt(31)=0.8539; 


%%%%%%%%%%%%%%%%%%%%%%%%%%


nombre32='Carbon (Thomas Reiter 98)'; 
Ea(32)= 28.0;                                    
Et(32)= 28.0;                                  
Pa(32)= 0.3+eps;                              
Pt(32)= 0.3+eps ;                                                  
Ga(32)= Et(32)/(2*(1+Pt(32)));                                      
Gt(32)= 110.7692;

nombre33='Al2618 (Duschlbauer 2003)'; 
Ea(33)= 70;                                    
Et(33)= 70;                                  
Pa(33)= 0.3;                              
Pt(33)= 0.3 ;                                                  
Ga(33)= Et(33)/(2*(1+Pt(33)));                                      
Gt(33)= 26.9231;


nombre34='SiC (Duschlbauer 2003)'; 
Ea(34)= 450;                                    
Et(34)= 450;                                  
Pa(34)= 0.17;                              
Pt(34)= 0.17 ;                                                  
Ga(34)= Et(34)/(2*(1+Pt(34)));                                      
Gt(34)= 192.3077;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nombre35='Carbon fiber Ortotropicas (Chen, Dvorak and Benveniste 1990)'; 
Ea(35)= 772.85;                                    
Et(35)= 13.8;                                  
Pa(35)= 0.25;                              
Pt(35)= 0.25 ;                                                  
Ga(35)= 68.9;                                     
Gt(35)= 20.7 ;


% Tabla 1 Isotrópicos: Dasgupta and Bhandarkar 1992 MOM *********************
% SCi Fiber
nombre36='SCi fiber (Dasgupta 92)'; 
Ea(36)= 431.0;                                    
Et(36)= 431.0;                                  
Pa(36)= 0.2529;                              
Pt(36)= 0.2529 ;                                                  
Ga(36)= 172.0;                                     
Gt(36)= 172.0 ;



%Mesophase Dasgupta and Bhandarkar 1992 MOM ********
%carbon coating
nombre37='carbon coating (Dasgupta 92)'; 
Ea(37)= 34.48;                                
Et(37)= 34.48;                          
Ga(37)= 14.34;   
Gt(37)=14.34;   
Pa(37)= 0.2022;                                         
Pt(37)= 0.2022;                  

%  Titanium aluminate matrix Dasgupta and Bhandarkar 1992 MOM ********
nombre38='Titanium aluminide matrix (Dasgupta 92)'; 
Ea(38)= 96.5;                             
Et(38)= 96.5;                       
Ga(38)= 37.1 ;
Gt(38)=37.1 ;  
Pa(38)= 0.3005;                                         
Pt(38)= 0.3005;                  

%&&&&&&&&&&&&&&&&&&&&&&&&
nombre39='Al-B-Si fiber (Parton 93)';           
Ea(39)= 73.0;                                 
Et(39)= 73.0;                                 
Pa(39)= 0.23 ;                                                  
Pt(39)= 0.23; 
Ga(39)= 29.68; 
Gt(39)=29.68; 

nombre40='Rubber matrix (Parton 93)'; 
Ea(40)= 2.94e-3;                             
Et(40)= 2.94e-3;                       
Ga(40)= 9.8e-4;  
Gt(40)= 9.8e-4;  
Pa(40)= 0.4998;  % Ea(37)/(2*Ga(37))-1;                                         
Pt(40)= 0.4998;  %Et(44)/(2*Gt(44))-1;                         

nombre41='Epoxy matrix (Parton 93)'; 
Ea(41)= 3.43;                             
Et(41)= 3.43;                       
Ga(41)= 1.27;  
Gt(41)= 1.27;  
Pa(41)= 0.35;  % Ea(37)/(2*Ga(37))-1;                                         
Pt(41)= 0.35;  %Et(44)/(2*Gt(44))-1;                         

nombre42='Epoxy with fine rubber dispersion matrix (Parton 93)'; 
Ea(42)= 2.22;                             
Et(42)= 2.22;                       
Ga(42)= 0.7974;  
Gt(42)= 0.7974;  
Pa(42)= 0.393;  % Ea(37)/(2*Ga(37))-1;                                         
Pt(42)= 0.393;  %Et(44)/(2*Gt(44))-1;                         


nombre43='Fiber Ruber en Epoxy matrix (Por AHM, lam=0.2) (Parton 93)'; 
Ea(43)= 2.7569;                             
Et(43)= 2.4225;                       
Ga(43)= 0.8470;  
Gt(43)= 0.6578;  
Pa(43)= 0.3764;  % Ea(37)/(2*Ga(37))-1;                                         
Pt(43)= 0.4282;  %Et(44)/(2*Gt(44))-1;                         

%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
     
nombre44='Nicalon Fiber (Benveniste et al. 1989)'; 
Ea(44)= 172.38;                             
Et(44)= 172.38;                       
Ga(44)= 71.78;  % hace el papel del dielectrico
Gt(44)= 71.78;  
Pa(44)=0.2008;  % Ea(37)/(2*Ga(37))-1;                                         
Pt(44)= 0.2008;  %Et(44)/(2*Gt(44))-1;                         


nombre45='LAS  Matrix (Benveniste et al. 1989)'; 
Ea(45)= 103.43;                             
Et(45)= 103.43;                       
Ga(45)= 43.09;  
Gt(45)=  43.09;   
Pa(45)=0.2002;  % Ea(45)/(2*Ga(45))-1;                                         
Pt(45)= 0.2002;  %Et(45)/(2*Gt(45))-1;  

nombre46='Carbon  fiber (Benveniste et al. 1989)'; 
Ea(46)= 689.5;                             
Et(46)= 7.58;                       
Ga(46)= 15.17;  
Gt(46)=  3.99;   
Pa(46)=0.3;  % este lo invente                                        
Pt(46)= 0.2;  % este lo invente 


nombre47='Ytria caoting (Benveniste et al. 1989)'; 
Ea(47)= 172.38;                             
Et(47)= 172.38;                      
Ga(47)= 71.83;  
Gt(47)= 71.83;    
Pa(47)=0.2;                                          
Pt(47)= 0.2;  %Et(47)/(2*Gt(47))-1; 

nombre48='SiC Matrix (Benveniste et al. 1989)'; 
Ea(48)= 482.65;                             
Et(48)= 482.65;                       
Ga(48)= 201.10;  
Gt(48)=  201.10;    
Pa(48)=0.2;                                          
Pt(48)= 0.2;  %Et(48)/(2*Gt(48))-1; 

nombre49='Tungsten fiber (Benveniste et al. 1989)'; 
Ea(49)= 345.0;                             
Et(49)= 345.0;                          
Ga(49)= 135.0;  
Gt(49)=  135.0;      
Pa(49)=0.2778;                                          
Pt(49)= 0.2778;    %Et(49)/(2*Gt(49))-1; 

nombre50='Nickel matrix (Benveniste et al. 1989)'; 
Ea(50)= 214.0;                             
Et(50)= 214.0;                          
Ga(50)= 81.6;  
Gt(50)=  81.6;      
Pa(50)= 0.3113;                                          
Pt(50)=  0.3113; 

nombre51='Nicalon fiber (N.J- Pagano and G.P. Tandon 1988)'; 
Ea(51)= 200.0;                             
Et(51)= 200.0;                          
Ga(51)= 77.;  
Gt(51)=  77.;      
Pa(51)= Et(51)/(2*Gt(51))-1;                                          
Pt(51)=  Pa(51); 


nombre52='BMAS matrix (N.J- Pagano and G.P. Tandon 1988)'; 
% barium magnesium aluminosilicate
Ea(52)= 106.0;                             
Et(52)= 106.0;                          
Ga(52)= 43.;  
Gt(52)=  43.;      
Pa(52)= Et(52)/(2*Gt(52))-1;                                          
Pt(52)=  Pa(52); 


nombre53='Nickel coating (N.J- Pagano and G.P. Tandon 1988)'; 
% barium magnesium aluminosilicate
Ea(53)= 207.0;                             
Et(53)= 207.0;                          
Ga(53)= 79.;  
Gt(53)=  79.;      
Pa(53)= Et(53)/(2*Gt(53))-1;                                          
Pt(53)=  Pa(53); 


nombre54='ATJS Carbon coating (N.J- Pagano and G.P. Tandon 1988)'; 
% barium magnesium aluminosilicate
Ea(54)= 9.1;                             
Et(54)= 9.1;                          
Ga(54)= 4.1;  
Gt(54)=  4.1;      
Pa(54)= Et(54)/(2*Gt(54))-1;                                          
Pt(54)=  Pa(54); 

nombre55='Polyimide coating (N.J- Pagano and G.P. Tandon 1988)'; 
% barium magnesium aluminosilicate
Ea(55)= 3.1;                             
Et(55)= 3.1;                          
Ga(55)= 1.17;  
Gt(55)=  1.17;      
Pa(55)= Et(55)/(2*Gt(55))-1;                                          
Pt(55)= Pa(55); 

nombre56='Epoxy Matrix (N.J- Pagano and G.P. Tandon 1990)'; 
Ea(56)= 3.456;                             
Et(56)= 3.456;                          
Ga(56)= 1.28;  
Gt(56)=  1.28;      
Pa(56)= Et(56)/(2*Gt(56))-1;                                          
Pt(56)= Pa(56); 


nombre57='SiC  (Thomas Reiter 98)'; 
Ea(57)= 320.0;                                    
Et(57)= 320.0;                                  
Pa(57)= 0.3;                              
Pt(57)= 0.3 ;                                                  
Ga(57)= Et(57)/(2*(1+Pt(57)));                                      
Gt(57)= 123.0769 ;


nombre58='Matrix Theocaris 84';   nombre59='Fiber Theocaris 84';
Ea(58)= 3.5;                   Ea(59)= 72;
Et(58)= 3.5;                   Et(59)= 72;
Pa(58)= 0.35 ;                 Pa(59)= 0.2 ;
Pt(58)= 0.35;                  Pt(59)= 0.2;
Gt(58)=Et(58)/(2*(1+Pt(58)));  Gt(59)=Et(59)/(2*(1+Pt(59)));
Ga(58)= Gt(58) ;               Ga(59)= Gt(59) ;

nombre60='Epoxy (Petterman IJSS 2000)'; 
Ea(60)= 4.8774;                                    
Et(60)= 4.8774;                                  
Pa(60)= 0.35484;                              
Pt(60)= 0.35484 ;                                                  
Ga(60)= 1.8;                                      
Gt(60)= 1.8 ;


nombre61='PZT-7A (Petterman IJSS 2000)'; 
Ea(61)= 73.918;                                    
Et(61)= 93.315;                                  
Pa(61)= 0.34742;                              
Pt(61)= 0.30329 ;                                                  
Ga(61)= 25.796;                                      
Gt(61)= 35.8 ;



%***********************************************************
% Aqui empieza la funcion:
name=eval(strcat('nombre',num2str(i)));
%Final Result
Z=zeros(1,6);
Z(1) = Ea(i);
Z(2) = Et(i);
Z(3) = Ga(i);
Z(4) = Gt(i);
Z(5) = Pa(i);
Z(6) = Pt(i);

for i=1:6
  if Z(i)==0
       Z(i)=eps;
   end
end

%Gt=Et/(2*(1+Pt));
%Pt=Et/(2*Gt)-1;