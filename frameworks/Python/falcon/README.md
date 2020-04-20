# Readme

### install requirements

```bash
sudo pip install -r requirements.txt
```

### Activate the virtual environment

```bash
source ./venv/bin/activate
```

### Start the server

```bash
gunicorn -w 2 -b 0.0.0.0:5151 app:app
```

### Some autocrud stuffs...

* limit number of items returned (weird syntax...)
```
http://localhost:5151/products?__limit=10
```
