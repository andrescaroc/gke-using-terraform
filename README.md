# GKE Using Terraform
This repo explain how to create a Kubernetes cluster in GKE using terraform Infrastructure as code (IaC)

- Prerequisites
- Set gcloud
- Clone this repo
- Update the `terraform.tvars` file
- Use Terraform
- Set kubectl to work with your cluster

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
region     = "REPLACE_ME_TOO"
```
You can find the project your `gcloud` is configured to with this command.
```
gcloud config get-value project
```
You can find a full list of gcloud regions [here.](https://cloud.google.com/compute/docs/regions-zones)

## Use Terraform
Initialize terraform, this will install the provider plugins:
```
terraform init
```
Before continue, make sure Compute Engine API and Kubernetes Engine API are enabled in your GCP console for your `project_id`, if not sure visit:

- https://console.cloud.google.com/compute
- https://console.cloud.google.com/kubernetes

And verify it is not asking you to enable the respective API.

Then, let terraform create the defined resources:
```
terraform apply
```

## Set kubectl to work with your cluster
Gather and set the kubeconfig required by kubectl to manage your GKE cluster
```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```



