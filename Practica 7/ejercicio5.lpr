{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program ejercicio5;
const
  dimF=100;
type

   cadena10=string[10];
   camion=record
      patente=cadena10;
      añoFabricacion:integer;
      capacidad:real;
   end;

   tabla=array[1..dimF]do camion;

   viaje=record
      codViaje:integer;
      codCamion:1..dimF;
      distancia:integer;
      destino:cadena10;
      añoViaje:integer;
      dniChofer:integer;
   end;

   lista=^nodo;

   nodo=record
      datos:viaje;
      sig:lista;
   end;

procedure cargarLista(var l:lista);
     procedure leerViaje(var v:viaje);
     begin
        with v do begin
           read(codViaje); read(codCamion); read(distancia);
           read(destino); read(añoViaje); read(dniChofer);
        end;
     end;

     procedure agregarLista(var l:lista; v:viaje);
     var
       nue:lista;
     begin
        new(nue);
        nue^.datos:=v;
        nue^.sig:=l;
        l:=nue;
     end;

var
  v:viaje;
begin
   leerViaje(v);
   while(v.codViaje<>-1)do begin
         agregarLista(l,v);
         leerViaje(v);
   end;
end;

procedure procesarLista(l:lista; t:tabla);
      procedure calcularMaxMin(dist,pat:integer;var patMax,patMin,max,min:integer);
      begin
          if(dist>max)then begin
              max:=dist;
              patMax:=pat;
          end;
          if(dist<min)then begin
              min:=dist;
              patMin:=pat;
          end;
      end;

      procedure infoCantViajes(cap:real;fabri,viaje:integer; var cant:integer);
      begin
          if(cap>30.5)and ((viaje-fabri)<5)then
              cant:=cant+1;
      end;

      procedure infoDNI(num,codViaje:integer);
        function cumple(num:integer):boolean;
            var
              dig:integer;exito:boolean;
            begin
               exito:=false
               dig:=num mod 10;
               while(num<>0)and (dig mod 2<>0)do begin
                    num:=num div 10;
                    dig:=num mod 10;
               end;
               if(num=0)then
                   exito:=true;
               cumple:=exito;
            end;
      begin
         if(cumple(num))then
             write(codViaje);
      end;
var
  cant,patMax,patMin,max,min:integer;
begin
   cant:=0;
   max:=-1;
   min:=99999;
   while(l<>nil)do begin
         calcularMaxMin(l^.datos.distancia,v[l^.datos.codCamion].patente,patMax,patMin,max,min);
         infoCantViajes(v[l^.datos.codCamion].capacidad, v[l^.datos.codCamion].añoFabricacion,l^.datos.añoViaje,cant);
         infoDNI(l^.datos.dniChofer,l^.datos.codViaje);
         l:=l^.sig;
   end;
   write(patMax,patMin);
   write(cant);
end;

var
  t:tabla;
  l:lista;
begin
  l:=nil;
  cargarTabla(t); {se dispone}
  cargarLista(l);
  procesarLista(l,t);
end.


















