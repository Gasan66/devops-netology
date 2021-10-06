#!/usr/bin/env python3
import socket
import time

urls = ['drive.google.com', 'mail.google.com', 'google.com']
resolved_urls = {}

for url in urls:
    resolved_urls[url] = socket.gethostbyname(url)

while True:
    upd_addrs = {}
    for url in urls:
        upd_addrs[url] = socket.gethostbyname(url)
    for url in urls:
        if resolved_urls[url] != upd_addrs[url]:
            print(f'[ERROR] <{url}> IP mismatch: <{resolved_urls[url]}> <{upd_addrs[url]}>')
        else:
            print(f'<{url}> - <{resolved_urls[url]}>')
    time.sleep(2)
