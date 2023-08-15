program Criptografia;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  IndyHMACSHA1 in 'IndyHMACSHA1.pas',
  IndyHMACSHA256 in 'IndyHMACSHA256.pas';

begin
  try
    Write('HMAC SHA1 Hex: ');
    Writeln(TIndyHMACSHA1.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Hex: ');
    Writeln(TIndyHMACSHA256.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA1 Base64: ');
    Writeln(TIndyHMACSHA1.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Base64: ');
    Writeln(TIndyHMACSHA256.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    ReadLn;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
