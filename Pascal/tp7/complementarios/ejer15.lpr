{14. El Centro de Estudios Sobre Nutrición Infantil requiere un programa que procese la información de las escuelas de La Plata.
De cada escuela se conoce su nombre, dirección, código único de escuela, cantidad de alumnos y el peso de cada uno de los alumnos de la escuela (a lo sumo 2000).
A.    Realice un módulo que lea y retorne, en una estructura adecuada, la información de los alumnos. La lectura finaliza al ingresar la escuela
con código 1000, que debe procesarse.
B.    Realice un módulo que reciba la estructura generada en el inciso anterior e informe el nombre y dirección de todas las escuelas en las que
al menos la mitad de sus alumnos pesa más de 40,5 kg.
}
program ejer15;
const
  dimF=2000;
type
 cadena25=string[25];
 vectorPeso=array[1..dimF]of real;

 escuela=record
   nombre:cadena;
   dir:cadena;
   cod:integer;
   cantAlumnos:integer;
   pesoCadaUno:vectorPeso;
 end;

  lista=^nodo;
  nodo=record
    dato:escuela;
    sig:lista;
  end;

 procedure PuntoA(var l:lista);

    procedure leerEscuela(var e:escuela);
    var
      i:integer;
    begin
      read(e.nombre); read(e.dir); read(e.cod);
      read(e.cantAlumnos);
      for i:= 1 to e.cantAlumnos do
         read(e.pesoCadaUno[i]);

    end;
    procedure agregarAdelante(var l:lista; e:escuela);
     var
       nue:lista;
     begin
       new(nue);
       nue^.dato:=e;
       nue^.sig:=l;
       l:=nue;
     end;

 var
   e:escuela;
 begin
   l:=nil;
   repeat
     leerEscuela(e);
     agregarAdelante(l,e);
   until(e.cod=1000) ;
  end;

procedure PuntoB(l:lista);
 procedure contarCant(var cant:integer;cantAlumnos:integer; v:vectorPeso);
   var
     pos:integer;
   begin
     for pos:= 1 to cantAlumnos do begin
        if(v[pos]>40,5)then
              cant:=cant+1;
     end;
   end;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil)do begin
     contarCant(cant,l^.dato.cantAlumnos,l^.dato.pesoCadaUno);
     if(cant>= l^.dato.cantAlumnos/2)then begin
             write(l^.dato.dir);
             write(l^.dato.nombre);
          end;
     l:=l^.sig;
   end;
end;

var
  l:lista;
 begin
   PuntoA(l);
   PuntoB(l);
   end.
