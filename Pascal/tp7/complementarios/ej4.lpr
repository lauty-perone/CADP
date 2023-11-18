{5. Una Facultad requiere el procesamiento de la información de los 1000 alumnos de una carrera que cuenta con 32 materias en su plan de estudio.
De cada alumno se conoce el nro de alumno,  Año de ingreso y las notas de los finales aprobados. Realizar un programa que implemente módulos para:
a) Leer la información de los alumnos (el ingreso de notas termina con la nota -1) y almacenarla en un vector
b) Retornar el nro del alumno y año de ingreso del alumno con mayor cantidad de finales aprobados, a partir del vector generado en a).
}
program ej4;
const
  dimF=1000;
  mat= 32;
type
  tabla=array[1..mat]of real;
  alumno=record
    nro:integer;
    ingreso:integer;
    notas:tabla;
  end;
  vector=array[1..dimF]of alumno;

 procedure cargarVector(var v:vector);
   procedure leerAlumno(var a:alumno; var dimL:integer;);
   var
     i,num:integer;
   begin
     read(a.nro);
     read(a.ingreso);
     read(num);
     dimL:=0;
     if (num<>-1)then begin
      while(num<>-1)and (dimL<mat)do begin
        dimL:=dimL+1;
        a.notas[dimL]:=num;
        read(num);
     end;
   end;
  end;

var
  a:alumno;
  dimL:integer;
begin
  leerAlumno(a,dimL);




var
  v:vector;
begin
  cargarVector(v);
  procesarVector(v);
end.

