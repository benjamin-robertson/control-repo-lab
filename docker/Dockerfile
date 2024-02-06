# https://hub.docker.com/_/microsoft-powershell and https://mcr.microsoft.com/v2/powershell/tags/list
FROM mcr.microsoft.com/powershell:latest

# Change the shell to use Powershell directly for our commands
# instead of englobing them with pwsh -Command "MY_COMMAND"
SHELL [ "pwsh", "-Command" ]

RUN \
    # Sets values for a registered module repository
    Set-PSRepository \
      -ErrorAction Stop           <# Action to take if a command fails #> \
      -InstallationPolicy Trusted <# Installation policy (Trusted, Untrusted) #> \
      -Name PSGallery             <# Name of the repository #> \
      -Verbose;                   <# Write verbose output #> \
    # Install PSScriptAnalyzer module (https://github.com/PowerShell/PSScriptAnalyzer/tags)
    Install-Module \
      -ErrorAction Stop \
      -Name PSScriptAnalyzer    <# Name of modules to install from the online gallery #> \
      -RequiredVersion 1.20.0   <# Exact version of a single module to install #> \
      -Verbose;

# Remove bash and symlink to pwsh. CD4PE always calls bash.
SHELL [ "/bin/sh" , "-c" ]
RUN \
  # remove bash force powershell
  rm /bin/sh; rm /bin/bash; ln -s /usr/bin/pwsh /bin/sh; ln -s /usr/bin/pwsh /bin/bash