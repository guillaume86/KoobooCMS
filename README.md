Kooboo CMS 3.3 on Linux - Docker Image
==================

This repo builds a Docker image that hosts the Kooboo CMS 3.3 (extracted from http://kooboo.codeplex.com/releases/view/79455) using Linux/Nginx/Mono FastCGI.

This image can be used as, according to need, 

 - a proof of concept, used to evaluate Linux based .Net web app hosting 
 - a Kooboo dev or qa environment, or 
 - a base upon which to build a Docker image for another .Net web app.

How to Use the Image
-----------------

In your host machine with docker installed, run the image as follows:

    vagrant@precise64:~$ sudo docker run guillaume86/kooboocms
     * Starting nginx nginx
       ...done.

In a second terminal running on the same host as above, use the `docker ps` command to determine the port that nginx is using.  In the example below, it's 49181.

    vagrant@precise64:~$ sudo docker ps
    ID                  IMAGE                                COMMAND                CREATED             STATUS              PORTS
    21b021cf47b7        guillaume86/kooboocms:latest         /var/www/hello/start   27 seconds ago      Up 27 seconds       49181->80

To see the service running in the docker container, you would use the port from the ps command and, using your browser, visit:

 - http://localhost:49181/
 - http://localhost:49181/admin/
 
To stop the server just hit "Control+C" in the first terminal.

License
-----

MIT
 
