# ft_services

This is a System Administration and Networking project.

The project consists of setting up an infrastructure of different services. To do this, i
used Kubernetes. I set up a multi-service cluster.
Each service run in a dedicated container.
Each container bear the same name as the service concerned and for performance
reasons, containers were build using Alpine Linux.
Also, they have a Dockerfile which is called in the setup.sh script.

To run this project, simply execute setup.sh(./setup.sh or bash setup.sh)
Of course if you truly want to see how it's working you should have Kubernetes, Docker and Virtualbox on your computer.
Be patient, it can take up to 5 minutes.
