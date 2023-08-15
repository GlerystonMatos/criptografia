unit IndyHMACSHA1;

interface

uses
  IdHMACSHA1, IdGlobal, SysUtils, IdSSLOpenSSL, IdCoderMIME;

type
  TIndyHMACSHA1 = class(TIdHMACSHA1)
  private
    class function IdBytesOf(aValue: string): TIdBytes;
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

implementation

{ TIndyHMACSHA1 }

class function TIndyHMACSHA1.IdBytesOf(aValue: string): TIdBytes;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  Result := ToBytes(aValue, IndyTextEncoding_UTF8);
end;

class function TIndyHMACSHA1.HashValue(aKey, aValue: string): TIdBytes;
var
  indyHMAC: TIdHMACSHA1;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  indyHMAC := TIdHMACSHA1.Create;
  try
    indyHMAC.Key := IdBytesOf(aKey);
    Result := indyHMAC.HashValue(IdBytesOf(aValue));
  finally
    indyHMAC.Free;
  end;
end;

class function TIndyHMACSHA1.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function TIndyHMACSHA1.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

end.
