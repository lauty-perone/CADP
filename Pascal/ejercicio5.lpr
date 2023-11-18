program ejercicio5;

uses ejeprcicio1;

const
  dimF=7;
type
  vector=array[1..dimF]of integer;
  cadena=string[20];
  datos=record
    nombre:cadena;
    duracion:integer;
    costoC:real;
    costoM:real;
    rango:integer;
  end;
  lista=^nodo;
  nodo=record
    d:datos;
    sig:lista;
  end;
procedure inicializar(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do begin
    v[i]:=0;
  end;
end;

procedure leerDatos(var data:datos; var v:vector);
begin
  write('Escriba el nombre de la sonda: ');
  readln(data.nombre);
    with data do begin
      readln(duracion);
      readln(costoC);
      readln(costoM);
      readln(rango);
    end;

 v[data.rango]:=v[data.rango]+1;
end;

procedure cargarLista(var l:lista;data:datos);
var
  nue:lista;
begin
  new(nue);
  nue^.d:=data;
  nue^.sig:=l;
  l:=nue;
end;

procedure sondaCostosa(aux:lista;var nombreS:cadena;var max,prom,suma:real);
begin
 if(suma>max) then begin
    max:=suma;
    nombreS:=aux^.d.nombre;
  end;
end;

procedure cantSondasB(v:vector);
var
  pos:integer;
begin
  for pos:=1 to dimF do begin
    write('La cantidad de sondas que realizaran estudios en cada rango es: ',v[pos]);
  end;
end;

procedure cantSondasC(aux:lista;var cantS:integer;suma1,cant,prom:real);
begin

  if(aux^.d.duracion>prom) then
   cantS:=cantS+1;
end;
procedure nombreSondas (aux:lista;promC:real);

begin
  if (aux^.d. costoC >promC) then
   write ('La sonda: ',aux^.d.nombre,'supera el costo de construccion');
end;

procedure imprimir(nombreS:cadena; cantS:integer);
begin
  writeln('El nombre de la sonda mas costosa es: ',nombreS);
  writeln('La cantidad de sondas que supera el promedio duracion de todas las demas es: ',cantS);
end;

var
  l,aux:lista;
  data:datos;
  nombreS:cadena;
  cantS,cant,suma1:integer;
  costoConst,prom,promC,suma,max:real;
  v:vector;
begin

  max:=-1;
  cantS:=0; cant:=0;
  l:=nil;
  inicializar (v);
  repeat
    leerDatos(data,v);
    costoConst:=costoConst+data.costoC;
    suma1:=suma1+data.duracion;
    cant:=cant+1;
    cargarLista(l,data);
  until(data.nombre='GAIA');
  prom:=suma1/cant;
  promC:=costoConst/cant;
  aux:=l;
  suma:=aux^.d.costoC+ aux^.d.costoM;
  while (aux^.sig<>nil)do begin
    sondaCostosa(aux,nombreS,max,prom,suma);
    cantSondasB(v);
    cantSondasC(aux,cantS,suma1,cant,prom);
    nombreSondas(aux,promC);
    aux:=aux^.sig;
  end;
  imprimir(nombreS,cantS);
end.




