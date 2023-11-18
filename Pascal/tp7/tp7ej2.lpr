program tp7ej2;
type
  rango=1..6;
  cadena=string[20];
  datos=record
    codCliente:integer;
    DNI:integer;
    apellido:cadena;
    nombre:cadena;
    poliza:rango;
    monto:real;
  end;
 tabla=array[rango]of real;
 lista=^nodo
 nodo=record
   cliente:datos;
   sig:lista;
 end;

 procedure leerCliente(var c:datos);
 begin
   with c do begin
     read(codCliente); read(DNI);read(apellido);
     read(apellido); read(nombre); read(poliza);
     read(monto);
   end;
 end;

procedure agregarAdelante(var l:lista; c:datos);
var nue:lista;
begin
  new(nue);
  nue^.cliente:=c;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargarLista(var l:lista);
var
  c:datos;
begin
  l:=nil;
  repeat
    leerCliente(c);
    agregarAdelante(l,c);
  until (c.codCliente=1122);
end;
procedure informarMonto(l:lista; v:vector);
var
  monto:real;
begin
  monto:=l^.cliente.monto+ v[l^.cliente.poliza];
  write(l^.cliente.DNI, l^.cliente.apellido, l^.cliente.nombre, monto);
end;

procedure informarDig9(l:lista);
var
  cant,dig,num:integer;
begin
  cant:=0;
  num:=l^.cliente.DNI;
  dig:=num mod 10;
  num:=num div 10;
  while (dig<>0) do begin
    if (dig=9) then
      cant:=cant+1;
    dig:=num mod 10;
    num:=num div 10;
  end;
  if (cant=>2) then
    write(l^.cliente.nombre, l^.cliente.apellido);
end;


procedure procesarLista(l:lista; v:tabla);
var
begin
  while(l<>nil) do begin
    informarMonto(l,v);
    informarDig9(l);
    l:=l^.sig;
  end;
procedure eliminar(var l:lista; codigo:integer);
var
 ant,act:lista;
begin
 act:=l;
 while (act<>nil) do begin
   ant:=act;
   act:= act^.sig;
 end;
 if (act<>nil) then
   if (act=pri) then l:=act^.sig;
 else ant^.sig:=act^.sig;
 dispose(act);
end;
var
 l:lista;
 v:tabla;
 codCliBorrar:integer;
begin
 cargarVector(v);{se dispone}
 cargarLista(l);
 procesarLista(l,v);
 readln(codCliBorrar);
 eliminar(l,codCliBorrar);
end;
















