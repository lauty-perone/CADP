{13. Realice un programa que procese la información de los alumnos de la Facultad de Informática.
De cada alumno se conoce su apellido, número de alumno, año de ingreso, cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos)
en cada una de las materias aprobadas.
A.    Realice un módulo que lea y retorne, en una estructura adecuada, la información de todos los alumnos.
La lectura finaliza al ingresar el alumno con número de alumno  -1, que no debe procesarse.
B.    Realice un módulo que reciba la estructura  generada en el inciso anterior, e imprima el apellido de los dos alumnos con mejor promedio
que ingresaron a partir del año 2015.}

program ej13;
const
  dimF=36;
type
  cadena25=string[25];
  vector=array[1..dimF]do integer;
  alumno=record
    apellido:cadena25;
    nro:integer;
    año:integer;
    matAprob:1..dimF;
    nota:vector;
  end;

  lista=^nodo;

  nodo=record
    dato:alumno;
    sig:lista;
  end;

 procedure PuntoA(var l:lista);
   procedure leerAlumno(var a:alumno);
      var
        i:integer;
      begin
        read(a.nro);
        if(a.nro<>-1)then begin
          read(a.apellido);
          read(a.año); read(a.matAprob);
          for i:=1 to a.matAprob do
              read(a.nota[i]);
        end;
      end;

   procedure agregarAdelante(var l:lista; a:alumno);
    var
      nue:lista;
    begin
       new(nue);
       nue^.dato:=a;
       nue^.sig:=l;
       l:=nue;
    end;

 var
   a:alumno;
 begin
   l:=nil;
   leerAlumno(a);
   while(a.nro<>-1)do begin
     agregarAdelante(l,a);
     leerAlumno(a);
   end;
 end;

 procedure PuntoB(l:lista);
     function calcularProm(materias:integer; nota:vector);
        var
          total,pos:integer;
        begin
          total:=0;
          for pos:= 1 to materias do
             total:=total+ nota[pos];
          calcularProm:= total/materias;
        end;

     procedure calcularMaximos(prom:real;var max1,max2:integer;apellido:cadena25; var ape1,ape2:cadena25);
     begin
       if(prom>max1)then begin
         max2:=max1;
         ape2:=ape1;
         max1:=prom;
         ape1:=apellido;
       end else
          if(prom>max2)then begin
            ape2:=apellido;
            max2:=prom;
          end;
     end;


  var
    max1,max2:integer;
    ape1,ape2:cadena25;
    prom:real;

  begin
    max1:=-1;
    max2:=-1;
    while(l<>nil)do begin
      if(l^.dato.año>=2015)then
          prom:=calcularProm(l^.dato.matAprob, l^.dato.nota);
          calcularMaximos(prom,max1,max2,l^.dato.apellido,ape1,ape2);
      l:=l^.sig;
    end;
    write(ape1,ape2);
   end;


var
  l:lista;

begin
  PuntoA(l);
  PuntoB(l);

