  { 12. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de préstamos de libros efectuados
  en marzo de 2020. Para ello, se debe leer la información de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro
  prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera ordenada por ISBN y
  finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A.  Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado. Esta estructura debe quedar ordenada por
ISBN de libro.
B. Calcular e informar el día del mes en que se realizaron menos préstamos.
C. Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par.}


program ejercicio12;
type rango = 1..31;
     prestamo = record
                  num: integer;
                  ISBN: integer;
                  nroSocio: integer;
                  día: rango;
                end;
     elemento = record
                  ISBN: integer;
                  cant: integer;
                end;
     lista = ^nodo;
     nodo = record
              dato: elemento;
              sig: lista;
            end;
     vector = array [rango] of integer;
procedure PuntoA(var l:lista; var v:vector;var totalPrestamos,cantCumplen:integer);
  procedure leerPrestamo(var p:prestamo);
    begin
      read(p.ISBN);
      if(p.ISBN<>-1)then begin
        read(p.num); read(p.nroSocio);
        read(p.dia);
      end;
    end;

  procedure inicializarVector(var v:vector);
  var
      i:integer;
  begin
    for i:=1 to 31 do
      v[i]:=0;
  end;
 procedure agregarAtras(var l,ult:lista; e:elemento);
 var
   nue:lista;
 begin
   new(nue);
   nue^.dato:=e;
   nue^.sig:=nil;
   if(l<>nil)then
            ult^.sig:=nue;
      else
         l:=nue;
   ult:=nue;
 end;


  var
      p:prestamo;
      actual,totalAct:integer;
      e:elemento;
      ult:lista;
  begin
    l:=nil;
    inicializarVector(v);
    totalPrestamos:=0;
    cantCumplen:=0;
    leerPrestamo(p);
    while(p.ISBN<>-1)do begin
      actual:=p.ISBN;
      totalAct:=0;
      e.ISBN:=p.ISBN;
      while(p.ISBN=actual)do begin
          totalPrestamos:=totalPrestamos+1;
          totalAct:=totalAct+1;
          v[p.dia]:=v[p.dia]+1;
          if(p.num mod 2<>0)and (p.nroSocio=0)then
                   cantCumplen:=cantCumplen+1;
          leerPrestamo(p);
       end;
      e.cant:=total;
      agregarAtras(l,ult,e);
    end;
  end;

 procedure puntoB(v:vector);
 var
    pos, min,dia:integer;
 begin

    min:=99999;
    for pos:=1 to 31 do begin
       if(v[pos]<min)then begin
         min:=v[pos];
         dia:=pos;
       end;
    end;
    write('El dia del mes que se realizaron menos prestamos es: ',dia);
 end;

 procedure puntoC(totalPrestamos,cantCumplen:integer);

 var
    porcentaje:real;
 begin
    porcentaje:=(cantCumplen*100)/totalPrestamos;
    write('El porcentaje de prestamos nro. de préstamo impar y nro. de socio par es de: ',porcentaje);
 end;


var l: lista;
    v: vector;
    totalPrestamos, cantCumplen: integer
begin
  PuntoA (l, v, totalPrestamos, cantCumplen)
  PuntoB (v);
  PuntoC (totalPrestamos, cantCumplen);
end.
