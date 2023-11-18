{{El centro de deportes Fortaco´s quiere procesar la informacion de los 4 tipos de subscripciones que ofrece
1)Musculacion 2)spinning, 3)crossfit,4)todas las clases. Para elo el centro dispone de una tabla con informcacion con el
nombre, costo mensual, cupo y precio de cada tipo de subscripcion. Realizar un programa que lea y almacene la informacion de todos los
clientes del centro.De cada cliente se conoce nombre, dni, edad y codigo del tipo de subcripcion contratada (entre 1 y 4 --> solo una subscripcion por cliente
La lectra finaliza cuando se lee el cliente con el nombre 'ZZZ' el cual no debe procesarse. o cuando se completa el cupo de la actividad spinning.
Una vez almacenados todos los datos calcular:
-La cantidad de clientes suscritos a cada actividad ofrecida por el centro
-El nombre y edad de los clientes suscritos a todas las clases.} }
program fortaco;
type
  cadena=string[20];
  info=record
    nombre:cadena;
    costo:real;
    cupo:integer;
    precio:integer;
  end;
  tabla=array[1..4]of info;
  cliente=record
    nom:cadena;
    dni:integer;
    edad:integer;
    codigo:1..4;
  end;
  lista=^nodo;
  nodo=record
    datos:cliente;
    sig:lista;
  end;
  vector=array[1..4]of integer;
procedure leerCliente(var c:cliente);
begin
  with c do begin
    read(nom); read(dni);
    read(edad); read(codigo);
  end;
end;
procedure inicializarVector(var v:vector);
var
  i:integer;
begin
  for i:=1 to 4 do begin
    v[i]:=v[i]+1;
  end;
end;
procedure agregarAdelante(var l:lista; c:cliente);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=c;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargarLista(var l:list; t:tabla);
var
  c:cliente;
  tot:integer;
begin
  tot:=0;
  inicializarVector(v);
  leerCliente(c);
  while(c.nom='ZZZ')or (tot<t[2].cupo)do begin
    agregarAdelante(l,c);
    v[c.codigo]:=v[c.codigo]+1;
    if(c.cod=2)then
      tot:=tot+1;
    leerCliente(c);
  end;
end;


procedure procesarLista(l:lista);
pos:integer;
begin
  for pos:=1 to 4 do begin
    write('Cant personas por clase: ',v[pos])
  end;
 while (l<>nil)do begin
    write(l^.datos.nom);
    write(l^.datos.edad);
    l:=l^.sig;
  end;
end;

var
  t:tabla;
  l:lista;
  v:vector;
begin
  l:=nil;
  cargarTabla(t); {se dispone}
  cargarLista(l,t);
  procesarLista(l,t);
end.

