from random import randrange

__author__ = 'alexmak'

def GenerateRandomStr(length, existing=[], chars="abcdefghijklmnopqrstuvwxyz0123456789"):
    ret = ""
    for i in range(0,length):
        ret += chars[randrange(0, len(chars))]
    while ret in existing:
        ret += chars[randrange(0, len(chars))]
    return ret
