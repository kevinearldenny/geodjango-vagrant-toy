from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
from django.views import generic
from django.contrib.gis.geos import fromstr
from django.contrib.gis.db.models.functions import Distance
from .models import Neighborhood
from django.core.serializers import serialize


# Create your views here.

def index(request):
    return HttpResponse("Hello")

def map(request):
    hoods = Neighborhood.objects.all()
    s = serialize('geojson', Neighborhood.objects.all(),
          geometry_field='geom',
          fields=('listname',))
    return render(request, 'philly/map.html', {'data': s})