{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program ejercicio4;
const
  dimF=42;
type
  cadena20=string[20];

  vector=array[1..dimF]do real;

  paciente=record
     nombre:cadena20;
     apellido:cadena20;
     pesoRegistrado:vector;
  end;

  lista=^nodo;

  nodo=record
     datos:paciente;
     sig:lista;
  end;
procedure cargarLista(var l:lista);

    procedure leerPaciente(var p:paciente;var dimL);
    var
      peso:real;
    begin
        dimL:=dimL+1;
        with p do begin
          read(nombre);
          read(apellido);
          while(dimL<dimF)do begin
               pesoRegistrado[dimL]:= read(peso);
               dimL:=dimL+1;
        end;
    end;


    procedure agregarLista(var l:lista; p:paciente);
    var
      nue:lista;
    begin
         new(nue);
         nue^.datos:=p;
         nue^.sig:=l;
         l:=nue;
    end;
    procedure maxSemana(v:vector; dimL:integer; var semMax:integer);
    var
       i:integer;max,calc:real;
    begin
        max:=-1;
        for i:=2 to dimL do begin
            calc:=v[i]-v[i+1];
            if (calc>max)then
                semMax:=i;
        end;
    end;
 var
   dimL,semMax: integer
   totalPeso:real;
   p:paciente;

 begin
     dimL:=0;
     leerPaciente(p,dimL);
     while(p.nombre<>'andrea')do begin
          totalPeso:=0;
          agregarLista(l,p);
          maxSemana(p.pesoRegistrado,dimL,semMax);
          totalPeso:=v[dimL]-v[1];
          write(semMax, totalPeso);
          dimL:=0;
          leerPaciente(p,dimL);
     end;
 end;
var
  l:lista;
  t:vector;
  dimL:integer;
begin
  l:=nil;
  cargarLista(l); {se dispone}
  cargarVector(t,dimL);
  procesar(l,t,dimL);
end.
