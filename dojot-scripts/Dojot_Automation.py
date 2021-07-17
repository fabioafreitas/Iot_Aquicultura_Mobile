'''
Neste script estãos presentes funções para automatizar a criação
'''

import paho.mqtt.publish as mqtt_pub
import requests
from random import uniform
from threading import Thread
from time import sleep

# Thread responsável por enviar requisições mqtt para alimentar devices de teste
class MqttSenderThread(Thread):
    def __init__ (self, device_id, broker_url, port=1883, username='admin'):
        Thread.__init__(self)
        self.device_id = device_id
        self.broker_url = broker_url
        self.port = port
        self.username = username
    
    def run(self):
        topic = self.username+':'+self.device_id+'/attrs'
        userauth = self.username+':'+self.device_id
        while True:
            jsonData = {
                "dissolved_oxygen": uniform(6, 8),
                "conductivity": uniform(34500, 37500),
                "temperature": uniform(20, 30),
                "ph": uniform(6, 8)
            }
            payload = str(jsonData).replace('\'', '\"')
            mqtt_pub.single(
                topic=topic, 
                hostname=self.broker_url, 
                port=self.port, 
                auth={'username':userauth},
                payload=payload
            )
            print("published on {}".format(self.device_id))
            sleep(20)
    
def getJWT(url):
    uri = 'http://'+url+':8000/auth'
    response = requests.post(
        url = uri, 
        json={'username':'admin','passwd':'admin'},
        headers={'Content-Type':'application/json'}
    )
    return response.json()['jwt']

# Criar o template 'Flutter Template' no dojot
# Esta funcao não checa se o template desse nome já existe
def createTemplate(url):
    uri='http://'+url+':8000/template'
    jwt = getJWT(url)
    headers={
        'Authorization':'Bearer '+jwt, 
        'Content-Type':'application/json'
    }
    body={
        "label": "Flutter Template",
            "attrs": [
            {
                "label": "temperature",
                "type": "dynamic",
                "value_type": "float"
            },
            {
                "label": "ph",
                "type": "dynamic",
                "value_type": "float"
            },
            {
                "label": "dissolved_oxygen",
                "type": "dynamic",
                "value_type": "float"
            },
            {
                "label": "conductivity",
                "type": "dynamic",
                "value_type": "float"
            }
        ]
    }
    response = requests.post(url=uri, headers=headers, json=body)
    return response.status_code

# Criar dispositivos no dojot, a partir do template 'Flutter Template' criado no comando de cima
# Os nomes dos devices são do tipo 'Flutter Device %i'
# Esta função não verifica se o nome já existe
def createDevice(url, quantity):
    # obtendo dados historicos do dojot
    uri='http://'+url+':8000/export'
    jwt = getJWT(url)
    headers={'Authorization':'Bearer '+jwt, 'Content-Type':'application/json'}
    response = requests.get(url=uri, headers=headers)
    
    # obtendo id do Flutter Template
    template_id = 0
    for template in response.json()['templates']:
        if template['label'] == 'Flutter Template':
            template_id = template['id']
    
    # criando devices
    uri = 'http://'+url+':8000/device'
    for i in range(0, quantity):
        jsonData = {
            "templates": [
                template_id
            ],
            "label": "Flutter Device "+str(i)
        }
        # requests.post(url=uri, headers=headers, json=jsonData)

# recebe a url do dojot e alimenta dados para os devices de nome 'Flutter Device %i'
def sendDataToDevices(url):
    uri='http://'+url+':8000/export'
    jwt = getJWT(url)
    headers={'Authorization':'Bearer '+jwt, 'Content-Type':'application/json'}
    response = requests.get(url=uri, headers=headers)
    
    # filtrando devices com Flutter no nome
    ids = []
    for device in response.json()['devices']:
        if device['label'].find('Flutter') != -1:
            ids.append(device['id'])
    
    #enviando dados infinitamente, a cada 10s
    threads = [MqttSenderThread(id, url) for id in ids]
    for thread in threads:
        print('Thread de id {} iniciada'.format(thread.device_id))
        thread.start()

if __name__ == '__main__':
    url = 'dojot.fabiotest.online'
    sendDataToDevices(url)