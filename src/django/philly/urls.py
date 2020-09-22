from django.urls import path

from . import views

app_name = 'philly'
urlpatterns = [
    path('', views.map, name='map'),
]
