program materias;
type
 total=5000;
  cadena=string[30];
  libro=record
    cod:1..total;
    materia:1..7;
    titulo:cadena;
    edicion:integer;
    precio:real;
    autor:cadena;
  end;
  vector=array[1..total]of libro;
  tabla=array[1..7]of integer;
  venta=record
    codL:integer;
    dni:integer;
    mes:integer;
    año:integer;
  end;
  lista=^nodo;
 nodo=record
  datos:venta;
  sig:lista;
end;
procedure leerLibro(var lib:libro);
begin
 with lib do begin
     read(cod); read(materia);
     read(titulo); read(edicion);
     precio(real);autor(autor);
 end;
end;

procedure cargarVector(var v:vector);
lib:libro;
i:integer;
 begin
  for i:=1 to total do begin
     leerLibro(lib);
     v[i]:=lib;
   end;
 end;
procedure inicializarTabla(var t:tabla);
var
  j:integer;
begin
 for j:=1 to 7 do begin
    t[j]:=0;
 end;
end;
function cumple(dni:integer):boolean;
var
  verdad:boolean;dig:integer;
begin
   verdad:=true;
   dig:=dni mod 10;
   dni:=dni div 10;
   while(dni<>0)and (verdad=true)do begin
      if (dig mod 2=0)then
        verdad:=false
      else begin
         dni:=dni div 10;
         dig:=dni mod 10;
      end;
  end;
   cumple:=verdad;
  end;


procedure procesarInfo(v:vector; l:lista);
var
  t:tabla;
  pos:integer;
begin
   inicializarTabla(t);
   while(l<>nil)do begin
      t[v[pos].materia]:=t[v[pos].materia]+1;
      if(cumple(l^.datos.dni))and (v[l^.datos.codL].edicion>2011)and (v[l^.datos.codL]<2017)then
        write(l^.datos.año, v[l^.datos.codL].titulo);
     l:=l^.sig;
   end;
end;




var
  v:vector;
  l:lista;
 begin
   cargarVector(v);
   cargarLista(l);{se dispone}
   proceesarInfo(v,l);
 end;

