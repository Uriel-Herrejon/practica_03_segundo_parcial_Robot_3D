close all
clear all
clc
%% Secci�n d�nde se pregunta por el �ngulo y unidades del primer eslab�n
angDeg = input('Ingresa los grados que deseas rotar la articulaci�n 1:\n');
L1= input('Ingresa la longitud para la articulaci�n 1:\n');
angRad = deg2rad(angDeg);
%% Secci�n d�nde se pregunta por el �ngulo y unidades del segundo eslab�n
angDeg2 = input('Ingresa los grados que deseas rotar la articulac�on 2:\n');
L2= input('Ingresa la longitud para la articulaci�n 2:\n');
angRad2 = deg2rad(angDeg2);
%% Secci�n d�nde se pregunta por el �ngulo y unidades del tercer eslab�n
angDeg3 = input('Ingresa los grados que deseas rotar la articulac�on 3:\n');
L3= input('Ingresa la longitud para la articulaci�n 3:\n');
angRad3 = deg2rad(angDeg);
%% Secci�n d�nde se pregunta por el �ngulo y unidades del cuarto eslab�n
angDeg4 = input('Ingresa los grados que deseas rotar la articulac�on 4:\n');
L4= input('Ingresa la longitud para la articulaci�n 4:\n');
angRad4 = deg2rad(angDeg4);
%% Se define el �ngulo principal y se convierte de vector rengl�n a vector columna
 p1=[0 0 0]';
%% Condici�n if para obtener los valores del �ngulo del primer eslab�n
 if angDeg>=0
     angVec = 0:0.01:angRad;
 else
      angVec = 0:-0.01:angRad;
 end
 %% Ciclo for para realizar la animaci�n de la articulaci�n 1 dejando las dem�s en estado inicial
 for i=1:length(angVec)
   clf
 PrintAxis();
     cos(angVec(i))
%% Se define la matriz de rotaci�n en Z de la articulac�on 1
TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1];
%% Se define la matriz de traslaci�n de la primera articulaci�n
TTz = [1 0 0 0;0 1 0 0; 0 0 1 L1; 0 0 0 1];
%% Se genera la matriz de de transformaci�n homogenea 
T1=TRz1*TTz;
%% Se rescata el valor 1, 2 y 3 de la columna 4
p2=T1(1:3,4);
%% Se definen los ejes x, y, z para formar el marco de referecia
v1x=T1(1:3,1);
v1y=T1(1:3,2);
v1z=T1(1:3,3);
%% Se realiza el trazado de un enfoque en 3D
view(150,15)
%% Se realiza la impresi�n del vector final del eslab�n 1 & tambien se imprimen los marcos de refencia al inicio y al final del eslab�n 1
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)%primer eslabon del brazo
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

%% Se define el eslab�n 2 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del segundo eslab�n 
% e imprime el vector final de la segunda articulaci�n
PrintAxis();
TRy1 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz1 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRy1*TTz1;
Ta=T1*T2;
p3=Ta(1:3,4);

v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',2.5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
%% Se define el eslab�n 3 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del tercer eslab�n 
% e imprime el vector final de la tercera articulaci�n
PrintAxis();
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);

line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0.3 0],'linewidth',2.5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

%% Se define el eslab�n 4 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del cuarto eslab�n 
% e imprime el vector final de la cuarta articulaci�n
PrintAxis();
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);

v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);

line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)

pause(0.01);



 end
 %% Condici�n if para obtener los valores del �ngulo del segundo eslab�n
  if angDeg2>=0
 angVec2=0:0.01:angRad2;
 else
     angVec2=0:-0.01:angRad2;
  end
%% Ciclo for para realizar la animaci�n de la articulaci�n 2 dejando las dem�s en estado inicial

 for i=1:length(angVec2)
   clf
 %% Se mantienen todas las impreiones del primer eslab�n para que no se borren    
 PrintAxis();
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)
%% Se realiza el trazado del marco en 3D con la funcion printAxis
 PrintAxis();
%% Se define la matriz de rotaci�n en Y de la articulac�on 2 
TRy1 = [cos(angVec2(i)) 0 -sin(angVec2(i)) 0;0 1 0 0;sin(angVec2(i)) 0 cos(angVec2(i)) 0;0 0 0 1];
%% Se define la matriz de traslaci�n de la segunda articulaci�n
TTz1 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
%% Se genera la matriz de de transformaci�n homogenea 
T2=TRy1*TTz1;
Ta=T1*T2;
%% Se rescata el valor 1, 2 y 3 de la columna 4
p3=Ta(1:3,4);
%% Se definen los ejes x, y, z para formar el marco de referecia
v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);
%% Se realiza el trazado de un enfoque en 3D
view(150,15)
%% Se realiza la impresi�n del vector final del eslab�n 2 & tambien se imprimen los marcos de refencia al inicio y al final del eslab�n 2
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',2.5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
%% Se define el eslab�n 3 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del tercer eslab�n 
% e imprime el vector final de la tercera articulaci�n
PrintAxis();
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 L3;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);

