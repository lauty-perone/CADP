{La Organización Mundial de la Salud (OMS) necesita un sistema para obtener estadísticas de las dosis de vacunas aplicadas
contra el COVID‑19 en cada país. Cada país notifica diariamente a la OMS la cantidad de dosis aplicadas por tipo de vacuna.
De cada notificación se conoce: fecha, nombre del país, tipo de vacuna (1:Sinopharm, 2:CanSino, 3:AstraZeneca, 4:Sputnik) y
cantidad de dosis aplicadas.
Se dispone una estructura que almacena las notificaciones agrupadas por tipo de vacuna. Para cada tipo, las
notificaciones realizadas se encuentran ordenadas por nombre de país.

Implemente un programa que:

Reciba la estructura que almacena las notificaciones y, usando la técnica de merge acumulador, genere un ABB
(ordenado por cantidad de dosis)
que contenga para cada país, la cantidad total de dosis aplicadas.

Implementar un módulo recursivo que reciba la estructura generada en a) y retorne el nombre del país que aplicó
la mayor cantidad de dosis.

NOTA: Cada país puede aplicar más de un tipo de vacuna por día.
No es necesario implementar la carga de la estructura que se dispone.
Alcanza con declarar el encabezado del procedimiento e invocarlo para que el programa compile satisfactoriamente.}
program Perone;
const
  dimF=4;
type
   cadena20=String[20];

   notificacion=record
     fecha:cadena20;
     pais:cadena20;
     tipoVacuna:1..dimF;
     cantDosis:integer;
   end;

   lista=^nodo;

   nodo=record
     dato:notificacion;
     sig:lista;
   end;

   vector=array[1..dimF]of lista;


   datoArbol=record
     pais:cadena20;
     cantDosis:integer;
   end;

   arbol=^nodoArbol;

   nodoArbol=record
     dato:datoArbol;
     HI:arbol;
     HD:arbol;
   end;

procedure cargarVector(var v:vector);
var
  l:lista;
begin
          {se van a cargar las 4 listas ordenadas por nombre de pais}
end;

procedure cargarArbol(var a:arbol; v:vector);
var
  i:integer;
begin
  for(i:=1 to dimF)do begin
    if(a=nil)then begin
      new(a);
      a^.dato.pais:=v[i]^.dato.pais;
      a^.dato.cantDosis:=v[i]^.dato.cantDosis;
    end;
  end;
end;
procedure paisMaximo(a:arbol;var paisMax; var max:integer);
begin
  if(a<>nil)then
    if(a^.dato.cantDosis>max)then begin
        paisMax:=a^.dato.pais;
        max:=a^.dato.cantDosis;
      end;
      paisMaximo(a^.HI, paisMax,max);
      paisMaximo(a^.HD, paisMax,max);
   end;


var
  v:vector;
  a:arbol;
  paisMax:cadena20;
  max:integer;
begin
  cargarVector(v); {se dispone y se encuentran agrupadas por tipo de vacuna}
  cargarArbol(a,l); {carga al arbol ordenado por cantidad de dosis}
  max:=-1;
  paisMaximo(a,paisMax,max); {recibe la estructura arbol y calcula el maximo de cantidad de dosis y su pais}
  writeln('El pais que aplicó la mayor cantidad de dosis es: ', paisMax);
end.

