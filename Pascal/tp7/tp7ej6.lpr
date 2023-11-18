program tp7ej6;
type
  rango=1..7;
  cadena=string[30];
  vector=array[rango] of integer;
  datos=record
    codObj:integer;
    cat:rango;
    nombre:cadena;
    dist:real;
    descubridor:cadena;
    anoDes:integer;
  end;
 lista=^nodo
 nodo=record
   objeto:datos;
   sig:lista;
 end;
procedure inicializarVector(var v:vector);
var
  i:integer;
begin
 for i:= 1 to 7 do begin
   v[i]:=0;
 end;
end;
procedure leerObjeto(var d:datos);
begin
  with d do begin+
    readln(codObj); read(cat); read(nombre); read(dist);
    read(descubridor); read(anoDes);
 end;
end;
procedure agregarAlFinal(var pri,l:lista; d:datos);
var
  nue:lista;
begin
  new(nue);
  nue^.objeto:=d;
  nue^.sig:=nil;
  if (pri<>nil) then
    l^.sig:=nue;
 else
  pri:=nue;
 l:=nue;
end;
procedure cargarListaVector(var l:lista; var v:vector);
var
  d:datos;
  pri:lista;
begin
 leerObjeto(d);
 while (d.codObj<>-1) do begin
   agregarAlFinal(pri,l,d);
   v[d.cat]:=v[d.cat]+1;
   leerObjeto(d);
 end;
end;
procedure maximos(l:lista; var max1,max2:real; var cod1,cod2:integer);
begin
 if (l^.objeto.dist>max1) then begin
   max2:=max1;
   cod2:=cod1;
   max1:=l^.objeto.dist;
   cod1:=l^.objeto.codObj;
 else
   if (l^.objeto.dist>max2) then begin
    max2:=l^.objeto.dist;
    cod2:=l^.objeto.codObj;
   end;
 end;
end;
procedure galileo(l:lista; var cantP:integer);
begin
 if (l^.objeto.descubridor='Galileo Galilei') and (l^.objeto.anoDes<1600) then
     cantP:=cantP+1;
end;
function cumple (codObj;integer):boolean;
var
  imp,par:integer
begin
 imp:=0;
 par:=0;
 while (codObj<>0) do begin
   if (codObj mod 10=0) then
       par:=par+1;
   else
    imp:=imp+1;
   codObj:= codObj div 10;
 end;
 cumple:=(par>imp);
end;
procedure estrellaImp(l:lista);
begin
 if (cumple(l^.objeto.codObj))and (l^.objeto.cat=1) then
     write(l^.objeto.nombre);
end;
procedure procesarLista(l:lista; var cod1,cod2,cantP:integer);
var
  max1,max2:real;
begin
 max1:=-1;
 max2:=-1;
 cantP:=0;
 while (l<>nil) do begin
   maximos(l,max1,max2,cod1,cod2);
   galileo(l,cantP);
   estrellaImp(l);
   l:=l^.sig;
 end;
end;
procedure informar(cod1,cod2,cantP:integer; v:vector);
var
  p:integer;
begin
 write(cod1,cod2);
 write(cantP);
 for i:=1 to 7 do begin
   write(v[i]);
 end;
end;
var
 l:lista;v:vector;
 cod1,cod2,cantP:integer;
begin
 l:=nil;
 inicializarVector(v);
 cargarListaVector(l,v);
 procesarLista(l,v,cod1,cod2,cantP);
 informar(cod1,cod2,cantP,v);
end.

