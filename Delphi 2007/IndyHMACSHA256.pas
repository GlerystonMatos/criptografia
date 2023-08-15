unit IndyHMACSHA256;

interface

uses
  IdHMACSHA1, IdGlobal, SysUtils, IdSSLOpenSSL, IdCoderMIME;

type
  TIndyHMACSHA256 = class(TIdHMACSHA256)
  private
    class function IdBytesOf(aValue: string): TIdBytes;
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

implementation

{ TIndyHMACSHA256 }

class function TIndyHMACSHA256.IdBytesOf(aValue: string): TIdBytes;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  Result := ToBytes(aValue);
end;

class function TIndyHMACSHA256.HashValue(aKey, aValue: string): TIdBytes;
var
  indyHMAC: TIdHMACSHA256;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  indyHMAC := TIdHMACSHA256.Create;
  try
    indyHMAC.Key := IdBytesOf(aKey);
    Result := indyHMAC.HashValue(IdBytesOf(aValue));
  finally
    indyHMAC.Free;
  end;
end;

class function TIndyHMACSHA256.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function TIndyHMACSHA256.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

end.
