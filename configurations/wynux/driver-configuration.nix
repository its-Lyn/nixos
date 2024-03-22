{ config, pkgs, ... }:
{
  # Enable and Setup the NVIDIA drivers.
  services.xserver.videoDrivers = [
    "nvidia"
  ];

  # Setup hardware drivers
  hardware = {
    # ## Setup OpenGL ## #
    opengl = {
      enable = true;

      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      # Modesetting for kernel, needed by wayland.
      modesetting.enable = true;

      # Do not use the OSS NVIDIA kernel module.
      # NOTE: This is NOT nouveau.
      open = false;

      # Install the old and outdated NVIDIA settings app.
      # Its all we have though.
      nvidiaSettings = true;

      # NixOS has multiple NVIDIA driver version branches.
      # You can also use 'production'. Though stable is a bit older;
      # Its.. well.. stable.
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # NVIDIA PRIME setup.
      # You must run 'lshw -c Display' for this.
      prime = {
        # Enable sync. May switch to PRIME Sync later.
        reverseSync.enable = true;

        # ## Enable if using an external GPU ## #
        allowExternalGpu = false;

        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    # ## Setup Bluetooth ## #
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
