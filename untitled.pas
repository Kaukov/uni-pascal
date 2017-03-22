program Project1;

const
  N=10;

type
  masiv = array[1..N] of integer;
  fnIn = Text;

procedure fileInput(var fIn: fnIn);

var
  fName: string;
  begin
  writeLn('Enter the name of file');
  readln(fName);

   Assign (fIn, fName);

  end;

procedure fillArray(var arr: masiv; var fIn: fnIn); // podavame promenliva ot tip masiv
                                                     //   i fajlova promenliva,
                                                     //ot koqto wzimame elementi  da zapylni masiva

var
  i: integer;

  begin
   reset(fIn);      //otwarqm faila samo za chetene

   for i := 1 to N do begin
     readln(fIn, arr[i]);

   end;
   Close(fIn);
  end;


function IsSorted(arr: masiv):boolean;
var
  i : integer;
  result : boolean;

  begin
   result := true;
    for i:=1 to N-1 do begin
     if arr[i] < arr[i+1] then begin
       result:= false;
       break;
     end;
    IsSorted := result;
   end;
  end;

function Tripple (arr: masiv): integer;
var
  i,j,k: integer;
  counter: integer;

     begin
      counter:= 0;   //kazvam da e nula, zashtoto ne znam dali ima troiki
      for i:=1 to N-2 do begin
        for j:= i+1 to N-1 do begin
         for k:= j+1  to N do begin
          if (arr[i] = arr[j]) and (arr[j] = arr[k]) then begin
            counter:= counter+1;
          end;
         end;
        end;
      end;
       Tripple:= counter;
     end;

//glavna programa
var
  fIn: fnIn;
  arr: masiv;
  sorted: boolean;
  trip: integer;

begin
  fileInput(fIn);
  fillArray(arr, fIn);
  sorted:= IsSorted(arr);
  trip:= Tripple(arr);
  if sorted = true then begin
    writeln('Array is sorted');
  end
   else begin
    writeln('Array is not sorted');
   end;

   if trip > 0 then begin
        writeln('There is',trip,'tripples');
   end
   else begin
    writeln('No tripples');
    end;
end.



