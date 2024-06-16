# use tge following commands to set proper permissions on all quotable folders

sudo chown -R $USER:$USER /data
sudo chmod -R a=,a+rX,u+w,g+w /data


sudo mkdir -p /mnt/nvme && sudo mkdir -p /mnt/S418Anime && sudo mkdir -p /mnt/S418Photos && sudo mkdir -p /mnt/S418Photos_Raw && sudo mkdir -p /mnt/S418Videos && sudo mkdir -p /mnt/S418Misc && sudo mkdir -p /mnt/S918Gsuite_Backup && sudo mkdir -p /mnt/S918Photos && sudo mkdir -p /mnt/S918Movies && sudo mkdir -p /mnt/S918Movies2 && sudo mkdir -p /mnt/S918Series && sudo mkdir -p /mnt/S918Series2 && sudo mkdir -p /mnt/S918Music && sudo mkdir -p /mnt/S918Home && sudo mkdir -p /mnt/S918QnapShare && sudo mkdir -p /mnt/QAnime2 && sudo mkdir -p /mnt/QDownload && sudo mkdir -p /mnt/Qhome && sudo mkdir -p /mnt/QMovies2 && sudo mkdir -p /mnt/QMusic2 && sudo mkdir -p /mnt/QPhotos && sudo mkdir -p /mnt/QSeries2 && sudo mkdir -p /mnt/QMiscTemp && sudo mkdir -p /mnt/QMovies && sudo mkdir -p /mnt/QSeries && sudo mkdir -p /mnt/QExternalDrive
sudo ln -s /mnt/nvme/SSD /SSD
