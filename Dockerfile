FROM python:3.8-slim

RUN  mkdir -p /app/
WORKDIR /app/

# prepre libraries
COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt


# copy python scripts
COPY . /app/

# app start script
CMD	[ "./start.sh" ]