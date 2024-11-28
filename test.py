#GET
import requests

url = "http://localhost/crops/admin/permisos.api.php"

payload = {}
headers = {
  'Cookie': 'PHPSESSID=9nrpekmk51vtb6m1p42arjk9eq'
}

response = requests.request("GET", url, headers=headers, data=payload)

#POST
import requests

# URL del endpoint
url = "http://localhost/crops/admin/permisos.api.php"

# Datos del payload que deseas enviar
payload = {
    'permiso': 'desde python'
}
files=[]

# Encabezados, incluyendo la cookie PHPSESSID si es necesario
headers = {
    'Cookie': 'PHPSESSID=9nrpekmk51vtb6m1p42arjk9eq'
}

# Realizar la solicitud POST
response = requests.request("POST", url, headers=headers, data=payload, files=files)

# Imprimir la respuesta del servidor
print(response.status_code)  # Código de estado HTTP
print(response.text)         # Cuerpo de la respuesta

