# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# install required packages for system
RUN apt-get update \
    && apt-get upgrade -y && apt install python3-pip -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config -y \
    && rm -rf /var/lib/apt/lists/*


RUN export MYSQLCLIENT_CFLAGS=$(pkg-config --cflags mysqlclient) \
    && export MYSQLCLIENT_LDFLAGS=$(pkg-config --libs mysqlclient) \
    && pip install mysqlclient


# Copy the requirements file into the container
COPY requirements.txt .

# Install app dependencies
# RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt -y

# Copy the rest of the application code
COPY . .

# Specify the command to run your application
CMD ["python", "app.py"]

