program tp7ej7;
type
 materias=24;
 cadena=string[30];
 tabla=array[1..materias]of real;
 datos=record
   numAlum:integer;
   apellido:cadena;
   nombres:cadena;
   correo:cadena;
   ingreso:integer;
   egreso:integer;
   notas:tabla;
 end;
 lista=^nodo;
 nodo=record
   alumno:datos;
   sig:lista;
 end;
 function buscarPos(num:real;notas:tabla):integer;
 var
   p:integer; exito:boolean;
 begin
  p:=1;
  exito:=false;
  while(p<=materias) and (not exito) do begin
   if (num>notas[p])then
      exito:=true
   else
     pos:=pos+;
   if (exito=false)then
       pos:=0;
  buscarPos:=pos;
 end;
 procedure insertar(var notas:tabla;pos:integer;num:real);
 var j:integer;
 begin
  for j:= materias downto pos do begin
   notas[j+1]:=notas[j];
   notas[pos]:= num;
 end;
end;

 procedure cargarNotas(var notas:tabla);
 var
   i:integer;
   num:real;
 begin
  for i:=1 to materias do begin
   readln(num);
   pos:=buscarPos(num,notas);
   insertar(notas,pos,num);
  end;
end;
 procedure leerAlumno(var d:datos);
 begin
   with d do begin
     readln(numAlum);readln(apellido);readln(nombres);
     readln(correo);readln(ingreso);readln(egreso);
   end;
 cargarNotas(d.notas);
 end;

 procedure agregarAdelante(var l:lista; d:datos);
 var
   nue:lista;
 begin
  new(nue);
  nue^.alumno:=d;
  nue^.sig:=l;
  l:=nue;
 end;

 procedure cargarLista(var l:lista);
 var
   d:datos;
 begin
  l:=nil;
  leerAlumno(d);
  while(d.numAlum<>-1)do begin
    agregarAdelante(l,d);
    leerAlumno(d);
  end;
 end;
 function calcular(notas:tabla;prom:real):real;
 var
   rec:integer;
   suma:real;
 begin
  suma:=0;
  for rec:=1 to materias do begin
   suma:=suma+ notas[rec];
  end;
  prom:= suma/materias;
 end;
 procedure promedioNotas(l:lista);
 var
   prom:real;
 begin
  write('el promedio del alumno num: ',l^.alumnos.numAlum,' es: ',(calcular(l^.alumno.notas,prom));
 end;
 function impar(cod:integer):boolean;
 var
   si:boolean;dig:integer;
 begin
  si:=false;
  dig:=cod mod 10;
  cod:=cod div 10;
  while (cod<>0) and (dig mod 2<>0) do begin
   dig:=cod mod 10;
   cod:=cod div 10;
  end;
  if (cod=0) then
      si:=true;
  impar:=si;
 end;

 procedure digImp(l:lista; var cantA:integer);
 var
 begin
  if (l^.alumno.ingreso=2012) and (impar(l^.alumno.numAlum))then
      cantA:=cantA+1;
 end;
 procedure minimos(l:lista; var min1,min2:integer;var ap1,ap2,nom1,nom2,cor1,cor2:cadena);
 diferencia:integer;
 begin
   diferencia:=l^.alumno.egreso-l^.alumno.ingreso;
   if (diferencia<min1)then begin
     min2:=min1;
     ap2:=ap1;nom2:=nom1; cor2:=cor1;
     min1:=diferencia;
     ap1:=l^.alumno.apellido;
     nom1:=l^.alumno.nombres;
     cor1:=l^.alumno.correo;
     end
   else
    if (diferencia<min2) then begin
     min2:=diferencia;
     ap2:=l^.alumno.apellido;
     nom2:=l^.alumno.nombres;
     cor2:=l^.alumno.correo;
    end;
 end;


 procedure procesarLista(l:lista; var cantA:integer;var ap1,nom1,cor1,ap2,nom2,cor2:cadena);
 var
   min1,min2:integer;
 begin
  cantA:=0;
  min1:=1000;
  min2:=1000;
  while (l<>nil)do begin
    promedioNotas(l);
    digImp(l,cantA);
    minimos(l,min1,min2,ap1,ap2,nom1,nom2,cor1,cor2);
   l:=l^.sig;
  end;
 end,
 procedure borrarAlumno(var l:lista;var cumple:boolean);
 var
   ant,act:lista;
   numA:integer;
 begin
  readln(numA);
  cumple:=false;
  act:=l;
  while (act<>nil) and (act^.alumno.numAlum<>numA) do begin+
    ant:=act;
   act:=act^.sig;
  end;
  if (act<>nil)then begin
   cumple:=true;
   if (act=ant)then l:=act^.sig;
   else ant^.sig:=act^.sig;
   end;
 end;
 procedure informar(cantA:integer; ap1,nom1,cor1,ap2,nom2,cor2:cadena; cumple:boolean);
 begin
  write(cantA);
  write(ap1,nom1,cor1, ap2,nom2,cor2);
  if (cumple)then
      write('EL ALUMNO FUE BORRADO CORRECTAMENTE');
  else
   write('EL ALUMNO NO EXISTE');
 end;
 var
   cantA:integer;
   cumple:boolean;
   l:lista;
   ap1,nom1,cor1,ap2,nom2,cor2:cadena;
 begin
  cargarLista(l);
  procesarLista(l,cantA,ap1,nom1,cor1,ap2,nom2,cor2);
  borrarAlumno(l,cumple);
  informar(cantA,ap1,nom1,cor1,ap2,nom2,cor2,cumple);
end.


