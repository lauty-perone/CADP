program tp7ej4;
type
  rango=1..42;
  cadena=string[30];
  vector=array[rango] of real;
  datos=record
    nombre:cadena;
    apellido:cadena;
    pesoSem:vector;
  end;
 lista=^nodo;
 nodo=record
  mama:datos;
  sig:lista;
 end;
procedure semMax(l:lista;var semMax:integer; i:integer; var max:real);
begin
  if (l^.mama.pesoSem[i]>max) then begin
     max:=l^.mama.pesoSem[i];
     posM:=i;
 end;
end;
procedure totalPeso(l:lista;var pesoTotal:real;i:integer);
begin
  pesoTotal:=pesoTotal+l^.mama.pesoSem[i]
end;

procedure procesarVector(l:lista; var max, pesoTotal:real);
var
 i:integer;
begin
  pesoTotal:=0;
  max:=0;
 for i:=1 to 42 do begin
   semMax(l,semMax,max,i);
   totalPeso(l,pesoTotal,i);
 end;
end;
procedure informar(l:lista; semMax:integer; pesoTotal:real);
begin
 write('La embarazada: ',l^.mama.apellido, 'su semana con mayor aumento de peso fue la: ',semMax,
 'y su aumento total durante el embarazo fue de: ',pesoTotal, 'kilogramos');

end;

procedure procesarLista (l:lista);
var
 semMax:integer;
 max,pesoTotal:real;
begin
  while (l<>nil) do begin
    procesarVector(l,max);
    informar(l,semMax,pesoTotal);
    l:=l^.sig;
  end;
end;

var
 l:lista;
begin
  cargarLista(l){se dispone}
  procesarLista(l);
end.

