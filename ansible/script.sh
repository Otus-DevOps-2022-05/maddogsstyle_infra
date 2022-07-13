#!/bin/bash
echo app ip:
yc compute instance list | grep app | awk -F\| '{print $6}'
echo db ip:
yc compute instance list | grep db |  awk -F\| '{print $6}'
