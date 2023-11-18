{La tienda de libros Amazon Books está analizando información de algunas editoriales. Para
ello, Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los
libros (Arte y Cultura, Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de
edición, cantidad de veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título
“Relato de un náufrago” (que debe procesarse) y devuelva en una estructura de
datos adecuada para la editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos
los libros con más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre
de la editorial y el título de cada libro con más de 250 ventas.}
program amazon;
type
  cadena=string[20];
  area=35;
  tabla=array [1..area]of cadena;
  libro=record
    titulo:cadena;
    editorial:cadena;
    paginas:integer;
    año:integer;
    ventas:integer;
    cod:1..35;
  end;
  d:record;
    tit:cadena;
    nomArea:cadena;
    cantP:integer;
  end;
  lista=^nodo;
  nodo=record
    datos:d;
    sig:lista;
  end;
 estructura=record
    nombre:cadena;
    antiguo:integer;
    editados:integer;
    total:integer;
    detalle:lista;
  end;
 procedure leerLibro(var l:libro);
 begin
    with l do begin
       read(titulo);read(editorial);
       read(paginas);read(año);
       read(ventas);read(cod);
   end;
end;
procedure minimo(var antiguo:integer;año:integer);
begin
   if(año<antiguo) then
     antiguo:=año;
end;
procedure cargarLista(var detalle:lista; l:libro; t:tabla);
var
 nue:lista;
begin
   new(nue);
   nue^.datos.tit:=l.titulo;
   nue^.datos.nomArea:=t[l.cod];
   nue^.datos.cantP:=l.paginas;
   nue^.sig:=detalle;
   detalle:=nue;
end;

procedure cargarDatos(var e:estructura; t:tabla);
var
 l:libro;
 cant,ventasTotal:integer;
begin
 cant:=0;
 ventasTotal:=0;
 e.antiguo:=99999;
 repeat
   leerLibro(l);
   if(l.editorial='Planeta Libros') then begin
       minimo(e.antiguo,l.año);
       e.nombre:='Planeta Libros';
       cant:=cant+1;
       ventasTotal:=ventasTotal+ l.ventas;
     if (l.ventas>250)then
       cargarLista(e.detalle,l,t);
   end;
 until(l.titulo='Relato de un naufrago');
 e.editados:=cant;
end;
procedure informar(e:estructura);
var
  max:integer;
begin
  max:=-99;
  while(e.detalle<>nil)do begin
    writeln('El nombre de la editorial es: ',e.nombre);
    writeln('El titulo del libro con mas de 259 ventas es: ',e.detalle^.datos.tit);
  end;
end;


var
 t:tabla;
 e:estructura;


begin
  e.detalle:=nil;
  cargarTabla(t){se dispone}
  cargarDatos(e,t);
  informar(e);
end;

