{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.}

program ejercicio14;
const
  dimF=31;
type
    rango=1..31;
    cadena20=string[20];

    prestamo=record
        nro:integer;
        ISBN:cadena20;
        nroSocio:integer;
        dia:rango;
    end;

    lista=^nodo;

    nodo=record
         datos:prestamo;
         sig:lista;
    end;
    info=record
         cantPrestado:integer;
         ISBN:cadena20;
    end;

    nuevaLista=^nodo2;

    nodo2=record
         datos:info;
         sig:nuevaLista;
    end;

    vector=array[1..dimF]of integer;

procedure cargarLista(var l:lista);

  procedure leerPrestamo(var p:prestamo);
   begin
        read(p.ISBN);
        if(p.ISBN<>-1)then begin
            read(nro); read(nroSocio);read(dia);
        end;
   end;

  procedure agregarAtras(var l,ult:lista; p:prestamo);
  var
     nue:lista;
  begin
         new(nue);
         nue^.datos:=p;
         nue^.sig:=nil;
         if(l<>nil)then ult^.sig:=nue;
                   else l:=nue;
         ult:=nue;
  end;

var
  p:prestamo;ult:lista;
begin
   ult:=l;
   leerPrestamo(p);
   while(p.ISBN<>-1)do begin
       agregarAtras(l,ult,p);
       leerPrestamo(p);
   end;
end;

procedure procesarInformacion(l:lista; var nueL:nuevaLista; var diaMin:rango; var porc:real);

    procedure inicializarVector(var v:vector);
   var
     j:integer;
   begin
       for j:=1 to dimF do
           v[j]:=0;
   end;

    procedure crearInfo(var i:info; isbn:cadena20);
    begin
       i.cantPrestados:=i.cantPrestados+1;
       i.ISBN:=isbn;
    end;

    procedure agregarAdelante(var nueL:lista; i:info);
    var
      nue:nuevaLista;
    begin
        new(nue);
        nue^.datos:=i;
        nue^.sig:=nueL;
        nueL:=nue;
    end;

    procedure calcularDiaMin(var diaMin:rango;v:vector;var min:integer);
    var
      i:integer;
    begin
       for i:=1 to dimF do begin
            if(v[i]<min)then begin
                min:=v[i];
                diaMin:=i;
            end;
       end;
    end;

var
  isbnAct:cadena20;
  i:info;
  v:vector;
  cant,total,min:integer;
begin
  nueL:=nil;
  min:=99999;
  inicializarVector(v);
  cant:=0;
  total:=0;
  while(l<>nil)do begin
      isbnAct:=l^.datos.ISBN;
      i.cantPrestado:=0;
      while(l^.datos.ISBN=isbnAct)and (l<>nil)do begin
          crearInfo(i,l^.datos.ISBN);
          agregarAdelante(nueL,i);
          v[l^.datos.dia]:=v[l^.datos.dia]+1;
          total:=total+1;
          if(l^.datos.nro mod 2<>0)and (l^.datos.Socio mod 2=0)then
                cant:=cant+1;
          l:=l^.sig;
      end;
      calcularDiaMin(diaMin,v,min);
      porc:=(total*cant)/100;
  end;
end;

var
  l:lista;
  nueL:nuevaLista;
  diaMin:rango;
  porc:real;
begin
  l:=nil;
  cargarLista(l);
  procesarInformacion(l,nueL,porc);
  write('el día del mes en que se realizaron menos préstamos fue el: ',diaMin);
  write ('el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par es: ',porc);
end.


