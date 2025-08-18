If we use one of these commands we can search the current available sagemaker-code-editor distribution images.
mamba search -c conda-forge sagemaker-code-editor

conda search -c conda-forge sagemaker-code-editor

Which currently results in:
Loading channels: done
# Name                       Version           Build  Channel             
sagemaker-code-editor           0.1.0      hcb28a07_2  conda-forge         
sagemaker-code-editor           0.1.0      hcb28a07_3  conda-forge         
sagemaker-code-editor           0.1.0      hcb28a07_4  conda-forge         
sagemaker-code-editor           1.0.0      hcb28a07_0  conda-forge         
sagemaker-code-editor       1.0.1dev0      hcb28a07_0  conda-forge         
sagemaker-code-editor       1.0.1dev0      hcb28a07_1  conda-forge         
sagemaker-code-editor           1.0.1      hcb28a07_0  conda-forge         
sagemaker-code-editor           1.0.1      hcb28a07_1  conda-forge         
sagemaker-code-editor           1.1.0      hcb28a07_0  conda-forge         
sagemaker-code-editor           1.1.2      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.1.2      h3e77e23_1  conda-forge         
sagemaker-code-editor           1.1.2      h3e77e23_2  conda-forge         
sagemaker-code-editor           1.1.3      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.1.4      h3e77e23_0  conda-forge         
sagemaker-code-editor       1.1.5dev0      h3e77e23_0  conda-forge         
sagemaker-code-editor       1.1.5dev0      h3e77e23_1  conda-forge         
sagemaker-code-editor           1.1.5      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.2.0      hcb28a07_0  conda-forge         
sagemaker-code-editor           1.3.0      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.3.1      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.3.2      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.3.3      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.3.4      h3e77e23_0  conda-forge         
sagemaker-code-editor       1.3.5dev0      h3e77e23_0  conda-forge         
sagemaker-code-editor       1.3.5dev0      h3e77e23_1  conda-forge         
sagemaker-code-editor           1.3.5      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.4.0      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.4.1      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.4.2      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.4.3      h3e77e23_3  conda-forge         
sagemaker-code-editor           1.5.0      h3e77e23_0  conda-forge         
sagemaker-code-editor           1.5.0      h3e77e23_1  conda-forge         
sagemaker-code-editor           1.5.0      h3e77e23_2  conda-forge         
sagemaker-code-editor           1.5.0      h3e77e23_3  conda-forge         
sagemaker-code-editor           1.5.1      h4085919_0  conda-forge         
sagemaker-code-editor           1.6.0      h3e77e23_3  conda-forge         
sagemaker-code-editor           1.6.1      h4085919_0  conda-forge         
sagemaker-code-editor           1.6.2      h4085919_0  conda-forge         
sagemaker-code-editor           1.7.0      h4085919_0  conda-forge         
sagemaker-code-editor           1.7.1      h4085919_0  conda-forge         
sagemaker-code-editor         1.8.0b1      h4085919_0  conda-forge         
sagemaker-code-editor         1.8.0b2      h4085919_0  conda-forge         
sagemaker-code-editor      1.8.0.dev0      h4085919_0  conda-forge   

As per also: https://anaconda.org/conda-forge/sagemaker-code-editor

We can then search the releases here: https://github.com/aws/sagemaker-code-editor/releases

Where we notice that for instance CodeEditor v1.8.0b2 relates to: VS Code 1.100.2

If we create a Custom Docker Image we can use this as per my Dockerfile in this repo.

E.g. steps:

Create an ECR Repo, then build the Dockerfile, and push it. 

Attach and launch in SageMaker.

You should then get:
<img width="516" height="296" alt="image" src="https://github.com/user-attachments/assets/330eb372-cbaa-4a7a-92c7-7d0fab0c836b" />
