program ejerc10;
type  cadena25 = string[25]
      vector = array [2010...2019] of real;
      Ferreteria = record
                    Localidad: cadena25;
                    Direccion: cadena25;
                    CantEmpleados:  integer;
                    TotalFacturado: Vector;
                   end;
      lista = ^nodo;
      nodo = record
               dato:ferreteria;
               sig:lista;
             end;
procedure PuntoA (var l: lista);
    procedure leerFerreteria(var f:ferreteria);
      var i:integer;
     begin
        with f do begin
          read(localidad); read(direccion);
          read(cantEmpleados);
          for i:=2010 to 2019 do begin
            read(totalFacturado[i]);
          end;
       end;
     end;
 procedure agregarAdelante(var l:lista; f:ferretetia);
   var
     aux:lista;
   begin
      new(aux);
      aux^.dato:=f;
      aux^.sig:=l;
      l:=aux;
    end;
 var
   f:ferreteria;
 begin
   l:=nil;
   repeat
     leerFerreteria(f);
     agregarAdelante(l,f);
   until(f.localidad= 'La Berisso')
 end;


procedure PuntoB (l: lista);
  function factAnueal(v:vector):real;
  var
    total:real;pos:integer;
  begin
    total:=0;
    for pos:=2010 to 2019 do begin
      total:=total+ v[pos];
    end;
   factAnual:= total/10;
  end;

  procedure calcularMax(monto:real;l:lista;var max1,max2:integer; var dir1,dir2,loc1,lo2:cadena25);
  begin
      if(monto>max1)then begin
          max2:=max1;
          dir2:=dir1;
          loc2:=loc1;
          max1:=monto;
          dir1:=l^.dato.direccion;
          loc1:=l^.dato.localidad;
     end else
        if(monto>max2)then begin
           max2:=monto;
           dir2:=l^.dato.direccion;
           loc2:=l^.dato.localidad;
      end;
    end;

var
  max1,max2:real;
  dir1,dir2,loc1,loc2:cadena25;
begin
  max1:=-1;
  max2:=-1;
  while(l<>nil)do begin
   calcularMax(factAnual(l^.dato.totalFacturado),l,max1,max2,dir1,dir2,loc1,loc2);
   l:=l^.sig;
   end;
  write('La localidad con mayor monto de facturacion anual es: ',loc1,dir1);
  write ('La segunda localidad con mayor monto de facturacion anual es: ',lco2,dir2);
end;

var l: lista;
Begin
 PuntoA (l);
 PuntoB (l);
end.

