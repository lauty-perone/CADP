{15. La empresa “Almacenes Argentina 2000” desea evaluar las ganancias obtenidas a lo largo de todo el año 2020 en el país.
Para cada mes, la empresa conoce la información de todas las ventas realizadas en las distintas localidades del país.
De cada venta se conoce el nombre de la localidad donde se realizó la venta y el monto facturado en dicha venta.
Se pide realizar un programa que:
A.    Invoque a un módulo que lea y retorne en una estructura de datos adecuada la información de las ventas.
La información se ingresa ordenada por mes. Para cada mes, la lectura finaliza al ingresar el monto 0 (que no debe procesarse).
B.    Lea un nombre de localidad e invoque a un módulo que recibe dicho nombre y la información de las ventas, e
informe los dos meses de menor facturación de esa localidad. Se debe implementar una función que reciba las ventas de un mes y
una localidad y devuelva el monto total facturado de la localidad. }

program ej15;
const
  dimF=12;
type
  cadena25=string[25];

  venta=record
     localidad:cadena25;
     monto:real;
  end;

  lista=^nodo;
  nodo=record
     dato:venta;
     sig:lista;
   end;

  vectorAño=array[1..dimF]do lista;

  procedure puntoA(var v:vectorAño);
    procedure leerVenta(var ven:venta)
      begin
       read(ven.monto);
       if(ven.monto<>0)then
          read(ven.localidad);
     end;

    procedure agregarAdelante(var l:lista; ven:venta);
       var
         nue:lista;
       begin
        new(nue);
        nue^.dato:=ven;
        nue^.sig:=l;
        l:=nue;
       end;
   var
      ven:venta;pos:integer;
   begin
     for pos:=1 to dimF do begin
          v[pos]:=nil;
         leerVenta(ven);
          while(ven.monto<>0)do begin
             agregarAdelante(v[pos],ven);
             leerVenta(ven);
           end;
         end;
     end;


procedure puntoB(v:vectorAño; nombre:cadena25);
var

   begin
    end;




var
  v:vectorAño;
  nombre:cadena25;
begin
  puntoA(v);
  read(nombre);
  puntoB(v,nombre);
end.
