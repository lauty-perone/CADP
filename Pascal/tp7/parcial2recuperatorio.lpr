program parcial2recuperatorio;
const
  prod=1000;
type
  cadena=string[20];
  producto=record
     desc:cadena;
     precio:real;
  end;
  tabla=array[1..prod]of producto;
  venta=record
     cod:integer;
     dni:integer;
     codP:1..prod;
     cantAdq:integer;
  end;

  lista=^nodo;
  nodo=record
     datos:venta;
     sig:lista;
  end;


procedure leerVenta(var v:venta);
begin
  with v do begin
    read(cod); read(dni);
    read(codP); read(cantAdq);
  end;
end;


procedure agregarLista(var l:lista; v:venta);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=v;
  nue^.sig:=l;
  l:=nue;
end;



procedure cargarLista(var l:lista);
var
  v:venta;
begin
  repeat
    leerVenta(v);
    agregarLista(l);
  until(e.cod=2121)
end;


procedure incisoA(l:lista; t:tabla);
var
  monto:real;
begin
  write(l^.datos.cod);
  monto:=l^.datos.cantAdq*t[l^.datos.codP].precio;
  write(monto);
end;


procedure maximo(l:lista; t:tabla;var max,codMax:integer; var descMax:cadena);
begin
  max:=l^.datos.cantAdq;
  codMax:=l^.datos.codP;
  descMax:=t[l^.datos.codP].desc;
end;

procedure minimo(l:lista;t:tabla;var min,codMin:integer; descMin:cadena);
begin
  min:=l^.datos.cantAdq;
  codMin:=l^.datos.codP;
  descMin:=t[l^.datos.codP].desc;
end;

procedure incisoB (l:lista;t:tabla;var max,min,codMax,codMIn:integer; var descMax,descMin:cadena);
begin
  if(l^.datos.codP=codMax)then begin
     max:=max+l^.datos.cantAdq;
     maximo(l,t,max,codMax,descMax);
  end
  else
  if(l^.datos.catAdq>max)then
    maximo(l,t,max,codMax,descMax);

  if(l^.datos.codP=codMin)then begin
     min:=min+l^.datos.cantAdq;
     minimo(l,t,min,codMin,descMin);
  end
 else
  if(l^.datos.cantAdq<min)then
    minimo(l,t,min,codMin,descMin);
end;


procedure incisoC(dni:integer; var cant:integer);
var
  tot,dig:integer;
begin
  tot:=0;
  while (dni<>0)do begin
    dig:=dni mod 10;

    if(dig mod 2=0)then
      tot:=tot+1;

    dni:=dni div 10;
  end;
  if(tot=>3)then
    cant:=cant+1;
end;

procedure procesarLista(l:lista; t:tabla);
var
 max,min,cant,codMax,codMin:integer;
 descMax,descMin:cadena;
begin
  cant:=0;
  max:=-1;
  min:=9999;
  while(l<>nil)do begin
    incisoA(l,t);
    incisoB(l,t,max,min,codMax,codMin,descMax,descMin);
    incisoC(l^.datos.dni,cant)
    l:=l^.sig;
  end;
  write(codMax,descMax,codMin,descMin);
  write(cant);
end;

 procedure aumento(var t:tabla; desrip:cadena);
 var
  i:integer;
  cumple:boolean;
 begin
   cumple:=false;
   i:=1;
   while(descrip<>t[i].desc)and(i<prod)do begin
     i:=i+1;
   end;
   if(descrip=t[i].descrip)then begin
      cumple:=true;
      t[i].precio:=t[i].precio+(t[i].precio*15)/100;
   end;
   if (cumple=true)then
     write('El precio del producto de la descripcion escrita fue aumentado correctamente');
   else
     write('La descripcion escrita no fue encontrada');
 end;

var
  t:tabla;
  l:lista;
  descrip:cadena;
begin
  l:=nil;
  cargarTabla(t);{se dispone}
  cargarLista(l);
  procesarLista(l,t);
  write('Escriba la descripcion del producto que desea aumentarle el precio un %15');
  read(descrip);
  aumento(t,descrip);
end.





