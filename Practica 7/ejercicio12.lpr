{12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.}

program ejercicio12;

const
   dimF=4;
type
   v.costos=array[1..dimF]of real;

   v.contador=array[1..dimF]of integer;

   cadena20=string[20];

   cliente=record
      nombre:cadena20;
      dni:integer;
      edad:1..80;
      tipo:integer;
   end;

   lista=^nodo;

   nodo=record
       datos:cliente;
       sig:lista;
   end;

   nuevo.cliente:record
       nombre:cadena20;
       dni:integer;
   end;

   nuevaLista=^nodito;

   nodito=record
        info:nuevo.cliente;
        punt:nuevaLista;
   end;

  procedure cargarLista(var l:lista);

      procedure leerCliente(c:cliente);
      begin
         read(c.dni);
         if(c.dni<>0)then begin
               read(nombre); read(edad); read(tipo);
         end;
      end;

      procedure agregarAdelante(var l:lista; c:cliente);
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
    leerCliente(c);
    while(c.dni<>0)do begin
        agregarAdelante(l,c);
        leerCliente(c);
    end;
 end;

  procedure procesarInformacion(l:lista;var nueLista:nuevaLista;costos:v.costos; var total:real; var tipo1,tipo2:integer);

        procedure inicializarVector(var cont:v.contador);
         var
           j:integer;
         begin
            for j:=1 to dimF do
                  cont[j]:=0;
         end;

        procedure crearCliente(var cli:nuevo.cliente; nombre:cadena20;dni:integer);
        begin
           cli.nombre:=nombre;
           cli.dni:=dni;
        end;

        procedure agregarCliente(var nueLista:nuevaLista;cli:nuevo.cliente);
        var
          ant,act,nue:nuevaLista;
        begin
           new(nue);
           nue^.info:=cli;
           act:=nueLista;
           ant:=nueLista;
           while(act<>nil)and (act^.info.dni<cli.dni)do begin
                 ant:=act;
                 act:=act^.punt;
           end;
           if(ant<>nueLista)then nueLista:=nue;
                            else ant^.punt:=nue;
           nue^.punt:=nue;
        end;

        procedure recorrerVector(cont:v.contador; var tipo1,tip2:integer);
        var
          i,max1,max2:integer;
        begin
           max1:=-1;
           max2:=-1;
           for i:=1 to dimF do begin
                 if (cont[i]>max1)then begin
                          max2:=max1; tipo2:=tipo1;
                          max1:=cont[i];
                          tipo1:=i;
                 end else
                       if(cont[i]>max2)then begin
                                 max2:=cont[i];
                                 tipo2:=i;
                       end;
           end;
        end;

  var
    cont:v.contador;
    cli:nuevo.cliente;
  begin
     nueLista:=nil;
     total:=0;
     inicializarVector(cont);
     while(l<>nil)do begin
         total:=total+costos[l^.datos.tipo];
         cont[l^.datos.tipo]:= cont[l^.datos.tipo]+1;
         if (l^.datos.edad>40)and(l^.datos.tipo=3)or (l^.datos.tipo=4)then begin
             crearCliente(cli,l^.datos.nombre,l^.datos.dni);
             agregarCliente(nueLista,cli);
         end;
         l:=l^.sig;
     end;
     recorrerVector(cont,tipo1,tipo2);
  end;
var
  l:lista; nueLista:nuevaLista;
  costos:v.costos;
  cont:v.contador;
  total:real;
  tipo1,tipo2:integer;
begin
  l:=nil;
  cargarCostos(costos); {se dispone}
  cargarLista(l);
  procesarInformacion(l,nueLista,costos,total,tipo1,tipo2);
  write('La ganancia total del gimnasio fue de: ',total);
  write('Las dos suscripciones con mas clientes fueron: ',tipo1, tip02);
end.
