import socket, sys

if len(sys.argv) != 2:
    print ('usage: python test_webserver.py <www.example.com>')
    sys.exit(2)

example = sys.argv[1]

try:
    infolist = socket.getaddrinfo(
        example, 'www', 0, socket.SOCK_STREAM, 0,
        socket.AI_ADDRCONFIG | socket.AI_V4MAPPED | socket.AI_CANONNAME,
        )
except socket.gaierror, e:
    print 'Name service failure:', e.args[1]
    sys.exit(1)

info = infolist[0]  
socket_args = info[0:3]
address = info[4]
s = socket.socket(*socket_args)

try:
    s.connect(address)
except socket.error, e:
    print 'Network failure:', e.args[1]
else:
    print 'Success: host', info[3], 'is listening on port 80'