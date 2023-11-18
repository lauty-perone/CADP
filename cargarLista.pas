procedure cargarLista(var L:lista);
var
	j: jugador;
Begin
	leerJugador(j); {lee un registro de jugador}
	while(j.dni <> 0) do begin
		agregarAdelante(L, j);
		leerJugador(j);
	end;
end;

procedure cargarLista(var L:lista);
var
	j: jugador; ULT: lista;
Begin
	leerJugador(j);
	while(j.dni <> 0) do begin
		agregarAtras(L, ULT, j);
		leerJugador(j);
	end;
end;

procedure agregarAtras(var L, ULT:lista; j:jugador);
var
	nue: lista;
begin
	new (nue); {Creo un nodo}
	nue^.dato := j; {Cargo el dato}
	nue^.sig := nil; {Inicializo enlace en nil}
	if( L = nil) then {Si la lista está vacía}
		L:= nue {Actualizo el inicio}
	else {Si la lista no está vacía}
		ULT^.sig := nue; {Realizo enlace con el último}
	ULT := nue; {Actualizo el último}
end;
