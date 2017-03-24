{
    Create a program that reads a file name,
    creates an array from the numbers on each line of the file,
    checks if the array is sorted in ascending order,
    checks if there are doubles with the same value and how many are there
}

program task1;

const N = 10;

type
    array1d = Array[1..N] of Integer;
    fileType = Text;

{
    Read the file name and assign it to a variable
}
procedure getFile(var fileIn : fileType);
var
    fileName : String;
begin
    Write('Enter file name: ');
    ReadLn(fileName);
    Assign(fileIn, fileName);
    WriteLn();
end;

{
    Fill the array from the input file
}
procedure fillArray(var arr : array1d; var fileIn : fileType);
var
    i : Integer;

begin
    Reset(fileIn);

    WriteLn('Begin filling array');

    for i := 1 to N do begin
        ReadLn(fileIn, arr[i]);
    end;

    WriteLn('Array filled!');

    Close(fileIn);

    WriteLn();
end;

{
    Check if the array is sorted in ascending order
}
function isArrayAscending(arr : array1d):Boolean;
var
    isSorted: Boolean;
    i : Integer;

begin
    isSorted := true;

    for i := 1 to Length(arr) do begin
        if arr[i] > arr[i + 1] then begin
            isSorted := false;
            break;
        end;
    end;

    isArrayAscending := isSorted;
end;

{
    Check if there are doubles with the same value and how many are there
}
function arrayDoublesCount(arr : array1d):Integer;
var
    i, j : Integer;
    count : Integer;

begin
    count := 0;

    for i := 1 to Length(arr) - 1 do begin
        for j := i + 1 to Length(arr) do begin
            if arr[i] = arr[j] then begin
                inc(count);
            end;
        end;
    end;

    arrayDoublesCount := count;
end;

var
    arr : array1d;
    fileInput : fileType;
    isArraySorted : Boolean;
    doubleElements : Integer;

begin
    getFile(fileInput);
    fillArray(arr, fileInput);
    isArraySorted := isArrayAscending(arr);
    doubleElements := arrayDoublesCount(arr);

    if isArraySorted then begin
        WriteLn('The array is sorted in ascending order.');
    end else begin
        WriteLn('The array is NOT sorted in ascending order.');
    end;

    if doubleElements > 0 then begin
        WriteLn('There are ', doubleElements, ' doubles in the array.');
    end else begin
        WriteLn('There are no doubles in the array.');
    end;
end.
