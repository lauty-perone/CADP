program empleados;
type
  cadena=string[20];
  fecha=record
    dia:1..31;
    mes:1..12;
    año:integer;
  end;
  empleado=record
    dni:integer;
    apellido:cadena;
    nacimiento:fecha;
    nombre:cadena;
    categoria:integer;
    ingreso:fecha;
    sueldo:real;
  end;
  lista=^nodo;
  nodo=record
    datos:empleado;
    sig:lista;
  end;
procedure leerEmpleado(var e:empleado);
var
  f:fecha;
begin
  with e do begin
       read(dni);read(nombre); read(apellido);
       read(categoria); read(ingreso.dia);
       read(ingreso.mes); read(ingreso.año);
       read(sueldo);
  end;
end;
procedure agregarOrdenado(var l:lista; e:empleado);
var
  ant,nue,act:lista;
begin
  new(nue);
  nue^.datos:=e:
  act:=l;
  ant:=l;
  while(act<>nil)and (act^.datos.dni<e.dni)do begin
       ant:=act;
       act:=act^.sig;
       if(ant=act)then
         l:=nue;
       else
         ant^.sig:=nue;
  nue^.sig:=act;
  end;
end;
procedure cargarLista(var l:lista);
var
  e:empleado;
begin
  leerEmpleado(e);
  while(e.dni<>-1)do begin
       agregarOrdenado(l,e);
       leerEmpleado(e);
    end;
end;
procedure inforSueldo(l:lista);
var
  r,n:integer;
begin
   if (l^.datos.categoria=1)then
         write(l^.datos.sueldo)
       else begin
          r:=2021-l^.datos.ingreso.año;
          n:=r*1000;
          write(l^.datos.sueldo+n);
       end;
end;
procedure maxSueldos(l:lista; var max1,max2,dni1,dni2:integer);
begin
  if(l^.datos.sueldo>max1)then begin
    dn2:=dni1;
    max2:=max1;
    dn1:=l^.datos.dni;
    max1:=l^.datos.sueldo;
  end
  else
   if(l^.datos.sueldo>max2)then begin
     max2:=l^.datos.sueldo;
     dni2:=l^.datos.dni;
   end;
end;

procedure repDig(dni:integer);
var
 com,dig,cant,num:integer;

begin
  com:=0;
  for com
  cant:=0;
  num:=dni;
  dig:=dni mod 10;
  num:=dni div 10;
  while(dig<>0)do begin
   if(com=dig)then
         cant:=cant+1
    dig:=dni mod 10;
    num:=dni div 10;
   end;
  write('La cant de veces que se repite el digito: ',com, 'es de: ',cant);
  com:=com+1;
end;
procedure procesarLista(l:lista);
var
 dni1,dni2,max1,max2:integer;

 begin
   max1:=0;
   max2:=0;
   while (l<>nil)do begin
     inforSueldo(l);
     maxSueldos(l,max1,max2,dni1,dni2);
     repDig(l^.datos.dni);
     l:=l^.sig;
  end;
  write(dni1,dni2);
end;
procedure aumento(var l:lista);
n:lista;
begin
 n:=l;
 while(n<>nil)do begin
  if(n^.datos.categoria=1)then
        n^.datos.sueldo:=(n^.datos.sueldo*20)/100;
  else
  if(n^.datos.categoria=2)then
        n^.datos.sueldo:=(n^.datos.sueldo*25)/100;
 end;
 l:=n;
end;
var
  l:lista;
begin
  l:=nil;
  cargarLista(l);
  procesarLista(l);
  aumento(l);
end.



















