Procedure CARGAR ( var v: vector; var dimL: integer );
 var dato: integer;
begin
   dimL := 0;
   read (dato);
   while (dato <> 99)  and ( dimL < dimF ) do begin
          dimL := dimL + 1;
          v [dimL] := dato;
          read (dato);
   end;
End;


procedure LeerGuardarSumar 
      (var dat:vectorDatos; var dimL: rango;
        var sum: Real);

 Procedure leerAlumno (var alu:alumno);
 begin
  read (alu.nombre);
  if (alu.nombre <> ´Fulano´)
      then read (alu.nota);  
 end; 

var
   a : alumno;

begin
 sum := 0;
 dimL := 0; {dimensión  lógica}
 leerAlumno (a);  
 while (dimL < dimF) and (a.nombre <> ´Fulano´)
   do begin
     dimL := dimL + 1;
     dat[dimL]:= a;
     sum := sum + dat[dimL].nota; 
     leerAlumno (a);
   end
end;	
