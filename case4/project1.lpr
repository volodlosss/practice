program project1;

{$mode objfpc}{$H+}

uses
  SysUtils, fphttpserver, httpdefs;

type
  TWebModule = class
  public
    procedure HandleRequest(Sender: TObject;
      var ARequest: TFPHTTPConnectionRequest;
      var AResponse: TFPHTTPConnectionResponse);
  end;

procedure TWebModule.HandleRequest(Sender: TObject;
  var ARequest: TFPHTTPConnectionRequest;
  var AResponse: TFPHTTPConnectionResponse);
var
  HTML: string;
begin
  HTML := '<html><body>';
  HTML := HTML + '<h1>Web-приложение работает!</h1>';
  HTML := HTML + '</body></html>';

  AResponse.Content := HTML;
  AResponse.ContentType := 'text/html';
  AResponse.Code := 200;
end;

var
  Server: TFPHTTPServer;
  WebModule: TWebModule;

begin
  WebModule := TWebModule.Create;
  Server := TFPHTTPServer.Create(nil);

  Server.Port := 8080;
  Server.OnRequest := @WebModule.HandleRequest;
  Server.Active := True;

  WriteLn('Сервер запущен на http://localhost:8080');
  ReadLn;

  Server.Free;
  WebModule.Free;
end.
