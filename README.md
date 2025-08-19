Please note that this is just a temporary workaround I came up with to help some people (https://github.com/aws/sagemaker-code-editor/issues/100) who were encountering this issue. While this is working for me I'm not sure I'd recommend this for production environments as there may be unfixed bugs, instability, or vulnerabilities. I have advocated based on the few customer requests I have seen in a few threads for the AWS Development Team to address this, and while it looks like they're actively working on it as you will be able to see below there still does not exist an official usable released image (to my knowledge). Thus, I decided to make this guide to showcase how you can do so, as recently this week I discovered this. Note that this is likely not an official or recommended solution, so do so at your own risk as there are bound to be some bugs as we are entering un-released territory.

If we use one of these commands we can search the current available sagemaker-code-editor (AWS made) images (these are to my knowledge then included later on in the SageMaker Distribution Image) on conda which are infinitly more than the default SageMaker Distribution Images as this includes all patches, edits, etc (not just final releases in the SageMaker Distribution Image).

E.g.
mamba search -c conda-forge sagemaker-code-editor

OR

conda search -c conda-forge sagemaker-code-editor

Which currently results in something like (18/08/2025):
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
sagemaker-code-editor         1.8.0b2      h4085919_0  conda-forge   < this is what I use in my Dockerfile as it's VSCode 1.100.2      
sagemaker-code-editor      1.8.0.dev0      h4085919_0  conda-forge   

As per also: https://anaconda.org/conda-forge/sagemaker-code-editor (again these are AWS made)

We can then search the releases here: https://github.com/aws/sagemaker-code-editor/releases (AWS made)

Where we notice that for instance CodeEditor v1.8.0b2 relates to: VS Code 1.100.2 with a latest release of 2 days ago (18/08/2025) which means that the Development Team is on top of this already, and currently working on an official image, but is just yet to release it.

For reference the latest Code OSS (what SageMaker uses) is 1.103. See: https://code.visualstudio.com/updates/v1_103
So this newest release for SageMaker Code Editor release is https://code.visualstudio.com/updates/v1_100 from April 2025 which is quite recent, but the latest SageMaker Distribution 3.4.0 still only uses 1.90 which is a painpoint particularly for extensions management (among others).

However, if we create a Custom Docker Image defining one of these versions above we can use this as per my Dockerfile in this repo.

E.g. the steps are quite simple (only takes 10-15 minutes) just:

Create an ECR Repo, then build the Dockerfile, and push it (build + push commands are automatically shown when you create ECR repo). < recommend using NBI with ECR permissions for this so you can use normal docker. NOT Studio NB as it uses sm-docker where you need codebuild for Docker instead which was a horrible change imo.

Attach and launch in SageMaker e.g. under your SageMaker Domain go to Environment then 'Custom images for personal Studio apps' add a new image.

After creating a space, and launching an App with this Image you should then get:
 
<img width="516" height="296" alt="image" src="https://github.com/user-attachments/assets/330eb372-cbaa-4a7a-92c7-7d0fab0c836b" />

You can then install relevant Extensions or other functionality as per the newest version of vscode. I've done lite testing of it using this and I didn't encounter any major bugs, but it looks like at least for me signitures are a little messed up. 

I hope this helps you all in this interim period before the full release (which looks to be in the near future), please feel free to let me know if it works. Create an issue, if you'd like to ask any questions, and I'll do my best to get back to you though note I have no affiiliation with making the above releases I'm just posting this to help you all out.
