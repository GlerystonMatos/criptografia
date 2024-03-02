unit HASH;

interface

uses
  IdHashMessageDigest, IdHashSHA;

type
  THASH = class
  public
    class function MD5HashValue(const aValue: string): string;
    class function SHA1HashValue(const aValue: string): string;
    class function SHA256HashValue(const aValue: string): string;
    class function SHA384HashValue(const aValue: string): string;
    class function SHA512HashValue(const aValue: string): string;
  end;

implementation

{ THASH }

class function THASH.MD5HashValue(const aValue: string): string;
var
  idHashMessageDigest5: TIdHashMessageDigest5;
begin
  idHashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    Result := idHashMessageDigest5.HashStringAsHex(aValue);
  finally
    idHashMessageDigest5.Free;
  end;
end;

class function THASH.SHA1HashValue(const aValue: string): string;
var
  idHashSHA1: TIdHashSHA1;
begin
  idHashSHA1 := TIdHashSHA1.Create;
  try
    Result := idHashSHA1.HashStringAsHex(aValue);
  finally
    idHashSHA1.Free;
  end;
end;

class function THASH.SHA256HashValue(const aValue: string): string;
var
  idHashSHA256: TIdHashSHA256;
begin
  idHashSHA256 := TIdHashSHA256.Create;
  try
    Result := idHashSHA256.HashStringAsHex(aValue);
  finally
    idHashSHA256.Free;
  end;
end;

class function THASH.SHA384HashValue(const aValue: string): string;
var
  idHashSHA384: TIdHashSHA384;
begin
  idHashSHA384 := TIdHashSHA384.Create;
  try
    Result := idHashSHA384.HashStringAsHex(aValue);
  finally
    idHashSHA384.Free;
  end;
end;

class function THASH.SHA512HashValue(const aValue: string): string;
var
  idHashSHA512: TIdHashSHA512;
begin
  idHashSHA512 := TIdHashSHA512.Create;
  try
    Result := idHashSHA512.HashStringAsHex(aValue);
  finally
    idHashSHA512.Free;
  end;
end;

end.
