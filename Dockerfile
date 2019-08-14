FROM jupyter/minimal-notebook

USER root

COPY ./books ${HOME}/work
RUN chown -R ${NB_UID} ${HOME}

COPY ./ jupyter_c_kernel/
RUN pip install --no-cache-dir jupyter_c_kernel/
RUN cd jupyter_c_kernel && install_c_kernel --user

USER ${NB_USER}
WORKDIR ${HOME}/work