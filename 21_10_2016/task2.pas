{
    Create a program that reads an input string from the user,
    (procedure) count the words of the string that can be separated by one or more <space>, <comma>, or <dot>,
    (procedure) checks if there are any integers in the string and counts how many there are,
    (procedure) replaces all capital letters with small letters
}

program task2;

{
    Prompt the user to enter an input string
}
procedure inputString(var str : String);
begin
    WriteLn('Enter your message:');
    ReadLn(str);

    WriteLn();
end;

{
    Count the words of the input string
}
procedure countWords(str : String);
var
    i : Integer;
    counter : Integer;

begin
    counter := 0;

    for i := 1 to Length(str) - 1 do begin
        if (str[i] = ' ') or (str[i] = ',') or (str[i] = '.') then begin
            if (str[i + 1] <> ' ') and (str[i + 1] <> ',') and (str[i + 1] <> '.') then begin
                counter := counter + 1;
            end;
        end;

        if i = Length(str) - 1 then begin
            counter := counter + 1;
        end;
    end;

    WriteLn('There are ', counter, ' words.');

    WriteLn();
end;

{
    Count the integers in the input string
}
procedure countIntegers(str : String);
var
    i : Integer;
    currentInteger : Integer;
    code : Integer;
    counter : Integer;

begin
    counter := 0;

    for i := 1 to Length(str) do begin
        Val(str[i], currentInteger, code);

        if code = 0 then begin
            counter := counter + 1;
        end;
    end;

    WriteLn('There are ', counter, ' integers.');

    WriteLn();
end;

{
    Convert all capital letters in the input string to lowercase
}
procedure lowerLetters(str : String);
begin
    WriteLn('The string without capital letters:');

    WriteLn(LowerCase(str));

    WriteLn();
end;

var
    message: String;

begin
    inputString(message);
    countWords(message);
    countIntegers(message);
    lowerLetters(message);
end.
