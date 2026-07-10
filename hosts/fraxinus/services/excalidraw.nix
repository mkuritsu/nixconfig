{ ... }: {
  virtualisation.oci-containers.containers.excalidraw = {
    image = "excalidraw/excalidraw:latest";
    autoStart = true;
    ports = ["127.0.0.1:8082:80"];
    extraOptions = ["--label=io.containers.autoupdate=registry"];
  };
}
