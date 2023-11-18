{El Centro de Estudios Sobre Nutrición Infantil requiere un programa que procese la
información de las escuelas de La Plata. De cada escuela se conoce su nombre,
dirección, código único de escuela, cantidad de alumnos y el peso de cada uno de
los alumnos de la escuela (a lo sumo 2000).
a) Realice un módulo que lea y retorne, en una estructura adecuada, la
información de los alumnos. La lectura finaliza al ingresar la escuela con
código 1000, que debe procesarse.
b) Realice un módulo que reciba la estructura generada en el inciso anterior e
informe el nombre y dirección de todas las escuelas en las que al menos la
mitad de sus alumnos pesa más de 40,5 kg.}


program escuela;
const
 total=2000;
type
 cadena=string[20];
 tabla=array[1..total]of real;
 escuela=record
   nombre:cadena;
   dir:cadena;
   cod:integer;
   cantA:integer;
   peso:tabla;
 end;
lista=^nodo;
nodo=record
  datos:escuela;
  sig:lista;
end;
procedure leerEscuela(var e:escuela);
begin
  with e do begin
    read(nombre); read(dir);read(cod);
    read(cantA);
    for i:=1 to cantA do begin
      read(e.peso[i]);
    end;
  end;
end;
procedure agregarLista(var l:lista; e:escuela);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=e;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargarLista(var l:lista);
var
  e:escuela;
begin
  repeat
  leerEscuela(e);
  agregarLista(l,e);
  until(e.cod=1000)
end;
procedure procesarLista(l:lista);
var
 pos,cant:integer;
begin
  while(l<>nil)do begin
    cant:=0;
     for pos:= 1 to l^.datos.cantA do begin
       cant:= cant+1;
     end;
     if (cant=>l^.datos.cantA div 2) then
       write(l^.datos.nombre, l^.datos.dir) ;
     l:=l^.sig;
  end;
end;

var
  l:lista;
begin
  l:=nil;
  cargarLista(l);
  procesarLista(l);
end;
