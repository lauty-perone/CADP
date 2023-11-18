{Una concesionaria de la ciudad de La Plata necesita un programa para administrar
información de ventas de autos efectuadas en febrero de 2020. Para ello, se debe leer la
información de las ventas realizadas. De cada venta se lee: código de venta, modelo de
auto, DNI del cliente al que se vendió el auto, día de la venta (1..28). La información de las
ventas se lee de manera ordenada por modelo de auto y finaliza cuando se ingresa el
modelo ‘ZZZ’ (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada modelo de auto, la cantidad de veces
que fue vendido. Esta estructura debe quedar ordenada por modelo de auto.
B) Calcular e informar el día del mes en que se realizaron más ventas a clientes con DNI
impar.
C) Calcular e informar el porcentaje de ventas con código par.}

program consecionaria;
type
 cadena=string[20];
  venta=record
    cod:integer;
    modelo:cadena;
    dni:integer;
    dia:1..28;
  end;

  lista=^nodo;
  nodo=record
    datos:venta;
    sig:lista;
  end;

 d:record
   cantVendido:integer;
   model:cadena;
 end;

estructura=^enlace;

enlace=record
  info:d;
  post:estructura;
end;

vector=array[1..28]of integer;

procedure incializarV(var v:vector);
var
  i:integer;
begin
  for i:=1 to 28 do begin
    v[i]:=0;
  end;
end;

procedure leerVenta(var v:venta);
begin
  with v do begin
    read(cod); read(modelo);
    read(dni); read(dia);
  end;
end;

procedure agregarAtras(var l,ult:lista; v:venta);
var
  act,nue:lista;
begin
  new(nue);
  nue^.datos:=v;
  nue^.sig:=nil;
  if(l<>nil)then
    l:=nue;
  else
    ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var l:lista);
var
  ult:lista;
  v:venta;
begin
  leerVenta(v);
  while(v.modelo<>'ZZZ')do begin
    agregarAtras(l,ult,e);
    leerVenta(v);
  end;
end;

procedure agregarEst(var e:estructura; cant:integer; modAct:cadena);
var
  aux:estructura;
begin
  new(aux);
  aux^.info.cantVendido:=cant;
  aux^.info.model:=modAct;
  aux^.sig:=e;
  e:=aux;
end;

function cumple(cod:integer):boolean
var
  dig:integer;
begin
  dig:=cod mod 10;
  cumple:= dig mod 2=0;
end;

procedure maximo(v:vector);
var
  pos,max,diaMax:integer;
begin
  max:=-1;
  diaMax:=0;
  for pos:=1 to 28 do begin
    if(v[pos]>max)then begin
      max:=v[pos];
      diaMax:=pos;
    end;
  end;
   write(diaMax);
  end;

procedure procesarLista(l:lista; var e:estructura);
var
  modAct:cadena;
  cant,total,codPar:integer;
  porc:real;
begin
  e:=nil;
  total:=0;
  codPar:=0;
  inicializarV(v);
  while(l<>nil)do begin
    modAct:=l^.datos.modelo;
    cant:=0;
    while(l^.datos.modelo=modAct)do begin
       cant:=cant+1;
       total:=total+1;
       if(not cumple(l^.datos.dni))then
               v[l^.datos.dia]:=v[l^.datos.dia]+1;
       if(cumple(l^.datos.cod))then
              codPar:=codPar+1;
       l:=l^.sig;
     end;
    agregarEst(e,cant,modAct);
  end;
   maximo(v);
   porc:=(cont*100)/total;
    write(porc);

end;
var
  l:lista;
  e:estructura;
begin
  l:=nil;
  cargarLista(l);
  procesarLista(l,e);
end.






















