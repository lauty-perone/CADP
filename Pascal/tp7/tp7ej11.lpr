{Realizar un programa para una empresa productora que necesita organizar 100 eventos
culturales. De cada evento se dispone la siguiente información: nombre del evento, tipo de evento
(1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad
máxima de personas permitidas para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada
venta se debe guardar: código de venta, número de evento (1..100), DNI del comprador y
cantidad de entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos
pares que impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad
máxima de personas permitidas}
program tp7ej11;
type
  evento=1..100;
  cadena=string[30];
  rango=1..5;
  info=record
    nombre:cadena;
    tipo:rango;
    lugar:cadena;
    cantMax:integer;
    costo:real;
  end;
  tabla=array[evento]of info;
  datos=record
   cod:integer;
   num=evento;
   DNI:integer;
   cantAdq:integer;
  end;
  lista=^nodo;
  nodo=record
   venta=datos;
   sig:lista;
  end;
  vector=array[evento]of real;
procedure leerVenta(var d:datos);
begin
  with d do begin
     read(cod); read(tipo); read(lugar);
     read(cantMax); read(costo);
  end;
end;
procedure cargarLista(var l:lista);
 var
   d:datos;
 begin
   l:nil;
   leerVenta(d);
   while(d.cod<>-1)do begin
     agregarAdelante(l,d);
     leerVenta(d);
   end;
 end;
procedure inicializar(var v:vector;var nom1,lug1,nom2,lug2:cadena; var cantPar,max:integer; var cumple:boolean; var min1,min2:real);
var i:integer;
 begin
   for i:=1 to 100 do begin
     v[i]:=0;
   end;
  nom1:='';
  lug1:='';
  nom2:='';
  lug2:='';
  cantPar:=0;
  cumple:=false;
  min1:=99999;
  min2:=99999;
end;
procedure sumarVector(l:lista; var v:vector; t:tabla);
begin
  v[l^.evento.num]:= v[l^.evento.num]+(l^.evento.cantAdq * t[l^.evento.num].costo);
end;
procedure dosMin(v:vector;t:tabla;var nom1,lug1,nom2,lug2:cadena;var min1,min2:real);
var
  pos:integer;
begin
  for pos:=1 to 100 do begin
    if (min1< v[pos]) then begin
      min2:=min1;
      nom2:=nom1;
      lug2:=lug1;
      min1:= v[pos];
      nom1:=t[pos].nombre;
      lug1:=t[pos].lugar;
    end
  else
   if (min2< v[pos]) then begin
     min2:=v[pos];
     nom2:= t[pos].nombre;
     lug2:=t[pos].lugar;
   end;
 end;
end;
function si (DNI:integer):boolean;
var
  dig,par,imp:integer;
begin
  par:=0;
  imp:=0;
  dig:=DNI mod 10;
  while (dig<> 0) do begin
   DNI:=DNI div 10;
   if (dig mod 2=0)then
    par:=par+1;
   else
    imp:=imp+1;
   dig:=DNI mod 10;
  end;
 si:=par>imp;
end;
procedure cantPares(l:lista; var cantPar:integer);
var
  si:boolean;
begin
  if (si(l^.venta.DNI)) then
   cantPar:=cantPar+1;
end;
procedure condicion(t:tabla; var cumple:boolean; max:integer);
begin
 if (max= t[50].cantMax) then
   cumple:=true;
end;
procedure procesarLista(l:lista;t:tabla;var nom1,lug1,nom2,lug2:cadena;var cantPar:integer; var cumple:boolean);
var
  max:integer;
  v:vector;
 min1,min2:real;
begin
  inicializar(v,nom1,lug1,nom2,lug2,cantPar,max,cumple,min1,min2);
  while (l<>nil)do begin
    sumarVector(l,v,t);
    if (t[l^.evento.num].tipo= 3) then
       cantPares(l,cantPar);
    if (l^.evento.num=50) then
       max:=max+l^.evento.cantAdq;
    l:=l^.sig;
  end;
  dosMin(v,t,nom1,lug1,nom2,lug2,min1,min2);
  condicion(t,cumple,max);
end;
procedure informar(nom1,lug1,nom2,lug2:cadena;cantPar:integer;cumple:boolean);
begin
 write(nom1,lug1);
 write(nom2,lug2);
 write(cantPar);
 if (cumple=true)then
    write ('El evento numero 50 alcanzo la cant maxima de personas');
 else
  write('El evento numero 50 no alcanzo la cant maxima de personas');
end;
var
  l:lista;
  t:tabla;
  nom1,lug1,nom2,lug2:cadena;
  cantPar:integer;
  cumple:boolean;
begin
  cargarTabla(t); {se dispone}
  cargarLista(l);
  procesarLista(l,t,nom1,lug1,nom2,lug2,cantPar,cumple);
  informar(nom1,lug1,nom2,lug2,cantPar,cumple);
end.

