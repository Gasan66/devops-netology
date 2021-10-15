#!/usr/bin/env python3
import socket
import time
import json
import yaml

urls = ['drive.google.com', 'mail.google.com', 'google.com']
resolved_urls = {}

for url in urls:
    resolved_urls[url] = socket.gethostbyname(url)


with open('server_list.json', 'w', encoding='utf-8') as f:
    json.dump(resolved_urls, f, ensure_ascii=False, indent=4)

with open('server_list.yml', 'w', encoding='utf-8') as f:
    yaml.dump(resolved_urls, f, default_flow_style=False)

while True:
    upd_addrs = {}
    for url in urls:
        upd_addrs[url] = socket.gethostbyname(url)
    for url in urls:
        if resolved_urls[url] != upd_addrs[url]:

            print(f'[ERROR] <{url}> IP mismatch: <{resolved_urls[url]}> <{upd_addrs[url]}>')

            resolved_urls[url] = upd_addrs[url]

            with open('server_list.json', 'w', encoding='utf-8') as f:
                json.dump(resolved_urls, f, ensure_ascii=False, indent=4)

            with open('server_list.yml', 'w', encoding='utf-8') as f:
                yaml.dump(resolved_urls, f, default_flow_style=False)

        else:
            print(f'<{url}> - <{resolved_urls[url]}>')
    time.sleep(2)
