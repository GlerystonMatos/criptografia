unit IndyHMAC;

interface

uses
  IdHMAC, IdGlobal, System.SysUtils, IdSSLOpenSSL, IdCoderMIME;

type
  TIndyHMAC<T: TIdHMAC, constructor> = class
  private
    class function IdBytesOf(aValue: string): TIdBytes;
    class function HashValue(aKey, aValue: string): TIdBytes;
  public
    class function HashValueHexStr(aKey, aValue: string): string;
    class function HashValueBase64(aKey, aValue: string): string;
  end;

implementation

{ TIndyHMAC<T> }

class function TIndyHMAC<T>.IdBytesOf(aValue: string): TIdBytes;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  Result := ToBytes(aValue, IndyTextEncoding_UTF8);
end;

class function TIndyHMAC<T>.HashValue(aKey, aValue: string): TIdBytes;
var
  indyHMAC: T;
begin
  if (not IdSSLOpenSSL.LoadOpenSSLLibrary) then
    Exit;

  indyHMAC := T.Create;
  try
    indyHMAC.Key := IdBytesOf(aKey);
    Result := indyHMAC.HashValue(IdBytesOf(aValue));
  finally
    indyHMAC.Free;
  end;
end;

class function TIndyHMAC<T>.HashValueHexStr(aKey, aValue: string): string;
var
  value: Byte;
begin
  Result := '0x';
  for value in HashValue(aKey, aValue) do
    Result := Result + IntToHex(value, 2);
end;

class function TIndyHMAC<T>.HashValueBase64(aKey, aValue: string): string;
var
  values: TIdBytes;
begin
  values := HashValue(aKey, aValue);
  Result := TIdEncoderMIME.EncodeBytes(values);
end;

end.
