program tp7ej3;
type
  cadena:string[30];
  datos=record
    numViaje:integer;
    codAuto:integer;
    dirOrigen:cadena;
    dirDestino:cadena;
    kts:real;
  end;
  lista=^nodo;
  nodo=record
    viaje:datos;
    sig:lista;
  end;
procedure maximo(var max1,max2:real; var cod1,cod2:integer; remiseria:lista);
begin
 if (remiseria^.vieje.kts>max1) then begin
       max2:=max1;
       cod2:=cod1;
       max1:=remiseria^.vieje.kts;
       cod1:=remiseria^.viaje.codAuto;
    else
     if (remiseria^.vieje.kts>max2) then begin
      max2:=remiseria^.vieje.kts;
      cod2:=remiseria^.vieje.codAuto;
     end;
   end;
 end;
procedure agregarOrdenado(var pri,l:lista; v:datos);
var
  nue:lista;
begin
 new(nue);
 nue^.viaje:=v;
 nue^.sig:=nil;
 if (pri<>nil) then
   l^.sig:=nue;
 else
 pri:=nue;
 l:=nue;
end;
procedure procesarLista(remiseria:lista,var l:lista);
var
  max1,max2,ktsAutoAct:real;
  cod1,cod2,codAct:integer;
  pri:lista;
begin
  l:=nil;
  pri:=nil;
  max1:=-1;
  max2:=-1;
  while (remiseria<>nil)do begin
   codAct:= remiseria^.vieje.codAuto;
   ktsAutoAct:=0;
   while(remiseria^.vieje.codAuto=codAct) and (remiseria<>nil) do begin
    ktsAutoAct:= ktsAutoAct+remiseria^.vieje.kts;
    if (ktsAutoAct>5) then
      agregarOrdenado(pri,l,remiseria^.vieje);
   end;
   maximo(max1,max2,cod1,cod2,remiseria);
   remiseria:= remiseria^.sig;
  end;
  writeln(cod1,cod2);
end;
var
  remiseria,l:lista;
begin
  cargarLista(remiseria); {se dispone}
  procesarLista(remiseria,l);

end;

