program tp7ej5;
type
 camion=1..100;
 datos=record
    patente:integer;
    fabri:integer;
    capacidad:real;
  end;
 tabla=array [camion]of datos;
 cadena=string[30];
  v=record
   codViaje:integer;
   codCamion:camion;
   distKms:real;
   ciudadDestino:cadena;
   ano:integer;
   DNI:integer;
  end;
  lista=^nodo;
  nodo=record
   viaje:v;
   sig:lista;
  end;
procedure leerViaje(var datos:v);
begin
  with datos do begin
    readln(codViaje);readln(codCamion);
    readln(distKms);readln(ciudadDestino);
    readln(ano);readln(DNI);
  end;
end;
procedure agregarAdelante(var l:lista; datos:v);
var
  nue:lista;
begin
  new(nue);
  nue^.viaje:=datos;
  nue^.sig:=l;
  l:=nue;
end;
procedure cargarLista(var l:lista);
var
  datos:v;
begin
  leerViaje(datos);
  while(datos.codViaje<>-1) do begin
    agregarAdelante(l,datos);
    leerViaje(datos);
  end;
end;
procedure maxMin(l:lista;vector:tabla var patMax,patMin:integer;var max,min:real);
begin
  if (l^.viaje.distKms>max) then begin
    max:=l^.viaje.distKms;
    patMax:=vector[l^.viaje.codCamion].patente;
  end;
  if (l^.viaje.distKms<min) then begin
    min:=l^.viaje.distKms;
    patMin:=vector[l^.viaje.codCamion].patente;
 end;
end;
function cumple(l:lista;vector:tabla):boolean;
var dif:integer;
begin
  dif:=l^.viaje.ano - vector[l^.viaje.codCamion].fabri;
  cumple:=(dif=>5);
end;
procedure cantViajes(l:lista; vector:tabla; var cantV:integer);
begin
 if (cumple(l,vector))and (vector[l^.viaje.codCamion].capacidad>30.5) then
  cantV:=cantV+1;
end;
function exito(DNI:integer);
var
  num,dig:integer;
begin
 num:=DNI div 10;
 dig:=num mod 10;
 while (num<>0)and (dig mod 2<>0); do begin
   num:= num div 10;
   dig:=num mod 10;
 end;
 exito:= (num=0);
end;

procedure procesarLista(l:lista;vector:tabla;var patMax,patMin,cantV:integer);
var
  max,min:real;
begin
  max:=-1;
  min:=99999;
  cantV:=0;
  while (l<>nil)do begin
    maxMin(l,vector,patMax,patMin,max,min);
    cantViajes(l,vector,cantV);
    if (exito(l^.viaje.DNI)) then
      writeln(l^.viaje.codViaje);
    l:=l^.sig;
  end;
end;
procedure informar(patMax,patMin,cantV:integer);
begin
 write(patMax); write(patMin); write(cantV);
end;
var
  l:lista;
  vector:tabla;
  patMax,patMin,cantV:integer;
begin
  cargarTabla(vector);{se dispone}
  cargarLista(l);
  procesarLista(l,vector,patMax,patMin,cantV);
  informar(patMax,patMin,cantV);
end.

