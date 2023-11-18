program tp7ej8;
type
  rango=1..7;
  dias=1..31;
  cadena=string[10];
  datos=record
    numOrigen:integer;
    DniOrigen:integer;
    numDestino:integer;
    DniDestino:integer;
    fecha:dias;
    hora:cadena;
    monto:real;
    motivo:rango;
  end;
lista=^nodo;
nodo=record
  trans:datos;
  sig:lista;
end;
procedure insertarOrdenado(var l:lista; d:datos);
var
  nue:lista;
  act,ant:lista;
begin
  new(nue);
  nue^.trans:=d;
  act:=l;
  ant:=l;
  while(act<>nil) and (d.numOrigen>l^.trans.numOrigen) do begin
   ant:=act;
   act:=act^.sig;
  end;
  if (act=ant)then
    l:=nue;
 else
  ant^.sig:=nue;
 nue^.sig:=act;
end;
function cumple(banc:lista):boolean;
var
  dni:integer,
begin
  dni:=banc^.trans.DniOrigen;
  cumple:= dni<>banc^.trans.DniDestino;
end;
procedure nuevaLista(var l:lista; banc:lista);
begin
  l:=nil;
  while (banc<>nil) do begin
  if (cumple(banc))then
    insertarOrdenado(l,banc^.trans);
  banc:=banc^.sig;
 end;
end;
procedure procesarNuevaLista(l:lista; var montoTotal:real; var codMax,cantTransf:integer);
var
  max:integer;
begin
  montoTotal:=0;
  cantTransf:=0;
  max:=0;
  while (l<>nil)do begin
  montoTotalTerceros(l,montoTotal);
  codMasTrans(l,codMax,max);

  l:=l^.sig;
end;

var
  montoTotal:real;
  codMax,cantTransf:integer;
  banc,l:lista;
begin
  cargarLista(banc); {se dispone}
  nuevaLista(l,banc);
  procesarNuevaLista(l,montoTotal,codMax,cantTransf);
  informar(montoTotal,codMax,cantTransf);
end.
