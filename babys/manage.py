#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import socket
import sys

from django.core.management.commands.runserver import Command as Runserver


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'babys.settings')
    # 修改 runserver 的启动 ip 和 port，因为 runserver 127.0.0.1:8000 谷歌打开的时候会丢失 css 文件...

    localhost_ip = socket.gethostbyname(socket.gethostname())
    is_intranet = localhost_ip.startswith("10.")
    if not is_intranet:
        localhost_ip = "127.0.0.1"
    Runserver.default_addr = localhost_ip
    Runserver.default_port = "10086"

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