line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0.3 0],'linewidth',2.5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

%% Se define el eslab�n 4 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del cuarto eslab�n 
% e imprime el vector final de la cuarta articulaci�n
PrintAxis();
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);

line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)

line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.01);
 end
 %% Condici�n if para obtener los valores del �ngulo del tercer eslab�n
 if angDeg3>=0
 angVec3=0:0.01:angRad3;
 else
     angVec3=0:-0.01:angRad3;
  end
%% Ciclo for para realizar la animaci�n de la articulaci�n 3 dejando las dem�s en estado inicial  
   for i=1:length(angVec3)
   clf
 %% Se mantienen todas las impreiones del primer eslab�n para que no se borren 
 PrintAxis();
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)
 %% Se mantienen todas las impreiones del segundo eslab�n para que no se borren 
 p3=Ta(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',2.5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
 line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
%% Se realiza la rotaci�n y tralasi�n del eslabon 3
 PrintAxis();
% Se define la matriz de rotaci�n en Y de la articulac�on 3 
TRy2 = [cos(angVec3(i)) 0 -sin(angVec3(i)) 0;0 1 0 0;sin(angVec3(i)) 0 cos(angVec3(i)) 0;0 0 0 1];
% Se define la matriz de traslaci�n de la tercera articulaci�n
TTz2 = [1 0 0 L3;0 1 0 0; 0 0 1 0; 0 0 0 1];
% Se genera la matriz de de transformaci�n homogenea 
T3=TRy2*TTz2;
Tb=Ta*T3;
% Se rescata el valor 1, 2 y 3 de la columna 4
p4=Tb(1:3,4);
% Se definen los ejes x, y, z para formar el marco de referecia
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);
% Se realiza el trazado de un enfoque en 3D
view(150,15)
%% Se realiza la impresi�n del vector final del eslab�n 3 & tambien se imprimen los marcos de refencia al inicio y al final del eslab�n 3
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0.3 0],'linewidth',2.5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

%% Se define el eslab�n 4 en un estado inicial igual a cero, lo �nico que se hace es establecer los puntos de referencia del cuarto eslab�n 
% e imprime el vector final de la cuarta articulaci�n
PrintAxis();
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);

v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)

line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.01);
   end
 %% Condici�n if para obtener los valores del �ngulo del cuarto eslab�n   
   if angDeg4>=0
 angVec4=0:0.01:angRad4;
 else
     angVec4=0:-0.01:angRad4;
  end
%% Ciclo for para realizar la animaci�n de la articulaci�n 4 dejando las dem�s en estado inicial    
   for i=1:length(angVec4)
   clf
 PrintAxis();
%% Se mantienen todas las impreiones del primer eslab�n para que no se borren 
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)
%% Se mantienen todas las impreiones del segundo eslab�n para que no se borren 
 p3=Ta(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',2.5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
 line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
%% Se mantienen todas las impreiones del tercer eslab�n para que no se borren  
 p4=Tb(1:3,4);
 line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0.3 0],'linewidth',2.5)
 line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
 line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
 line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)
 
%% Se realiza la rotaci�n y tralasi�n del eslab�n 4 
 PrintAxis();
% Se define la matriz de rotaci�n en Y de la articulac�on 4 
TRy3 = [cos(angVec4(i)) 0 -sin(angVec4(i)) 0;0 1 0 0;sin(angVec4(i)) 0 cos(angVec4(i)) 0;0 0 0 1];
% Se define la matriz de traslaci�n de la cuarta articulaci�n
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
% Se genera la matriz de de transformaci�n homogenea 
T4=TRy3*TTz3;
Tc=Tb*T4;
% Se rescata el valor 1, 2 y 3 de la columna 4
p5=Tc(1:3,4);
% Se establece el marco de referencia inicial del eslab�n 4
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);
% Se establece el marco de referencia final del eslabon 4 y final del
% brazo rob�tico
v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);
% Se realiza el trazado de un enfoque en 3D
view(150,15)
% Se realiza la impresi�n del vector final del eslab�n 4 
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.6350 0.0780 0.1840],'linewidth',2.5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
% Se traza o imprimen los marcos de referencia del efector final
line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.01);
end
 
 
 
 
 
 
 
 