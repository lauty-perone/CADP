{En un centro de estetica se ofrecen 20 planes poara sus clientes:ozonoterapia, cama sola, depilacion,tratamiento antiarrugas,etc. Cada plan
posee un codigo (1..20), un costo y una cantidad de sesiones.
Ademas el centro dispone de una estructura con informacion de los clientes del centro de estética. De cada cliente se conoce nombre, dni,
ciudad de origen, codigo de plan
contratado, y si ya finalizó el tratamiento.
Realizar un programa que lea y almacene la informacion de los planes del centro para:
informar la ganancia del centor para cada tipo de plan (incluyendo tratamiento finalizados y no finalizados)
Almacenar en una lista  los datos de los clientes que ya hayan finalizado}
program project1;
type
  cod=20;
  cadena=string[20];
  cliente=record
    nombre:cadena;
    dni:integer;
    ciudad:cadena;
    codPlan:integer;
    finalizado:boolean;
  end;
  plan=record;
    costo:real;
    sesiones:integer;
  end;
  vector=array [1..cod]of plan;
 lista=^nodo;
 nodo=record;
   datos:cliente;
   sig:nodo;
 end;
 ganancia=array [1..cod]of real;
 procedure leerPlan(var p:plan);
 begin
   readln(p.costo);
   readln(p.sesiones);
 end;
 procedure cargarInicializar(var v:vector; var g:ganancia);
 var
   i:integer;
   p:plan;
 begin
   for i:=1 to cod do begin
     g[i]:=0;
     readln(v[i].costo);
     readln(v[i].sesiones);
   end;
 end;
procedure armarNodo(l:lista; var l2:lista);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:= l^.datos
  nue^.sig:=l2;
  nue:=l2;
end;

 procedure procesarLista(l:lista; var l2:lista; v:vector;g:ganancia);
 begin
   while (l<>nil)do begin
     g[l^.datos.codPlan]:=g[l^.datos.codPlan]+v[l^.datos.codPlan].costo * v[l^.datos.codPlan].sesiones;
     if (v[l^.datos.finalizado=true) then
       armarLista(l,l2);
     l:=l^.sig;
     end;
 end;
procedure informarGan(g:ganancia);
var
  pos:integer;
begin
  for pos:=1 to cod do begin
    writeln('La ganancia del plan:',pos, 'es de: ',g[pos]);
    end;
end;

var
  v:vector;
  l,l2:lista;
  g:ganancia;
begin
  l:nil;
  l2:nil;
  cargarLista(l);{se dispone}
  cargarInicializar(v,g);
  procesarLista(l,l2,v);
end.

