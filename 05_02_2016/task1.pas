{
    Create a program that reads a file name,
    creates an array from the integers on each line of the file,
    checks if the array is sorted in descending order,
    checks if there are triples with the same value and how many are there
}

program task1;

type
    array1d = Array of Integer;
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
    Get the number of lines of the file
}
function getFileLines(var fileIn : fileType):Integer;
var
    counter : Integer;

begin
    counter := 0;

    Reset(fileIn);

    while NOT EOF(fileIn) do begin
        ReadLn(fileIn);
        inc(counter);
    end;

    Close(fileIn);

    getFileLines := counter;

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

    for i := 1 to Length(arr) do begin
        ReadLn(fileIn, arr[i]);
    end;

    WriteLn('Array filled!');

    Close(fileIn);

    WriteLn();
end;

{
    Check if the array is sorted in ascending order
}
function isArrayDescending(arr : array1d):Boolean;
var
    isSorted: Boolean;
    i : Integer;

begin
    isSorted := true;

    for i := 1 to Length(arr) - 1 do begin
        if arr[i] < arr[i + 1] then begin
            isSorted := false;
            break;
        end;
    end;

    isArrayDescending := isSorted;
end;

{
    Check if there are doubles with the same value and how many are there
}
function arrayTriplesCount(arr : array1d):Integer;
var
    i, j, k : Integer;
    count : Integer;

begin
    count := 0;

    for i := 1 to Length(arr) - 2 do begin
        for j := i + 1 to Length(arr) - 1 do begin
            for k := j + 1 to Length(arr) do begin
                if (arr[i] = arr[j]) and (arr[j] = arr[k]) then begin
                    inc(count);
                end;
            end;
        end;
    end;

    arrayTriplesCount := count;
end;

var
    arr : array1d;
    fileInput : fileType;
    tripleElements : Integer;

begin
    getFile(fileInput);
    SetLength(arr, getFileLines(fileInput));
    fillArray(arr, fileInput);
    tripleElements := arrayTriplesCount(arr);

    if isArrayDescending(arr) then begin
        WriteLn('The array is sorted in descending order.');
    end else begin
        WriteLn('The array is NOT sorted in descending order.');
    end;

    if tripleElements > 0 then begin
        WriteLn('There are ', tripleElements, ' triples in the array.');
    end else begin
        WriteLn('There are no triples in the array.');
    end;
end.
