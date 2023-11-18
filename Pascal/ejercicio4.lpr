4_a) procedure posicion (v:vector;var pos,numX:integer);
     var
       dimL:integer;
     begin
       dimL:=1;
       while (numX<> v[dimL]) do begin
         if (numX=v[dimL] then
           pos:=dimL;
           dimL:=dimL+1;
         else
           pos:=-1;
           dimL:=dimL+1;
       end;

b) procedure intercambio (var v:vector;X,Y:integer);
   var
     i,aux:integer;
   begin
     aux:=v[x];
     v[x]:=v[y];
     v[y]:=aux;


c) procedure sumaVector(v:vector;dimL:integer; var suma:integer);
   var
     i:integer;
   begin
     for i:=1 to dimL do begin
       suma:=suma+ v[i];
     end;
   end;

d) procedure promedio (v:vector;var prom:real;dimL:integer);
   var
     i,suma:integer;
   begin
     suma:=0;
     for i:=1 to dimL do begin
       suma:= suma+ v[1];
     end;
     prom.=suma/dimL;
   end;

e)procedure elementoMax (v:vector;var posMaX:integer,dimL:integer);
  var
    max,i:integer;
  begin
    max:=0;
    for i:=1 to dimL do begin
      if(v[i]>max) then begin
        max:=v[i];
        posMax:=i;
      end;
    end;
  end;

f) procedure elementoMin (v:vector; var posMin:integer;dimL:integer);
   var
     min,i:integer;
   begin
     min:=9999;
     for i:=1 to dimL do begin
       if (v[i]<min) then begin
         min:=v[i];
         posMin:=i;
       end;
     end;
   end;















