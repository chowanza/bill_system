program Bill_System;
uses
   crt, dos, graph, sysutils;
var
  PathToDriver: string;
  GraphicsDriver, GraphicsMode: smallint;
  Year, Month, Day, WDay: word;
  num1, num2, num3, num4, num5, num6, num7, num8, num9, num10: integer;
  final, finaltotal, totalpan, totalarr, totalcar, imprimir, totaljam, totalque, totalcer, totallec, totaljug, totalhue, totalpol, prodvendidos, ID, contf, contp, facturar: integer;
  submasiva, subtotal, total: real;
  h, mm, s, ns : word;
  producto, nombre, cajero, direccion: string;

const
  DayStr: array[0..6] of string[3]= ('Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab');
  MonthStr: array[1..12] of string[3]= ('Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic');
  PAN = 5; ARR = 8; CAR = 18; JAM = 20; QUE = 25; CER = 12; LEC = 15; JUG = 10; HUE = 20; POL = 25;
  IVA = 0.16;
procedure grafico;
begin
  GraphicsDriver:=Detect;
  InitGraph(GraphicsDriver, GraphicsMode, '0');
end;
procedure grafico2;
begin
  GraphicsDriver:=Detect;
  InitGraph(GraphicsDriver, GraphicsMode, '0');
end;
procedure clearscreen;
begin
  ClearDevice;
end;
procedure rectangulo1;
begin
     setlinestyle(DashedLn, 0, ThickWidth);
     SetColor(RED);
     rectangle(20, 100, 580, 20);
     setlinestyle(DashedLn, 0, NormWidth);
     line(1100, 52, 1400, 52);
end;
procedure rectangulo2;
begin
     setlinestyle(DashedLn, 0, ThickWidth);
     SetColor(RED);
     rectangle(1100, 370, 1500, 150);
end;
procedure rectangulo3;
begin
     setlinestyle(DashedLn, 0, NormWidth);
     SetColor(CYAN);
     rectangle(10, 170, 1050, 580);
end;
procedure rectangulo4;
begin
      SetColor(CYAN);
      rectangle(10, 170, 1050, 210);
end;
procedure rectangulo5;
begin
      SetColor(CYAN);
      rectangle(10, 170, 270, 580);
end;
procedure rectangulo6;
begin
     SetColor(CYAN);
     rectangle(10, 170, 480, 580);
end;
procedure rectangulo7;
begin
     SetColor(CYAN);
     rectangle(10, 170, 740, 580);
end;
procedure rectangulo8;
begin
     setlinestyle(SolidLn, 0, ThickWidth);
     SetColor(RED);
     rectangle(480, 580, 1050, 700);
end;
procedure rectangulo9;
begin
     SetColor(RED);
     rectangle(480, 620, 1050, 700);
end;
procedure rectangulo10;
begin
     SetColor(RED);
     rectangle(480, 660, 1050, 700);
     line(710, 580, 710, 700);
end;
procedure circulo1;
begin
     SetColor(GREEN);
     CIRCLE(1220,550, 120);
end;
procedure productos;
begin
     Settextstyle(0,0,3);
     SetColor(WHITE);
     Outtextxy(20, 180, 'PRODUCTO:');
     Outtextxy(500, 180, 'CANTIDAD:');
     Outtextxy(300, 180, 'P.U.:');
     Outtextxy(770, 180, 'PRECIO:');
     Outtextxy(500, 590, 'SUBTOTAL:');
     Outtextxy(500, 630, 'IVA:');
     Outtextxy(500, 673, 'TOTAL:');
end;
procedure titulo;
 begin
      SetTextStyle(0,0,6);
      setcolor(WHITE);
      Outtextxy(40, 40, 'BILL SYSTEM');
 end;
procedure fecha;
begin
     GetDate(Year, Month, Day, WDay);
     SetTextStyle(0,0,2);
     Outtextxy(1120, 10, 'HOY ES:');
     SetTextStyle(0,0,1);
     Outtextxy(1120, 30, DayStr[WDay]);
     Outtextxy(1145, 30, ',');
     outtextxy(1152,30,(IntToStr(Day)));
     Outtextxy(1170, 30, MonthStr[Month]);
     outtextxy(1197,30,(IntToStr(Year)));
     Outtextxy(1120, 40, 'ES UN BUEN DIA PARA VENDER!');
end;
procedure hora;
begin
     gettime(h,mm,s,ns);
     SetTextStyle(0,0,2);
     Outtextxy(1120, 60, 'HORA:');
     SetTextStyle(0,0,1);
     Outtextxy(1120, 80, (IntToStr(h)));
     Outtextxy(1145, 80, ':');
     Outtextxy(1152, 80, (IntToStr(mm)));
     Outtextxy(1170, 80, ':');
     Outtextxy(1197, 80, (IntToStr(s)));
     Outtextxy(1120, 90, 'ES MUY BUENA HORA PARA VENDER!');

