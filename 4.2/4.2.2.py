#!/usr/bin/env python3

import os


abspath = '/Users/gasan/Netology/devops-netology/'

bash_command = [f"cd {abspath}", "git status"]
if os.path.exists(os.path.abspath(abspath) + '/.git'):
    result_os = os.popen(' && '.join(bash_command)).read()
    is_change = False
    for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = result.replace('\tmodified:   ', '')
            print(os.path.abspath(prepare_result))
            # break
else:
    print('It isn\'t a git repo')