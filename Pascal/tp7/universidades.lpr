{Se desea procesar la información de universidades latinoamericanas. De cada universidad se lee: código
de universidad, nombre, código de país (1..20) y cantidad de alumnos. La lectura finaliza al ingresar el
código de universidad 0, que no debe procesarse. Se pide:
1) Realizar un módulo para almacenar en una estructura la información leída.
2) Realizar un módulo que reciba la estructura generada en 1) y retorne si se encuentra almacenada, o no,
la universidad con código 567.
3) Realizar un modulo que reciba la estructura generada en 1) y calcule los códigos de los 2 países con
menor cantidad de alumnos.
NOTA: Realizar el programa principal que invoca a los módulos implementados.}

program universidades;
type
  cadena=string[20];
  universidad=record
    cod:integer;
    nombre:cadena;
    codPais:1..20;
    cantA:integer;
  end;

lista=^nodo;
 nodo:record
   datos:universidad;
   sig:lista;
 end;

procedure leerUni(var u:universidad);
begin
   with u do begin
      read(cod); read(nombre);
      read(codPais); read(cantA);
   end;
end;

procedure agregarAdelante(var l:lista; u:universidad);
var
  nue:lista;
begin
   new(nue);
   nue^.datos:=u;
   nue^.sig:=l;
   l:=nue;
end;

 procedure cargarLista(var l:lista);
 var
   u:universidad;
 begin
    leerUni(u);
    while(e.cod<>0)do begin
      agregarAdelante(l,u);
      leerUni(u);
    end;
 end;

procedure minimos(l:lista; var min1,min2,cod1,cod2:integer);
begin
   if(l^.datos.cantA<min1)then begin
     min2:=min1;
     cod2:=cod1;
     min1:=l^.datos.cantA;
     cod1:=l^.datos.cod;
    end else
    if(l^.datos.cantA<min2)then begin
       min2:=l^.datos.cantA;
       cod2:=l^.datos.cod;
    end;
end;
procedure procesarLista(l:lista);
var
 encontre:boolean;
 min1,min2,cod1,cod2:integer;
begin
   min1:=99999;
   min2:=99999;
   encontre:=false;
  while(l<>nil)do begin
    if(l^.datos.cod=567)then
      encontre:=true;
    minimos(l,min1,min2,cod1,cod2);
    l:=l^.sig;
  end;
 if (encotre=true)then
   write('La universidad con codigo 567 esta almacenada en la informacion');
 else
   write('La universidad no se ha encontrado');
 write('Los codigos de las dos universidades con menos alumnos son: ',cod1,cdo2);
end;

var
  l:lista;
begin
   l:=nil;
   cargarLista(l);
   procesarLista(l);
end.
