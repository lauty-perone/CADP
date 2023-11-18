{La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la
información de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN
del libro prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). La
información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se
ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces
que fue prestado. Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y
nro. de socio par.}

program biblioteca;

type

 prestamo=record
   nro:integer;
   isbn:integer;
   nroSocio:integer;
   dia:1..31;
 end;

 lista=^nodo;
 nodo=record
   datos:prestamo;
   sig:lista;
 end;

 dato=record
   cantPrestamos:integer;
   nroIsbn:integer;
 end;

 estructura=^enlace;
 enlace=record
   info:dato;
   post:estructura;
 end;

procedure leerPrestamo(var p:prestamo);
begin
  with p do begin
    read(nro);read(isbn);
    read(dia);
  end;
end;

procedure agergarAtras(var l,ult:lista; p:prestamo);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=nil;
  if(l<>nil)then
     l:=nue;
 else
   ult^.sig:=nue;
 ult:=nue;
end;

procedure cargarLista(var l:lista);
var
  p:prestamo;ult:lista;
begin
  leerPrestamo(p);
  while(e.isbn<>-1)do begin
    agregarAtras(l,pri,p);
    leerPrestamo(p);
  end;
end;

procedure generarNuevaEst(var e:estructura; cant,numisbn:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.info.cantPrestamos:=cant;
  nue^.info.nroIsbn:=isbn;
  nue^.post:=e;
  e:=nue;
end;

procedure minimo(cant,dia:integer;var min,diaM:integer);
begin
  if(cant<min)then begin
    min:=cant;
    diaM:=dia;
  end;

procedure calcularNumeros(l:lista; var cont:integer);
var
  dig1,dig2:integer;
begin
  dig1:= l^.datos.nro mod 10;
  dig2:=l^.datos.nroSocio mod 10;

  if(dig1 mod 2<>0)and (dig2 mod 2=0)then
     cont:=cont+1;
end;



 procedure procesarLista(l:lista;var e:estructura);
 var
  diaAct,isbnact,cant,min,diaM,total,cont:integer;
  porc:real;
begin
  total:=0;
  cont:=0;
  min:=9999;
  while(l<>nil)do begin
     cant:=0;
     isbnact:=l^.datos.isbn;
     while(l^.datos.isbn= isbnact)do begin
        cant:=cant+1;
        total:=total+1;
        diaAct:=l^.datos.dia;
        calcularNumeros(l,cont);
        l:=l^.sig;
    end;
   generarNuevaEst(e,cant,isbnAct);
   minimo(cant,diaAct,min,diaM);
  end;
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
end;
