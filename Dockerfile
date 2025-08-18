FROM public.ecr.aws/sagemaker/sagemaker-distribution:latest-cpu
ARG NB_USER="sagemaker-user"
ARG NB_UID=1000
ARG NB_GID=100
ENV MAMBA_USER=$NB_USER

USER root

# Verbose installation with specific version and build
RUN micromamba install -y --name base -c conda-forge \
    "sagemaker-code-editor=1.8.0b2=h4085919_0" \
    && micromamba list sagemaker-code-editor

USER $MAMBA_USER
ENTRYPOINT ["entrypoint-code-editor"]
