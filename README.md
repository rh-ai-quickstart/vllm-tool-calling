# vLLM Tool Calling 

Welcome to the vLLM [Function Calling](https://ai-on-openshift.io/odh-rhoai/enable-function-calling/) Kickstart!  

Use this to quickly get a vLLM runtime with Function Calling enabled in your OpenShift AI environment, loading models directly from ModelCar containers.  

To see how it's done, jump straight to [installation](#install).

## Table of Contents

- [vLLM Tool Calling](#vllm-tool-calling)
- [Detailed description](#detailed-description)
    - [See it in action](#see-it-in-action)
    - [Architecture diagrams](#architecture-diagrams)
    - [References](#references)
- [Requirements](#requirements)
    - [Minimum hardware requirements](#minimum-hardware-requirements)
    - [Required software](#required-software)
    - [Required permissions](#required-permissions)
- [Install](#install)
    - [Clone the repository](#clone-the-repository)
    - [Create the project](#create-the-project)
    - [Choose your LLM to be deployed](#choose-your-llm-to-be-deployed)
    - [Check the deployment](#check-the-deployment)

## Detailed description

The vLLM Function Calling Kickstart is a template for deploying vLLM with Function Calling enabled, integrated with ModelCar containerized models, within Red Hat OpenShift AI.

It’s designed for environments where you want to:

- Enable LLMs to call external tools (Tool/Function Calling).
- Serve LLMs (like Granite3, Llama3) directly from a container.
- Easily customize your model deployments without needing cluster admin privileges.

Use this project to quickly spin up a powerful vLLM instance ready for function-enabled Agents or AI applications.

### See it in action

Red Hat uses Arcade software to create interactive demos. Check out [Function Calling Kickstart Example](TBD) to see it live.

### Architecture diagrams

![architecture.png](assets/images/architecture.png)

### References 

- The runtime is out of the box in RHOAI called [vLLM ServingRuntime for KServe](https://docs.redhat.com/en/documentation/red_hat_openshift_ai_self-managed/2.19/html/serving_models/serving-large-models_serving-large-models#supported-model-serving-runtimes_serving-large-models)
- Detailed guide and documentations is available in [this article.](https://ai-on-openshift.io/odh-rhoai/enable-function-calling/)
- Code for testing the Function Calling in OpenShift AI is in [github.com/rh-aiservices-bu/llm-on-openshift](https://github.com/rh-aiservices-bu/llm-on-openshift/blob/main/examples/notebooks/langchain/Langchain-FunctionCalling.ipynb)

NOTE: To find more patterns and pre-built ModelCar images, take a look at the [Red Hat AI Services ModelCar Catalog repo](https://github.com/redhat-ai-services/modelcar-catalog) on GitHub and the [ModelCar Catalog registry](https://quay.io/repository/redhat-ai-services/modelcar-catalog) on Quay. 

## Requirements

### Minimum hardware requirements

- 1 GPU required (NVIDIA L40, A10, or similar)
- 8+ vCPUs
- 24+ GiB RAM
- Storage: 30Gi minimum in PVC (larger models may require more)

### Required software  

- Red Hat OpenShift 
- Red Hat OpenShift AI 2.16+
- Dependencies for [Single-model server](https://docs.redhat.com/en/documentation/red_hat_openshift_ai_self-managed/2.16/html/installing_and_uninstalling_openshift_ai_self-managed/installing-the-single-model-serving-platform_component-install#configuring-automated-installation-of-kserve_component-install):
    - Red Hat OpenShift Service Mesh
    - Red Hat OpenShift Serverless

### Required permissions

- Standard user. No elevated cluster permissions required 

## Install

**Please note before you start**

This example was tested on Red Hat OpenShift 4.16.24 & Red Hat OpenShift AI v2.16.2.  

### Clone the repository

```
git clone https://github.com/rh-ai-kickstart/vllm-tool-calling.git && \
    cd vllm-tool-calling/  
```

### Create the project

```bash
PROJECT="vllm-tool-calling-demo"

oc new-project ${PROJECT}
```

### Choose your LLM to be deployed

* For [Llama3.2-1B](https://huggingface.co/meta-llama/Llama-3.2-1B):

```
oc apply -k vllm-tool-calling/llama3.2-1b
```

* For [Granite3.2-8B](https://huggingface.co/ibm-granite/granite-3.2-8b-instruct):

```
oc apply -k vllm-tool-calling/llama3.2-3b
```

* For [Llama3.2-3B](https://huggingface.co/meta-llama/Llama-3.2-3B):

```
oc apply -k vllm-tool-calling/llama3.2-3b
```


### Check the deployment

* From the OpenShift Console, go to the App Switcher / Waffle and go to the Red Hat OpenShift AI Console.

* Once inside the dashboard, navigate to Data Science Projects -> vllm-tool-calling-demo (or what you called your ${PROJECT} if you changed from default):

![OpenShift AI Projects](assets/images/rhoai-1.png)

* Check the models deployed, and wait until you get the green tick in the Status, meaning that the model is deployed successfully:

![OpenShift AI Projects](assets/images/rhoai-2.png)
