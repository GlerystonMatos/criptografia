program Criptografia;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  IdHMACSHA1,
  System.SysUtils,
  IndyMD5 in 'IndyMD5.pas',
  IndyHMAC in 'IndyHMAC.pas';

begin
  try
    Writeln('--------------------------------------------------------------------------------------------------');
    Write('HMAC SHA1 Hex: ');
    Writeln(TIndyHMAC<TIdHMACSHA1>.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Hex: ');
    Writeln(TIndyHMAC<TIdHMACSHA256>.HashValueHexStr('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------');
    Write('HMAC SHA1 Base64: ');
    Writeln(TIndyHMAC<TIdHMACSHA1>.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Write('HMAC SHA256 Base64: ');
    Writeln(TIndyHMAC<TIdHMACSHA256>.HashValueBase64('8dc115f4e2b640f6a2bc4046fdc5c635', 'gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------');
    Write('MD5 01: ');
    Writeln(TIndyMD5.HashValue('gleryston-matos'));
    Write('MD5 02: ');
    Writeln(TIndyMD5.HashValue('gleryston-matos'));
    Writeln('--------------------------------------------------------------------------------------------------');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.