{
    Create a program that determines the value with .0001 precision
    R = sum(A[i]), A[i] = 1 / (1 + i), i = 1..
}

function determineValue(n : Integer):Double;
var
    i : Integer;
    result : Double;
begin
    for i := 1 to n do begin
        result := 1 / (1 + i);
    end;

    determineValue := result;
end;

var
    n : Integer;

begin
    Write('Enter integer: ');
    ReadLn(n);
    WriteLn(determineValue(n):0:4);
end.
