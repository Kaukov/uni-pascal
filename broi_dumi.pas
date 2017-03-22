program countWords;

procedure enterString(var str : String);
  begin
    WriteLn('Enter message: ');
    ReadLn(str);
  end;

{ Count Words }
function countWordsFunc(str : String):Integer;
var
  i : Integer;
  counter : Integer;

begin
  counter := 0;

  for i := 1 to length(str) - 1 do begin // obhojdam dumata po simvoli
    if (str[i] = ' ') or (str[i] = ',') or (str[i] = '.') then begin // ako imame simvol za razdelqne na duma, deistvame

      if (str[i + 1] <> ' ') and (str[i + 1] <> ',') and (str[i + 1] <> '.') then begin // ako sledvashtiq simvol e razlichen ot nastoqshtiq, znachi imame duma
        counter := counter + 1;
      end;
    end;

    if i = length(str) - 1 then begin // ako sme nakraq na izrechenieto, broim poslednata duma
      counter := counter + 1;
    end;
  end;

  countWordsFunc := counter;
end;

procedure countWordsProc(str : String);
var
  i : Integer;
  counter : Integer;

begin
  counter := 0;

  for i := 1 to length(str) - 1 do begin // obhojdam dumata po simvoli
    if (str[i] = ' ') or (str[i] = ',') or (str[i] = '.') then begin // ako imame simvol za razdelqne na duma, deistvame

      if (str[i + 1] <> ' ') and (str[i + 1] <> ',') and (str[i + 1] <> '.') then begin // ako sledvashtiq simvol e razlichen ot nastoqshtiq, znachi imame duma
        counter := counter + 1;
      end;
    end;

    if i = length(str) - 1 then begin // ako sme nakraq na izrechenieto, broim poslednata duma
      counter := counter + 1;
    end;
  end;

  WriteLn('Broi dumi: ', counter);
end;
{ End Count Words }

{ Count Integers }
procedure countIntegersProc(str : String);
var
  i, code, j, counter : Integer;

begin
  counter := 0;

  for i := 1 to length(str) do begin
    val(str[i], j, code);

    if code = 0 then begin
      counter := counter + 1;
    end;
  end;

  WriteLn('Broi cifri: ', counter);
end;

function countIntegersFunc(str : String):Integer;
var
  i, code, j, counter : Integer;

begin
  counter := 0;

  for i := 1 to length(str) do begin
    val(str[i], j, code);

    if code = 0 then begin
      counter := counter + 1;
    end;
  end;

  countIntegersFunc := counter;
end;
{ End Count Integers }

{ LowerCase Letters }
procedure lowerCaseProc(str : String);
begin
  WriteLn(LowerCase(str));
end;

function lowerCaseFunc(str : String):String;
begin
  lowerCaseFunc := LowerCase(str);
end;

{ End LowerCase Letters }

var
  duma : String;
  // broiDumi : Integer;
  // broiCifri : Integer;
  // malkiBukvi : String;

begin
  enterString(duma);

  countWordsProc(duma);

  // broiDumi := countWordsFunc(duma);
  //
  // WriteLn('Broi dumi: ', broiDumi);

  countIntegersProc(duma);

  // broiCifri := countIntegersFunc(duma);
  // WriteLn('Broi cifri: ', broiCifri);

  lowerCaseProc(duma);

  // malkiBukvi := lowerCaseFunc(duma);
  // WriteLn(malkiBukvi);
end.
