{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program ejercicio3;

type
  cadena20=string[20];
  viaje=record
      numViaje:integer;
      numAuto:integer;
      kilometros:integer;
      origen:cadena20;
      direccionAuto:cadena20;
  end;

  lista=^nodo;

  nodo= record
      datos:viaje;
      sig:lista;
  end;

 procedure procesarLista(l:lista; var lNue:lista; var cod1,cod2:integer);

  procedure calcularMaxs(l:lista; var cod1,cod2,max1,max2:integer);
       begin
           if(l^.datos.kilometros>max1)then begin
                  cod2:=cod1; max2:=max1;
                  cod1:=l^.datos.numAuto;
                  max1:=l^.datos.kilometros
           end
           else
                 if(l^.datos.kilometros>max2)then begin
                        max2:=l^.datos.kilometros;
                        cod2:=l^.datos.numAuto;
                 end;
       end;

  procedure crearLista(v:viaje;var lNue:lista);
  var
    nue:lista;
  begin
      new(nue);
      nue^.datos:=v;
      nue^.sig:=lNue;
      lNue:=nue;
  end;

  var
    numActual,max1,max2:integer;
  begin
    max1:=-1;
    max2:=-1;
    lNUe:=nil;
    while(l<>nil)do begin
         numActual:=l^.datos.numAuto;
         while (l^.datos.numAuto=numActual)do begin
                  calcularMaxs(l, cod1,cod2,max1,max2);
                  if(l^.datos.kilometros>5)then
                         crearLista(l^.datos,lNue);
                  l:=l^.sig;
         end;
    end;
  end;

var
  l,lNue:lista;
  cod1,cod2:integer;
begin
  l:=nil;
  cargarLista(l);  {se dispone}
  procesarLista(l,lNue,cod1,cod2);
  write(cod1,cod2);
end.
