from django.db import models
from django.contrib.gis.db import models

class Neighborhood(models.Model):
    name = models.CharField(max_length=100)
    listname = models.CharField(max_length=100)
    mapname = models.CharField(max_length=100)
    shape_leng = models.FloatField()
    shape_area = models.FloatField()
    geom = models.MultiPolygonField(srid=2272)

    # Returns the string representation of the model.
    def __str__(self):
        return self.name