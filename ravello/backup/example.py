from ravello_sdk import *
client = RavelloClient()
client.login('william.leonard@oracle.com', 'APAG9dPH')
for app in client.get_applications():
    print('Found Application: {0}'.format(app['name']))
