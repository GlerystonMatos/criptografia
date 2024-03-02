unit HMAC;

interface

uses
  IdHMAC, IdGlobal, System.SysUtils, IdSSLOpenSSL, IdCoderMIME;

type
  THMAC<T: TIdHMAC, constructor> = class
  private
    class function IdBytesOf(aValue: string): TIdBytes;
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

implementation

{ THMAC<T> }

class function THMAC<T>.IdBytesOf(aValue: string): TIdBytes;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  Result := ToBytes(aValue, IndyTextEncoding_UTF8);
end;

class function THMAC<T>.HashValue(aKey, aValue: string): TIdBytes;
var
  hmac: T;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  hmac := T.Create;
  try
    hmac.Key := IdBytesOf(aKey);
    Result := hmac.HashValue(IdBytesOf(aValue));
  finally
    hmac.Free;
  end;
end;

class function THMAC<T>.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function THMAC<T>.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

end.
