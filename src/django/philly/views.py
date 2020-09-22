from django.shortcuts import render
from django.http import HttpResponse
from .models import Neighborhood
from django.core.serializers import serialize


# Create your views here.

def index(request):
    return HttpResponse("Hello")


def map(request):
    s = serialize('geojson', Neighborhood.objects.all(),
          geometry_field='geom',
          fields=('listname',))
    return render(request, 'philly/map.html', {'data': s})
