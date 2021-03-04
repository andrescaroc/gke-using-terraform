# GKE Using Terraform
This repo explain how to create a Kubernetes cluster in GKE using terraform Infrastructure as code (IaC)

- Prerequisites
- Set gcloud
- Clone this repo
- Update the `terraform.tvars` file

## Prerequisites
This repo requires you to have configured:
- a GCP account
- a configured gcloud SDK
- Terrafom installed
- kubectl

## Set gcloud
Initialize gcloud 
```
gcloud init
```
Authorize the SDK to access GCP using your user account credentials and add the SDK to your path
```
gcloud auth application-default login
```
Set a default project for `gcloud`, replace with your project_id:
```
gcloud config set project PROJECT_ID
```
## Clone this repo
Use git clone:
```
git clone https://github.com/andrescaroc/gke-using-terraform.git
```
Change directory:
```
cd gke-using-terraform
```
## Update the `terraform.tvars` file
Replace the values in your terraform.tvars file with your `project_id` and `region` from your GCP account.
```
# terraform.tfvars
project_id = "REPLACE_ME"
region     = "us-central1"
```
You can find the project your `gcloud` is configured to with this command.
```
gcloud config get-value project
```
You can find a full list of gcloud regions [here.](https://cloud.google.com/compute/docs/regions-zones)
