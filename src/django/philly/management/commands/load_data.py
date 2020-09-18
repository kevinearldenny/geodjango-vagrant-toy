from django.core.management.base import BaseCommand
from philly import load


class Command(BaseCommand):
    def handle(self, **options):
        load.run()
