program tp7ej10;
type
  dimF=20;
  cadena=string[30];
  carac=record
    tipo:cadena;
    cantHec:integer;
    cantMeses:integer;
    dim:integer;
  end;
  vector=array[1..dimF]of carac;
  datos=record
    codigo:integer;
    nombre:cadena;
    tipo:cadena;
    ciudad:cadena;
    cultivos:vector;
  end;
 lista=^nodo;
 nodo=record
   producto:datos;
   sig:lista;
 end;
procedure leerCultivos(var cultivos:vector;var dimL:integer);
begin
 dimL:=1;
 readln(cultivos[dimL].cantH;
 while (cultivos[dimL].cantH<>0) do begin
   readln(cultivos[dimL].cantMeses); readln(cultivos[dimL].tipo;
   readln(cultivos[dimL].cantH);
   dimL:=dimL+1;
 end;
 cultivos[dimL].dim:=dimL;
end;
procedure leerDatos(var d:datos;var dimL:integer);
 begin
   with d do begin
     readln(codigo);
     if (codigo<>-1) then begin
       readln(nombre);readln(tipo);readln(ciudad);
       leerCultivos(d.cultivos,dimL);
     end;
   end;
 end;
procedure agregarAdelante(var l:lista; d:datos);
var
  nue:lista;
begin
 new(nue);
 nue^.producto:=d;
 nue^.sig:=l;
 l:=nue;
end;
procedure cargarLista(var l:lista);
var
  d:datos;
  dimL:integer;
begin
  leerDatos(d,dimL);
  while(d.codigo<>-1) do begin
    dimL:=0;
    agregarAdelante(l,d);
    leerDatos(d,dimL);
  end;
end;
procedure
var
  l:lista;
  cantHecSoja,masTiempoMaiz,:integer;
  porcSoja:real;
begin
  l:=nil;
  cargarLista(l);
  procesarLista(l,dimL,cantHecSoja,porcSoja,masTiempoMaiz);
  informar(cantHecSoja,porcSoja,masTiempoMaiz);
end.

