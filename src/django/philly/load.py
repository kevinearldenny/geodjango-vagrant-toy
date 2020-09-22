from pathlib import Path
from django.contrib.gis.utils import LayerMapping
from .models import Neighborhood

neighborhood_mapping = {
    'name': 'NAME',
    'listname': 'LISTNAME',
    'mapname': 'MAPNAME',
    'shape_leng': 'Shape_Leng',
    'shape_area': 'Shape_Area',
    'geom': 'MULTIPOLYGON',
}


hood_shp = Path(__file__).resolve().parent / 'data' / 'Neighborhoods_Philadelphia.shp'
print(hood_shp)


def run(verbose=True):
    lm = LayerMapping(Neighborhood, str(hood_shp), neighborhood_mapping, transform=False)
    lm.save(strict=False, verbose=verbose)
