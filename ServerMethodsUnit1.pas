unit ServerMethodsUnit1;

interface

uses
  System.SysUtils, System.Classes, System.Json, System.NetEncoding, Datasnap.DSServer,
  Datasnap.DSAuth, Data.DB, MemDS, DBAccess, Uni, UniProvider, ODBCUniProvider,
  DB2UniProvider, DataSetConverter4D.Helper, DataSetConverter4D.Impl, DataSetConverter4D,
  DataSetConverter4D.Util, Graphics, IdHTTP, IdMultipartFormData;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    UniConnection1: TUniConnection;
    DB2UniProvider1: TDB2UniProvider;
    UniQMaster: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function OpenQuery1(Table, Field, Value : string): TJSONArray;
    function SaveData1(Table, Field1, Field2, Value1, Value2: string): Boolean;
    function UploadImage(Test: string): string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.OpenQuery1(Table, Field, Value: string): TJSONArray;
var
  ja: TJSONArray;
  jo: TJSONObject;
begin
  with UniQMaster do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+Table+' WHERE '+Field+' LIKE:V1 ');
    ParamByName('V1').AsString := '%'+Value+'%';
    Open;
  end;
  ja := TConverter.New.DataSet(UniQMaster).AsJSONArray;
  jo := TConverter.New.DataSet.Source(UniQMaster).AsJSONObject;
  Result:= ja;

//  ja.Free;
//  jo.Free;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SaveData1(Table, Field1, Field2, Value1, Value2: string): Boolean;
begin
  with UniQMaster do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO '+Table+' ('+Field1+', '+Field2+') VALUES (:V1, :V2)');
    ParamByName('V1').AsString := Value1;
    ParamByName('V2').AsString := Value2;
    ExecSQL;
  end;
  Result := true;
end;

function TServerMethods1.UploadImage(test: string): string;
var
  SS: TBytesStream;
  http: TIdHttp;
begin
  //IdHTTP.Id_HTTPMethodPost
//  image := base64.ToString;
//  SS := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(image));
//  try
//    SS.SaveToFile(FileName);
//  finally
//    SS.Free;
//  end;
  Result := test;
end;

end.

