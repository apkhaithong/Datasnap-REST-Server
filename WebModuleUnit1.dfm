object WebModule1: TWebModule1
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Name = 'DefaultAction'
      PathInfo = '/'
      Producer = Test
      OnAction = WebModuleDefaultAction
    end
    item
      Default = True
      Name = 'Test'
      PathInfo = '/Test'
      Producer = Test
    end
    item
      MethodType = mtPost
      Name = 'UploadImage'
      PathInfo = '/datasnap/rest/TServerMethods1/UploadImage'
      Producer = Test
      OnAction = WebModule1UploadImageAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 333
  Width = 518
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = ServerContainer1.DSServer1
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 48
    Top = 11
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'templates/serverfunctioninvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 48
    Top = 80
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates/reversestring.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 48
    Top = 136
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end
      item
        MimeType = 'application/vnd.ms-fontobject'
        Extensions = 'eot'
      end
      item
        MimeType = 'image/svg+xml'
        Extensions = 'svg;svgz'
      end
      item
        MimeType = 'application/font-sfnt'
        Extensions = 'ttf'
      end
      item
        MimeType = 'application/font-woff'
        Extensions = 'woff'
      end
      item
        MimeType = 'application/font-woff2'
        Extensions = 'woff2'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 168
    Top = 11
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 280
    Top = 11
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Left = 408
    Top = 11
  end
  object Test: TPageProducer
    HTMLFile = 'templates/test.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 48
    Top = 192
  end
end
