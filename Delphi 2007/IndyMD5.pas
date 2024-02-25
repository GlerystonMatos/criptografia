unit IndyMD5;

interface

uses
  IdHashMessageDigest;

type
  TIndyMD5 = class
  public
    class function HashValue(aValue: string): string;
  end;

implementation

{ TIndyMD5 }

class function TIndyMD5.HashValue(aValue: string): string;
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

end.
