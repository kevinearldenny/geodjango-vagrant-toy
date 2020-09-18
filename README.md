# geodjango-vagrant-toy
A spatially enabled Django application leveraging Vagrant for containerization

## System requirements

- Vagrant 2.1.5 or greater
- VirtualBox

## Run instructions

On the first run - run setup command
```
$ ./scripts/setup
```

Once the Vagrant provisioners are completed, the Django app should be accessible at http://localhost:8082



For subsequent runs, you can start the Django development server like
```
$ ./scripts/server
```


### Migrations
```
$ ./scripts/migrate
```

### Loading data
Data is automatically loaded as part of the setup command