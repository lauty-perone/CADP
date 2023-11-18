program tp7ej9;
type
  cadena=string[30];
  rango=1..8;
  peli:record
    codP:integer;
    titulo:cadena;
    codGen:rango;
    puntaje:real;
  end;
  lista=^nodo;
  nodo=record
    p:peli;
    sig:lista;
  end;
  vector=array[rango]of real;
  critica=record
    dni:integer;
    nombre:cadena;
    apellido:cadena;
    codPeli:integer;
    punta:real;
  end;
procedure inicializarV(var v:vector);
var
  j:integer;
begin
  for j:=1 to 8 do begin
    v[j]:=0;
  end;
end;
procedure leerPersona(var d:critica);
begin
  with d do begin
    readln(codPeli);
    if (codPeli<>-1) then begin
      readln(dni); readln(nombre);
      readln(apellido); readln(punta);
    end;
  end;
end;
procedure actualizarLista(var l:lista; prom,suma:real;codAct:integer;var v:vector);
begin
  while (l<>nil) do begin
    while (l^.p.codP<>codAct)do begin
      l:=l^.sig;
    end;
     l^.p.puntaje:=prom;
     v[l^.p.codP]:=v[l^.p.codP]+suma;
  end;
end;
procedure maximo (v:vector; var codGenero:integer);
var
  i:integer;
  max:real;
begin
  max:=-1;
  for i:= 1 to 8 do begin
    if (v[i]>max) then
      max:= v[i];
      codGenero:=i;
  end;
 end;
function cumple(num:integer):boolean;
var
  dig,i,p:integer;
begin
  i:=0;
  p:=0;
  dig:=num mod 10;
  num :=num div 10;
  while(num<>0) do begin
    if (dig mod 2=0) then
      p:=p+1;
   else
    i:=i+1;
   dig:=num mod 10;
   num:=num div 10;
   end;
  cumple:= (i=p);
end;
procedure eliminarPelicular(var l:lista;cod:integer,var exito:boolean);
var
  ant,act:lista;
begin
  exito:=false;
  act:=l;
  while(act<>nil) and (act^.p.codP<>cod)do begin
   ant:=act;
   act:=act^.sig;
  end;
  if (act<>nil) then begin
    exito:=true;
    if (act=l) then
      l:=act^.sig;
    else
     ant^.sig:=act^.sig;
   end;
end;
procedure procesarLista(var l:lista; var codGenero:integer; var v:vector);
var
  prom,suma:real;
  d:critica;
  cant,codAct:integer;

begin
  leerPersona(d);
  while (d.codPeli<>-1) do begin
    codAct:=d.codPeli;
    suma:=0;
    cant:=0;
    while (d.codPeli<>-1) and (d.codPeli=codAct)do begin
      suma:=suma+d.punta;
      cant:=cant+1;
      if (cumple(d.dni))then
       write(d.nombre, d.apellido);
      leerPersona(d);
    end;
    prom:=suma/cant;
    actualizarLista(l,prom,suma,codAct,v);
  end;
 maximo(v,codGenero);
end;
var
  l:lista;
  codGenero:integer;
  v:vector;
  cod:integer;
  exito:boolean;
begin
  cargarLista(l);{se dispone}
  procesarLista(l,codGenero,v);
  readln(cod);
  eliminarPelicula(l,cod,exito);
  writeln(codGenero);
  wirte(exito);
end;



