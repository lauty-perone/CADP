program maxlista;
type
  lista=^nodo;
  nodo= record
    valor:integer;
    sig:lista;
  end;
procedure cargarLista(var l:lista;num:integer);
 var nue:lista;
 begin
   new(nue);
   nue^.valor:=num;
   nue^.sig:=l;
   l:=nue;
 end;
{ procedure maximo(l:lista; var max:integer);
 var aux:lista;
  begin
   new(aux);
   aux:=l;
   while(aux^.sig<>nil) do begin
    if (aux^.valor> max) then begin
      max:= aux^.valor;
      aux:=aux^.sig;
    end;
   end;
  end;}
procedure minimo(l:lista;var min:integer);
var nue:lista;
begin
 new(nue);
 nue:=l;
 while (nue^.sig<>nil) do begin
  if (nue^.valor<min)then begin
    min:=nue^.valor;
    nue:=nue^.sig;
  end;
 end;
end;

var
l:lista;
max,num,min:integer;
begin
 l:=nil;
 min:=9999;
 max:=-1;
 write('Escriba un num: ');
 readln(num);
 while (num<>0) do begin
    cargarLista(l,num);
    write('Escriba un num: ');
    readln(num);
 end;
{ maximo(l,max);}
 minimo(l,min);
 writeln( 'El maximo es: ', max);
 writeln('El minimo es: ',min);
 readln;
 readln;
end.

