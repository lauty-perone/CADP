{11. La plataforma YouTube está analizando algunos de sus principales canales de video. Para ello, YouTube cuenta con una tabla con el nombre
de las 60 categorías que utilizan para clasificar los videos (Música, Educación y Ciencia, Hogar, Deportes, etc.).
De cada video se conoce su título, nombre del canal donde fue publicado, duración en segundos, año de publicación, cantidad de visualizaciones y
código de categoría a la que pertenece el video (1..60).
Realizar un programa que:
A. Invoque a un módulo que lea la información de los videos hasta ingresar un video de duración -1 (que no debe procesarse) y
devuelva en una estructura de datos adecuada, para el canal “Paulina Cocina”, la siguiente información:
- Nombre del canal
- Año de publicación del video más reciente
- Cantidad de videos publicados
- Cantidad total de visualizaciones entre todos los videos.
- Detalle con Título, nombre de la categoría y duración de todos los videos con más de 1.000 visualizaciones
B. Invoque a un módulo que reciba la estructura generada en A) e imprima Nombre del canal y el título de cada video con más de 1000 visualizaciones.}

program ejercicio11LautaroPerone;
 type
  cadena25=string[25];
  tabla=array [1..60]to cadena25;
  video=record
    titulo:cadena25;
    canal:cadena25;
    duracion:integer;
    año:integer;
    cantVisual:integer;
    cod:1..60;
  end;

  info=record
    titulo:cadena25;
    categoria:cadena25;
    duracion:integer;
  end;

  lista=^nodo;
  nodo=record
    dato:info;
    sig:lista;
  end;

  estructura=record
    nombreC:cadena25;
    añoReciente:integer;
    cantVideos:integer;
    totalVisual:integer;
    detalle:lista;
  end;

procedure cargarEstructura(var e:estructura; t:tabla);
 procedure leerVideo(var v:video);
    begin
      with v do begin
        read(titulo);read(canal);
        read(duracion);read(año);
        read(cantVisual);read(cod);
      end;
    end;

 procedure agregarAdelante(var detalle:lista; v:video; t:tabla);
 var
   nue:lista;
 begin
      new(nue);
      nue^.dato.titulo:=v.titulo;
      nue^.dato.categoria:=t[v.cod];
      nue^.dato.duracion:=v.duracion;
      nue^.sig:=detalle;
      detalle:=nue;
 end;

 var
   v:video;
   max:integer;
 begin
   e.detalle:=nil;
   e.nombreC:='Paulina Cocina';
   max:=-1;
   e.cantVideos:=0;
   e.totalVisual:=0;
   leerVideo(v);
      while(v.duracion<>-1)do begin
          if(v.canal='Paulina Cocina')then begin
             if(v.año>max)then
               max:=v.año;
             e.cantVideos:=e.cantVideos+1;
             e.totalVisual:=e.totalVisual+ v.cantVisual;
            if(v.cantVisual>1000)then
              agregarAdelante(e.detalle,v,t);
          end;
          leerVideo(v);
      end;
   e.añoReciente:=max;
  end;

  procedure puntoB(e:estructura);
     begin
      while(e.detalle<>nil)do begin
          write('El nombre del canal es: ',e.nombreC);
          write('El titulo del video es: ', e.detalle^.dato.titulo);
      end;
  end;




 var
   t:Tabla;
   e:Estructura;
 begin
   cargarTabla(t);{se dispone}
   cargarEstructura(e,t);
   puntoB(e);
 end;


