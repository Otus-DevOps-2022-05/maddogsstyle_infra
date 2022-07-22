#!/bin/bash
if yc compute instance list | grep -q prod-reddit-app; then
app=$(yc compute instance list | grep prod-reddit-app | awk -F\| '{print $6 }' | tr -d '[:space:]')
else
app=$(yc compute instance list | grep reddit-app | awk -F\| '{print $6 }' | tr -d '[:space:]')
fi

if yc compute instance list | grep -q prod-reddit-db; then
db=$(yc compute instance list | grep prod-reddit-db | awk -F\| '{print $6}' | tr -d '[:space:]')
else
db=$(yc compute instance list | grep reddit-db | awk -F\| '{print $6}' | tr -d '[:space:]')
fi

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
