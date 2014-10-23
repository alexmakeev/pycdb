# -*- encoding: utf-8 -*-from django.db import modelsclass Node(models.Model):    config = models.ForeignKey("Configurations")    id = models.CommaSeparatedIntegerField(max_length=30, primary_key=True)    x = models.FloatField()    y = models.FloatField()    color = models.CharField(max_length=30)    shape = models.CharField(max_length=30)    size = models.IntegerField()    image = models.URLField(max_length=1024)    scale = models.FloatField()class DefaultNode(models.Model):    cid = models.IntegerField(primary_key=True)    config = models.ForeignKey("Configurations")    x = models.IntegerField(default=0)    y = models.IntegerField(default=0)    color = models.CharField(max_length=30, default="black")    shape = models.CharField(max_length=30, default="circle")    size = models.IntegerField(default=1)    image = models.URLField(max_length=1024)    scale = models.FloatField()class Configurations(models.Model):    id = models.IntegerField(primary_key=True)    name = models.CharField(max_length=50)