end;
procedure subtitulo;
begin
     SetTextStyle(0,0,3);
     Outtextxy(650, 30, 'TIENDAS');
     SettextStyle(0,0,5);
     SetColor(GREEN);
     OutTextxy(670, 56, 'EL CAMPO');
end;
procedure codigos;
 begin
      SetTextStyle(0,0,2);
      setcolor(WHITE);
      Outtextxy(1100, 130, 'CODIGOS');
      Outtextxy(1215, 130, 'PRODUCTOS:');
      Outtextxy(1115, 160, 'PAN: Harina Pan');
      Outtextxy(1115, 180, 'ARR: Arroz');
      Outtextxy(1115, 200, 'CAR: Carne');
      Outtextxy(1115, 220, 'JAM: Jamon');
      Outtextxy(1115, 240, 'QUE: Queso');
      Outtextxy(1115, 260, 'CER: Cereal');
      Outtextxy(1115, 280, 'LEC: Leche');
      Outtextxy(1115, 300, 'JUG: Jugo');
      Outtextxy(1115, 320, 'HUE: Huevos');
      Outtextxy(1115, 340, 'POL: Pollo');
 end;
procedure sonido;
begin
     sound (820);
     delay(10);
     nosound;
end;
begin
  repeat
       begin
     contf:=1;
     contp:=0;
     grafico;
     hora;
     fecha;
     circulo1;
     Settextstyle(0,0,1);
     SetColor(WHITE);
     Outtextxy(900, 96, 'J-30874757-4');
     Settextstyle(0,0,10);
     SetColor(WHITE);
     Outtextxy(1125, 500, 'B');
     Outtextxy(1215, 550, 'S');
     titulo;
     subtitulo;
     SetLineStyle(0, 0, 7);
     Outtextxy(550, 600, '0:= FACTURAR');
     rectangulo1;
     setlinestyle(DashedLn, 0, ThickWidth);
     line(400, 140, 400, 500);
     SetColor(WHITE);
     SetTextStyle(0,0,3);
     outtextxy(40, 160, 'CAJERO:');
     outtextxy(40, 220, 'CLIENTE:');
     outtextxy(40, 280, 'DIRECCION:');
     outtextxy(40, 340, 'ID:');
     SetColor(CYAN);
     writeln('Ingrese nombre del Cajero(a):');
     readln(cajero);
     outtextxy(550, 160, cajero);
     Writeln('Ingrese Nombre del Cliente:');
     readln(nombre);
     outtextxy(550, 220, nombre);
     Writeln('Ingrese Direccion del Cliente:');
     readln(direccion);
     outtextxy(520, 280, direccion);
     Writeln('Ingrese ID del Cliente:');
     readln(ID);
     outtextxy(550, 340, inttostr(ID));
     writeln('PRESIONA 0');
     read(facturar);
      if facturar<>0 then
      begin
       writeln('PRESIONA 0');
       read(facturar);
      end
      else
     if facturar=0 then
     clearscreen;
     grafico2;
     fecha;
     sonido;
     rectangulo1;
     rectangulo2;
     rectangulo3;
     rectangulo4;
     rectangulo5;
     rectangulo6;
     rectangulo7;
     rectangulo8;
     rectangulo9;
     rectangulo10;
     Setcolor(CYAN);
     setlinestyle(DashedLn, 0, ThickWidth);
     line(1090, 420, 1090, 540);
     SetTextStyle(0,0,5);
     Outtextxy(500,125, 'FACTURA...');
     titulo;
     subtitulo;
     Outtextxy(30, 620, '8. IMPRIMIR');
     codigos;
     hora;
     productos;
     writeln('Ingrese Codigo Producto:');
     readln(producto);
        repeat
              if (producto = 'PAN') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 220, 'Harina Pan');
                   Outtextxy(300, 220, '5');
                   write('Ingrese Cantidad:');
                   read(num1);
                   Outtextxy(500, 220, inttostr(num1));
                   totalpan:=PAN*num1;
                   Outtextxy(770, 220, inttostr(totalpan));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
              if (producto = 'ARR') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 250, 'Arroz');
                   Outtextxy(300, 250, '8');
                   write('Ingrese Cantidad:');
                   read(num2);
                   Outtextxy(500, 250, inttostr(num2));
                   totalarr:=ARR*num2;
                   Outtextxy(770, 250, inttostr(totalarr));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
              if (producto = 'CAR') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 280, 'Carne');
                   Outtextxy(300, 280, '18');
                   write('Ingrese Cantidad:');
                   read(num3);
                   Outtextxy(500, 280, inttostr(num3));
                   totalcar:=CAR*num3;
                   Outtextxy(770, 280, inttostr(totalcar));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
              if (producto = 'JAM') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 310, 'Jamon');
                   Outtextxy(300, 310, '20');
                   write('Ingrese Cantidad:');
                   read(num4);
                   Outtextxy(500, 310, inttostr(num4));
                   totaljam:=JAM*num4;
                   Outtextxy(770, 310, inttostr(totaljam));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
              if (producto = 'QUE') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 340, 'Queso');
                   Outtextxy(300, 340, '25');
                   write('Ingrese Cantidad:');
                   read(num5);
                   Outtextxy(500, 340, inttostr(num5));
                   totalque:=QUE*num5;
                   Outtextxy(770, 340, inttostr(totalque));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
              if (producto = 'CER') then
              begin
                   contp:=contp+1;
                   Outtextxy(20, 370, 'Cereal');
                   Outtextxy(300, 370, '12');
                   write('Ingrese Cantidad:');
                   read(num6);
                   Outtextxy(500, 370, inttostr(num6));
                   totalcer:=CER*num6;
                   Outtextxy(770, 370, inttostr(totalcer));
                   writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                   read(final);
              end;
               if (producto = 'LEC') then
               begin
                    contp:=contp+1;
                    Outtextxy(20, 400, 'Leche');
                    Outtextxy(300, 400, '15');
                    write('Ingrese Cantidad:');
                    read(num7);
                    Outtextxy(500, 400, inttostr(num7));
                    totallec:=LEC*num7;
                    Outtextxy(770, 400, inttostr(totallec));
                    writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                    read(final);
               end;
                if (producto = 'JUG') then
                begin
                     contp:=contp+1;
                     Outtextxy(20, 430, 'Jugo');
                     Outtextxy(300, 430, '10');
                     write('Ingrese Cantidad:');
                     read(num8);
                     Outtextxy(500, 430, inttostr(num8));
                     totaljug:=JUG*num8;
                     Outtextxy(770, 430, inttostr(totaljug));
                     writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                     read(final);
                end;
                if (producto = 'HUE') then
                begin
                     contp:=contp+1;
                     Outtextxy(20, 460, 'Huevo');
                     Outtextxy(300, 460, '20');
                     write('Ingrese Cantidad:');
                      read(num9);
                      Outtextxy(500, 460, inttostr(num9));
                      totalhue:=HUE*num9;
                      Outtextxy(770, 460, inttostr(totalhue));
                      writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                      read(final);
                end;
                if (producto = 'POL') then
                begin
                     contp:=contp+1;
                     Outtextxy(20, 490, 'Pollo');
                     Outtextxy(300, 490, '25');
                     write('Ingrese Cantidad:');
                     read(num10);
                     Outtextxy(500, 490, inttostr(num10));
                     totalpol:=POL*num10;
                     Outtextxy(770, 490, inttostr(totalpol));
                     writeln('Agregar otro producto o finalizar compra. Presione 1 o 2:');
                     read(final);
                end;
                if final=1 then
                     writeln('Ingrese Codigo Producto:');
                     readln(producto);

        until final=2 ;
      prodvendidos:=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10;
      subtotal:=totalpan+totalarr+totalcar+totaljam+totalque+totalcer+totallec+totaljug+totalhue+totalpol;
      Outtextxy(770, 590, floattostr(subtotal));
      submasiva:=subtotal*IVA;
      Outtextxy(770, 630, floattostr(submasiva));
      total:=submasiva+subtotal;
      Outtextxy(770, 662, floattostr(total));
      writeln('PRESIONE 8 PARA IMPRIMIR');
      read(imprimir);
       if imprimir<>8 then
      begin
       writeln('PRESIONA 8!');
       read(imprimir);
      end
       else
       if imprimir=8 then
       begin
          Setcolor(WHITE);
          SetTextStyle(0,0,1);
          outtextxy(1100, 420, 'CAJERO:');
          outtextxy(1210, 420, cajero);
          outtextxy(1100, 440, 'CLIENTE:');
          outtextxy(1210, 440, nombre);
          outtextxy(1100, 460, 'DIRECCION:');
          outtextxy(1210, 460, direccion);
          outtextxy(1100, 480, 'ID:');
          outtextxy(1210, 480, inttostr(ID));
          outtextxy(1100, 500, 'NUM FACT:');
          outtextxy(1210, 500, inttostr(contf));
          outtextxy(1100, 520, 'CANT ART:');
          outtextxy(1210, 520, inttostr(contp));
          outtextxy(1100, 540, 'PROD VEND:');
          outtextxy(1210, 540, inttostr(prodvendidos));
       Writeln('FACTURAR DE NUEVO? 1 SI / 2 NO:');
       readln(finaltotal);
       contf:=contf+1;
       end;
       end;
     until (finaltotal=2);
  readkey;
end.


