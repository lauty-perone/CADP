{. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program ejercicio2;
type
  cadena20=string[20];
  cliente=record
      cod:integer;
      DNI:integer;
      apellido:cadena20;
      nombre:cadena20;
      codPoliza:1..6;
      montoBasico:real;
  end;

  tabla=array[1..6]of real;

  lista=^nodo;

  nodo=record

       datos:cliente;
       sig:lista;
  end;

procedure cargarLista(var l:lista);
       procedure leerCliente(var c:cliente);
       begin
           with c do begin
             read(cod); read(DNI); read(apellido); read(nombre); read(codPoliza); read(montoBasico);
           end;
       end;

       procedure agregarAdelante(var l:ista; c:cliente);
       var
         nue:lista;
       begin
           new(nue);
           nue^.datos:=c;
           nue^.sig:=l;
           l:=nue;
       end;
  var
    c:cliente;
  begin
       l:=nil;
       repeat
         leerCliente(c);
         agregarAdelante(l,c);
       until(c.cod=1122);
  end;

procedure InfoMontoComp(l:lista; t:tabla);
  var
    total:real;
  begin
      total:= l^.datos.montoBasico + t[l^.datos.codPoliza];
      write(l^.datos.apellido, l^.datos.nombre,l^.datos.DNI, total);
  end;

procedure analisarDNI(l:lista);
   function cantidad(num:integer):integer;
   var cant,dig:integer;
   begin
        cant:=0;
        while(num<>0)do begin
           dig:=num mod 10;
           if (dig=9)then
                  cant:=cant+1;
           num:= num div 10;
        end;
        cantidad:=cant;
   end;

begin
    if (cantidad(l^.datos.DNI)>2)then
           write(l^.datos.nombre, l^.datos.apellido);
end;

procedure borrarElem (var l:lista; dni:integer);
var
  act,ant:lista;
begin
    act:=l;
    while (act^.datos.DNI<>dni)do
       ant:=act;
    if (act<>nil)then begin
            if(act=l)then l:=act^.sig;
                     else ant^.sig:=act^.sig;
            dispose(act);
    end;
end;

var
  l:lista;
  t:tabla;
  dni:integer;
begin
  cargarTabla(t); {se dispone}
  cargarLista(l);
  read(dni);
  while (l<>nil)do begin
       InfoMontoComp(l,t);
       analisarDNI(l);
       borrarElem(l,dni);
  end;
end.
