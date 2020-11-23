# Staff Device Docker Base Image

Repo for base images used across multiple services. Created as the solution to dockerhub rate limts as suggested by [AWS](https://aws.amazon.com/blogs/containers/advice-for-customers-dealing-with-docker-hub-rate-limits-and-a-coming-soon-announcement/).

To run this repo you will need: 
* aws-vault
* access to shared-services

## Adding repos
1. Update the shared services infrastruture to create your ECR repository. This can be done [here](https://github.com/ministryofjustice/pttp-shared-services-infrastructure) by adding the repository name to `main.tf` in the `ecr_images` module scope. Make a note of the name chosen.

1. Create a folder under `images` with the same name as the repository in step one. 
1. Add a Dockerfile to this folder and populate it with the correct base image value.
1. Run: `aws-vault exec moj-pttp-shared-services -- make build-and-publish`

