Class Scan.RESTTest Extends %CSP.REST
{

XData UrlMap [XMLNamespace = "http://www.native.rest.com/urlmap" ]
{
<Routes>

     <Route Url="/test/:name" Method="GET" Call="hello" Cors="false" />  
  </Routes>
 }

ClassMethod hello(name as %String) as %Status{
        
        w "Hello "_name
        
           QUIT $$$OK
    }

}