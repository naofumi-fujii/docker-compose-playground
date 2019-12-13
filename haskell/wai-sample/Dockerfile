FROM matsubara0507/ubuntu-for-haskell
ARG local_bin_path
RUN mkdir -p /root/.local/bin && mkdir -p /root/work
ENV PATH /root/.local/bin:$PATH
ENV PORT=8080
EXPOSE 8080
WORKDIR /root/work
COPY ${local_bin_path} /root/.local/bin
CMD ["/root/.local/bin/wai-sample"]
