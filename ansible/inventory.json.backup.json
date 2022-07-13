#!/bin/bash
app=$(yc compute instance list | grep app | awk -F\| '{print $6 }' | tr -d '[:space:]')
db=$(yc compute instance list | grep db | awk -F\| '{print $6}' | tr -d '[:space:]')
cat<<EOF
{
    "_meta": {
        "hostvars": {
            "appserver": {
                "ansible_host": "${app}"
            },
            "dbserver": {
                "ansible_host": "${db}"
            }
        }
    },
    "app": {
        "hosts": [
            "appserver"
        ]
    },
    "db": {
        "hosts": [
            "dbserver"
        ]
    }
}
EOF
