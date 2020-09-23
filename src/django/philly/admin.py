from django.contrib import admin
from django.contrib.gis import admin

from .models import *
# Register your models here.

admin.site.register(Neighborhood, admin.OSMGeoAdmin)