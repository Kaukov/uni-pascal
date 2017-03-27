{
    Create a program that creates a square NxN matrix (N < 10),
    the user must enter all elements, but the elements in the main diagonal must be 0,
    finds the minimal element in each row and places it in a separate array,
    finds the sum of the elements in the new array and prints the values
}

program task1;

type
    array2d = Array of Array of Integer;
    array1d = Array of Integer;

procedure setArraySize(size : Integer; var arr : array2d);
begin
    SetLength(arr, size, size);
end;

procedure fillArray(var arr : array2d);
var
    i, j : Integer;

begin
    for i := 0 to Length(arr) - 1 do begin
        for j := 0 to Length(arr) - 1 do begin
            if i <> j then begin
                Write('Enter [', i + 1, '][', j + 1, '] element : ');
                ReadLn(arr[i, j]);
            end else begin
                arr[i,j] := 0;
            end;
        end;
    end;
end;

procedure findMinimalElements(var arr : array2d; var minValues : array1d);
var
    i, j: Integer;
    min : Integer;

begin
    SetLength(minValues, Length(arr));

    for i := 0 to Length(arr) - 1 do begin
        min := arr[i, 0];

        for j := 0 to Length(arr) - 1 do begin
            if arr[i, j] < min then begin
                min := arr[i, j];
            end;
        end;

        minValues[i] := min;
    end;
end;

procedure writeMinimalElements(minValues : array1d);
var
    i : Integer;
    sum : Integer;

begin
    sum := 0;

    for i := 0 to Length(minValues) - 1 do begin
        sum := sum + minValues[i];
        WriteLn('sum after ', i + 1, ' row''s minimal element: ', sum);
    end;
end;

var
    arr : array2d;
    minimalValues : array1d;
    size : Integer;

begin
    repeat
        Write('Enter matrix size (< 10): ');
        ReadLn(size);
    until size < 10;

    setArraySize(size, arr);

    fillArray(arr);

    findMinimalElements(arr, minimalValues);

    writeMinimalElements(minimalValues);
end.
