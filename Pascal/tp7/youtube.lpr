{La plataforma YouTube está analizando algunos de sus principales canales de video. Para
ello, YouTube cuenta con una tabla con el nombre de las 60 categorías que utilizan para
clasificar los videos (Música, Educación y Ciencia, Hogar, Deportes, etc.).
De cada video se conoce su título, nombre del canal donde fue publicado, duración en
segundos, año de publicación, cantidad de visualizaciones y código de categoría a la que
pertenece el video (1..60).
Realizar un programa que:
A. Invoque a un módulo que lea la información de los videos hasta ingresar un video de
duración -1 ( que no debe procesarse) y devuelva en una estructura de datos adecuada,
para el canal “Paulina Cocina”, la siguiente información:
- Nombre del canal
- Año de publicación del video más reciente
- Cantidad de videos publicados
- Cantidad total de visualizaciones entre todos los videos.
- Detalle con Título, nombre de la categoría y duración de todos los videos con más de
1.000 visualizaciones
B. Invoque a un módulo que reciba la estructura generada en A) e imprima Nombre del
canal y el título de cada video con más de 1000 visualizaciones}

program youtube;
type
  cat=1..60;
  cadena=string[30];
  video=record
    titulo:cadena;
    nCanal:cadena;
    duracion:integer;
    ano:integer;
    visual:integer;
    codCat:cat;
  end;
 detalle=record
   tit:cadena;
   nCat:cadena;
   dura:integer;
 end;
 lista=^nodo;
 nodo=record
   d:detalle;
   sig:lista;
 end;

 estructura=record
   nombre:cadena;
   anoReciente:integer;
   cantPubli:integer;
   totalVisual:integer;
   info:lista;
 end;
 tabla=array[cat]of cadena;

procedure leerVideo(var v:video);
begin
  with v do begin
    read(titulo); read(nCanal);
    read(duracion); read(visual);
    read(codCat); read(ano);
  end;
end;
procedura inicializar(var e:estructura);
begin
  e.nombre:='Paulina Cocina';
  e.anoReciente:=9999;
  e.cantPubli:=0;
  e.totalVisual:=0;
  e.info:=nil;
end;
procedure agregarAdelante (var info:lista;v:video; t:tabla);
var
  nue:lista;
begin
   new(nue);
   nue^.d.tit:= v.titulo;
   nue^.d.nCat:= t[v.codCat];
   nue^.d.dura:= v.duracion;
   nue^.sig:=nue;
   nue:=info;
end;
procedure cargar(var e:estructura; v:video; t:tabla);
begin
  if (v.ano<e.anoReciente) then
    e.anoReciente:=v.ano;
  e.cantPubli:= e.cantPubli+1;
  e.cantVisual:=e.cantVisual+v.visual;
  if (v.visual>1000) then
    agregarAdelante(e.info,v,t);
  end;
procedure generarEstructura(var e:estructura; t:tabla);
var
  v:video;
begin
  incializar(e);
  leerVideo(v);
  while (v.duracion<> -1) do begin
     if (v.nCanal= 'Paulina Cocina') then
       cargar(e,v,t);
   leerVideo(v);
  end;
end;
procedure informar(e:estructura);
begin
  while(e.info<>nil) do begin
   write(e.nombre, e.info^.d.tit);
  end;
end;
var
  e:estructura;
  t:tabla;
begin
  cargarTabla(t); {se dispone}
   generarEstructura(e,t);
  informar(e);
end.

