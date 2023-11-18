{8. A partir de la estructura del ejer.1)
a) Generar otra estructura donde solo se almacenarán los aviones que cuentan don más de 200 asientos, en
el mismo orden en que aparecen en la estructura original.
b)  Generar otra estructura donde solo se almacenarán los aviones que cuentan don más de 200 asientos, en
orden inverso al que aparecen en la estructura original.
c) Eliminar todos los aviones de un modelo que se recibe como parámetro.}
program project1;

procedure agregarAlFinal(var nue,ult:lista;l:lista);
var
  aux:lista;
begin
  new(aux);
  aux^.elem:=l^.elem;
  aux^.sig:=nil;
  if(nue=nil)then
    nue:=aux;
  else
    ult^.sig:=aux;
  ult:=aux;
end;


procedure puntoA(var nue:lista;l:lista);
var
  ult:lista;
begin
  nue:=nil;
  while(l<>nil)and(l^.elem.cantAsientos>200)do begin
    agregarAlFinal(nue,ult,l);
    l:=l^.sig;
  end;
end;
procedure agregarAdelante(var lNue:lista; l:lista);
var
  aux:lista;
begin
  new(aux);
  aux^.elem:=l^.elem;
  aux^.sig:=l;
  lNue:=aux;
end;

procedure puntoB(var lNue:lista; l:lista);
begin
  lNue:=nil;
  while(l<>nil)and(l^.elem.cantAsientos>200)do begin
    agregarAdelante(lNue,l);
    l:=l^.sig;
  end;
end;



procedure puntoC(var l:lista; modelo:cadena);
var
  ant,act,pos:lista;
begin
   pos:=l;
   act:=l;
   while(pos<>nil)do begin

     while(act<>nil)and (act^.elem.modelo<>modelo)do begin
       ant:=act;
       act:=act^.sig;
       end;
     if(act<>nil)then begin
         if(act=l)then
            l:=act^.sig;
        else
          ant^.sig:=act^.sig;
        pos:=act;
        dispose(pos);
      end;
  end;
end;

var
  nue,lNue,l:lista;
  modelo:cadena;
begin
  cargarLista(l){se dispone}
  puntoA(nue,l);
  puntoB(lNue,l);
  read(modelo);
  puntoC(l,modelo);
end;

