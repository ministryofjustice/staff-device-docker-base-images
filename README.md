# Staff Device Docker Base Image

Repo for base images used across multiple services. Created as the solution to dockerhub rate limts as suggested by [AWS](https://aws.amazon.com/blogs/containers/advice-for-customers-dealing-with-docker-hub-rate-limits-and-a-coming-soon-announcement/).

To run this repo you will need: 
* aws-vault
* access to shared-services

## Adding repos
1. Update the shared services infrastruture to create your ECR repository. This can be done [here](https://github.com/ministryofjustice/staff-device-shared-services-infrastructure) by adding the repository name to `main.tf` in the `ecr_images` module scope. Make a note of the name chosen.

1. Create a folder under `images` with the same name as the repository in step one. 
1. Add a Dockerfile to this folder and populate it with the correct base image value.
1. Run: `aws-vault exec moj-pttp-shared-services -- make build-and-publish`

## Updating existing container images
1. Create a branch on this repository.
2. Open the image `Dockerfile` within the `images` folder that you would like to update e.g. `images\grafana\Dockerfile` 
3. Change image version to desired e.g. `FROM grafana/grafana:8.3.3` to `FROM grafana/grafana:8.3.4`
4. Create a Pull Request wait for review, merge and then switch back to main.
5. Run: `aws-vault exec moj-pttp-shared-services -- make build-and-publish` this pulls down all images and then pushes them into ECR
6. The running container will not update until container services are redeployed. For Elastic Container Service, go to the service, select the `Update` button and leave all defaults except tick the box by `Force New Deployment` this will recreate all the running containers with the new image.  
