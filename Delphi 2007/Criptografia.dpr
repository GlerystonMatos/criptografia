program Criptografia;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  HMAC in 'HMAC.pas',
  HASH in 'HASH.pas';

begin
  try
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('HMAC SHA1 Hex: ');
    Writeln(THMACSHA1.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Hex: ');
    Writeln(THMACSHA256.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('HMAC SHA1 Base64: ');
    Writeln(THMACSHA1.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Base64: ');
    Writeln(THMACSHA256.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('MD5 01: ');
    Writeln(THASH.MD5HashValue('gleryston-matos'));
    Write('MD5 02: ');
    Writeln(THASH.MD5HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('SHA1 01: ');
    Writeln(THASH.SHA1HashValue('gleryston-matos'));
    Write('SHA1 02: ');
    Writeln(THASH.SHA1HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('SHA256 01: ');
    Writeln(THASH.SHA256HashValue('gleryston-matos'));
    Write('SHA256 02: ');
    Writeln(THASH.SHA256HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('SHA384 01: ');
    Writeln(THASH.SHA384HashValue('gleryston-matos'));
    Write('SHA384 02: ');
    Writeln(THASH.SHA384HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    Write('SHA512 01: ');
    Writeln(THASH.SHA512HashValue('gleryston-matos'));
    Write('SHA512 02: ');
    Writeln(THASH.SHA512HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------------------------------------------------');
    ReadLn;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
