{
    Create a program that creates a square NxN matrix (N < 10),
    the user must enter all elements, but the elements in the main diagonal must be 0,
    finds the minimal element in each row and places it in a separate array,
    finds the sum of the elements in the new array and prints the values
}

program task1;

const N = 5;

type
    // array2d = Array of Array of Integer;
    matrix2d = Array[1..N, 1..N] of Integer;
    array1d = Array[1..N] of Integer;

// procedure setArraySize(size : Integer; var arr : array2d);
// begin
//     SetLength(arr, size, size);
// end;

procedure fillArray(var arr : matrix2d);
var
    i, j : Integer;

begin
    for i := 1 to Length(arr) do begin
        for j := 1 to Length(arr) do begin
            if i <> j then begin
                Write('Enter [', i, '][', j, '] element : ');
                ReadLn(arr[i, j]);
            end else begin
                arr[i,j] := 0;
            end;
        end;
    end;
end;

procedure findMinimalElements(var arr : matrix2d; var minValues : array1d);
var
    i, j: Integer;
    min : Integer;

begin
    for i := 1 to Length(arr) do begin
        min := arr[i, 1];

        for j := 1 to Length(arr) do begin
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

    for i := 1 to Length(minValues) do begin
        sum := sum + minValues[i];
        WriteLn('sum after ', i, ' element: ', sum);
    end;
end;

var
    arr : matrix2d;
    minimalValues : array1d;
    // size : Integer;

begin
    // repeat
    //     Write('Enter matrix size (< 10): ');
    //     ReadLn(size);
    // until size < 10;

    // setArraySize(size, arr);

    // WriteLn('Matrix size: ', Length(arr));

    fillArray(arr);
    findMinimalElements(arr, minimalValues);
    writeMinimalElements(minimalValues);
end.
