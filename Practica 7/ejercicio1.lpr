{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program ejercicio7;

type
  rango=1..120;

  cadena20= string[20];
  persona=record
       DNI: integer;
       apellido:cadena20;
       nombre:cadena20;
       edad: rango;
       codActuacion:1..5;
  end;

  lista=^nodo;

  nodo=record
       datos:persona;
       sig:lista;
  end;

  vector=array[1..5]of integer;

procedure inicializarVector(var v:vector);
var
  j:integer;
begin
     for j:=1 to 5 do begin
       v[j]:=0;
     end;
end;

procedure cargarLista(var l:lista; var v:vector);




    procedure leerPersona(var p:persona);
    begin
       with p do begin
         read(DNI); read(apellido);
         read(nombre); read(edad);
         read(codActuacion);
       end;
    end;

    procedure agregarLista(var l:lista; p:persona);
    var nue:lista;
    begin
       new(nue);
       nue^.datos:=p;
       nue^.sig:=l;
       l:=nue;
    end;


var
  p:persona;
begin

     repeat
       leerPersona(p);
       agregarLista(l,p);
       v[p.codActuacion]:=v[p.codActuacion]+1;
     until(p.DNI=33555444);
end;

procedure procesarLista(l:lista; v:vector);


    procedure calcularCantPersonas(num:integer;var cantP:integer);

       function cumple(num:integer):boolean;
           var
              dig,par,imp:integer;
           begin
              par:=0; imp:=0;
              while (num<>0) do begin+
                  dig:=num mod 10;
                  if( num mod 2=0) then par:=par+1;
                                   else imp:=imp+1;
                  num:=num div 10
              end;
              cumple:= par>imp;
           end;

   begin
        if (cumple(num)) then
            cantP:=cantP+1;
   end;

    procedure calcularMaximos(var max1,max2:integer;v:vector);
    var
       i:integer;
    begin
       for i:=1 to 5 do begin
           if (v[i]>max1)then begin
              max2:=max1;
              cod2:=cod1;
              max2:=v[i];
              cod1:=i;
           end
           else
              if(v[i]>max2)then begin
                   max2:=v[i];
                   cod2:=i;
           end;
       end;
    end;

var
  cantP,max1,max2,cod1,cod2:integer;
begin
  cantP:=0;
  max1:=-1;
  max2:=-1;
  while(l<>nil)do begin
       calcularCantPersonas(l^.datos.DNI,cantP);
       calcularMaximos(max1,max2,v);
       l:=l^.sig;
  end;
  write(cantP);
  write(max1,max2);
end;

procedure borrarElemento(var l:lista);
   var
      dni:integer;
      exito:boolean;
      ant,act:lista;
   begin
      writeln('Escriba el dni que quiera borrar');
      readln(dni)
      exito:=false;
      act:=l;
      while(act<>nil)and (dni<>act^.datos.DNI)do begin
        ant:=act;
        act:=act^.sig;
      end;
      if (act<>nil)then begin
           exito:=true;
           if (act=l)then l:=act^.sig;
                     else ant^.sig:=act^.sig;
           dispose(act);
      end;
      if (exito)then  write('El dni se borro correctamente');
            else write('El dni ingresado no exite');
   end;

var
  v:vector;
  l:lista;
  dni:integer;
  exito:boolean;
begin
  l:=nil;
  inicializarVector(v);
  cargarLista(l,v);
  borrarElemento(l);

end.

