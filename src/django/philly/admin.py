from django.contrib.gis import admin

from .models import Neighborhood
# Register your models here.

admin.site.register(Neighborhood, admin.OSMGeoAdmin)
