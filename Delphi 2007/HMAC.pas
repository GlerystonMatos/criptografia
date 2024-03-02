unit HMAC;

interface

uses
  IdHMACSHA1, IdGlobal, SysUtils, IdSSLOpenSSL, IdCoderMIME;

type
  THMAC = class
  public
    class function IdBytesOf(aValue: string): TIdBytes;
  end;

  THMACSHA1 = class(TIdHMACSHA1)
  private
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

  THMACSHA256 = class(TIdHMACSHA256)
  private
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

implementation

{ THMAC }

class function THMAC.IdBytesOf(aValue: string): TIdBytes;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  Result := ToBytes(aValue, IndyTextEncoding_UTF8);
end;

{ THMACSHA1 }

class function THMACSHA1.HashValue(aKey, aValue: string): TIdBytes;
var
  hmac: TIdHMACSHA1;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  hmac := TIdHMACSHA1.Create;
  try
    hmac.Key := THMAC.IdBytesOf(aKey);
    Result := hmac.HashValue(THMAC.IdBytesOf(aValue));
  finally
    hmac.Free;
  end;
end;

class function THMACSHA1.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function THMACSHA1.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

{ THMACSHA256 }

class function THMACSHA256.HashValue(aKey, aValue: string): TIdBytes;
var
  hmac: TIdHMACSHA256;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  hmac := TIdHMACSHA256.Create;
  try
    hmac.Key := THMAC.IdBytesOf(aKey);
    Result := hmac.HashValue(THMAC.IdBytesOf(aValue));
  finally
    hmac.Free;
  end;
end;

class function THMACSHA256.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function THMACSHA256.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

end.
