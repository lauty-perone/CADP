
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
program parcial;
type
  areas=1..35;
  cadena= string[30];
  datos=record
    titulo:cadena;
    editorial:cadena;
    cantP:integer;
    anoEdicion:integer;
    cantVen:integer;
    codArea:areas;
  end;
  tabla= array [areas]of cadena;
  estructura=record
    tituloE:cadena;
    area:cadena;
    cantPag:integer;
  end;

  lista=^nodo;
  nodo=record
    libro:estructura;
    sig:lista;
  end;

  info=record
    nomEditorial:cadena;
    libroAntiguo:integer;
    cantEdit:integer;
    cantTotal:integer;
    detalle:lista;
  end;

procedure leerLibros(var d:datos);
begin
 with d do begin
   read(titulo); read(editorial);
   read(cantP); read(anoEdicion);
   read(cantVen); read (codArea);
 end;
end;
procedure inicializarInfo(var n:info);
begin
 nomEditorial:='Planeta Libros';
 libroAntiguo:=9999;
 cantEdit:=0;
 cantTotal:=0;
 detalle:=nil;
end;
procedure cargarLista(d:datos;var n:info; t:tabla);
var
  nue:lista;
begin
 new(nue);
 nue.libro.tituloE:= d.titulo;
 nue.libro.area:=t[d.codArea];
 nue.libro.cantPag:=d.cantP;
 nue:=n.detalle;
 n.detalle:=nue;
end;

procedure agregar(d:datos; var n:info; t:tabla);
begin
 if (d.anoEdicion<n.libroAntiguo) then
       n.libroAntiguo:= d:anoEdicion;
 n.cantEdit:=n.cantEdit +d.cantVen;
 n.cantTotal:=n.cantTotal +1;
 if (d.cantVen>250)then
  cargarLista(d,n,t);
end;

procedure generarLista(var n:info; t:tabla);
var
  d:datos;
begin
 inicializarInfo(n);
 repeat
   leerLibro(d);
   if (d.editorial= 'Planeta Libros') then begin
     agregar(d,n,t);
   end;
 until(d.titulo='Relato de un náufrago') ;
end;
procedure informar(n:info);
begin
 write (n.nomEditorial);
 while (n.detalle<>nil)do begin
   write(n.detalle^.libro.tituloE);

 end;
end;

var
  n:info;
  t:tabla;
begin
  cargarTabla(t); {se dispone}
  generarLista(n,t);
  informar(n);
end.

