## OAuth

token(include scope and timeout)

Authorization grant 

+ authorization code
+ implicit
+ resource owner password credentials
+ client credentials


### Access Token Response 

		HTTP/1.1 200 OK
		Content-Type: application/json;charset=UTF-8
		Cache-Control: no-store
		Pragma: no-cache
		
		{
			"access_token":"mF_9.B5f-4.1JqM",
			"token_type":"Bearer",
			"expires_in":3600,
			"refresh_token":"tGzv3JOkF0XG5Qx2TlKWIA"
		}

### Authenticated Requests

+ Authorization Request Header Field

		GET /resource HTTP/1.1  
		Host: server.example.com   
		Authorization: Bearer mF_9.B5f-4.1JqM   
	
+ Form-Encoded Body Parameter

		POST /resource HTTP/1.1   
		Host: server.example.com   
		Content-Type: application/x-www-form-urlencoded    
		
		access_token=mF_9.B5f-4.1JqM	 

+ URL Query Parameter

		GET /resource?access_token=mF_9.B5f-4.1JqM HTTP/1.1    
		Host: server.example.com
	
### The WWW-Authenticate Response Header Field


+ Request without authentication

		HTTP/1.1 401 Unauthorized   
		WWW-Authenticate: Bearer realm="example"  
	
+ Request with expired access token

		HTTP/1.1 401 Unauthorized
		WWW-Authenticate: Bearer realm="example",
							error="invalid_token",
							error_description="The access token expired"

	- invalid_request    
	The request is missing a required parameter, includes an unsupported parameter or parameter value, repeats the same parameter, uses more than one method for including an access token, or is otherwise malformed. The resource server SHOULD respond with the HTTP 400 (Bad Request) status code.    
	- invalid_token      
	The access token provided is expired, revoked, malformed, or invalid for other reasons. The resource SHOULD respond with the HTTP 401 (Unauthorized) status code. The client MAY request a new access token and retry the protected resource request.       
	- insufficient_scope         
	The request requires higher privileges than provided by the access token. The resource server SHOULD respond with the HTTP 403 (Forbidden) status code and MAY include the scope attribute with the scope necessary to access the protected resource.       



#### QA

decode oauth token

how does API  understand this token


[Ref](http://self-issued.info/docs/draft-ietf-oauth-v2-bearer.html#toc)