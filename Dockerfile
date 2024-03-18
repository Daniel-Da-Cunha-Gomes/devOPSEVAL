# # TODO: The base image must be: python:3.10-alpine
# WORKDIR /code
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# # copy the requirements.txt into the container with the same name
# RUN pip install -r requirements.txt
# EXPOSE 5000
# # TODO: copy all from the current local folder to the containner 
# CMD ["flask", "run"]
# Use the python:3.10-alpine base image


# -----------------------------

FROM python:3.10-alpine

# Set the working directory inside the container
WORKDIR /code

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install necessary dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy the requirements.txt file into the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port 5000 for Flask app
EXPOSE 5000

# Copy all files from the current local folder to the container
COPY . .

# Command to run the Flask application
CMD ["flask", "run"]
# -------------------------
# # Utiliser l'image officielle de Nginx
# FROM nginx

# # Supprimer le contenu par défaut de Nginx
# RUN rm -rf /usr/share/nginx/html/*

# # Copier les fichiers statiques de votre application React dans le répertoire de Nginx
# COPY dist /usr/share/nginx/html

# # Exposer le port 80 pour Nginx
# EXPOSE 80

# # Commande pour démarrer Nginx lorsque le conteneur démarre
# CMD ["nginx", "-g", "daemon off;"]
