{13. La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas}

program ejercicio13;
const
  dimF=35;
type
  cadena20=string[20];

  libro=record
      titulo:cadena20;
      editorial:cadena20;
      paginas:integer;
      añoEdicion:integer;
      cantVendido:integer;
      codArea:1..dimF;
  end;

  tabla=array[1..dimF]of cadena20;

  detalle=record
        titulo:cadena20;
        area:cadena20;
        cantPaginas:integer;
  end;

  lista=^nodo;

  nodo=record
        datos:detalle;
        sig:lista;
  end;

  planetaLibros=record
         editorial:cadena20;
         libroAntiguo:integer;
         editados:integer;
         totalVentas:integer;
         det:lista;
  end;

procedure generarEstructura(var info:planetaLibros; t:tabla);

    procedure inicializarEstruc(var info:planetaLibros);
    begin
      info.editorial:='Planeta Libros';
      info.det:=nil;
      info.editados:=0;
      info.totalVentas:=0;
      info.libroAntiguo:=9999;
    end;

    procedure leerLibro(var l:libro);
    begin
      with l do begin
          read(titulo), read(editorial); read(paginas);
          read(añoEdicion); read(cantVendido); read(codArea);
      end;
    end;

    procedure masAntiguo(edici:integer;var ant,min:integer);
    begin
       if(edici<ant)then begin
             ant:=edici;
       end;
    end;

    procedure crearDetalle(var d:detalle;pags:integer;tit,area:cadena20);
    begin
      d.titulo:=tit;
      d.area:=area;
      d.cantPaginas:=pags;
    end;

    procedure agregarDetalle(var det:lista;d:detalle);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos:=d;
        nue^.sig:=det;
        det:=nue;
    end;

var
  l:libro;d:detalle;
 begin
   inicialiarEstruc(info);
   repeat
     leerLibro(l);
     if(l.editorial='Planeta Libros')then begin
            masAntiguo(l.añoEdicion,info.libroAntiguo);
            info.editados:=info.editados+1;
            info.totalVentas:=info.totalVentas+l.cantVendido;
            if (l.cantVendidos>250)then begin
                          crearDetalle(d,l.paginas,l.titulo,t[l.codArea]);
                          agregarDetalle(info.det,d);
     end;
     until(l.titulo='Relato de un naúfrago');
 end;

procedure incisoB(edit:cadena20; det:lista);
begin
   write('El nombre de la editorial es: ',edit);
   while(det<>nil)do begin
       write('El nombre de este libro tiene más de 250 paginas y es: ',det^.datos.titulo);
       det:=det^.sig;
   end;
end;

var
  t:tabla;
  info:planetaLibros;

begin
  cargarTabla(t);{se dispone}
  generarEstructura(info,t);
  incisoB(info.editorial,info.det);
end.










