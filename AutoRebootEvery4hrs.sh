## Add cron job to reboot server every 4 hrs

# write out current crontab (not applicable as it's the first job)
# sudo crontab -l > mycron

# echo new cron into cron file
sudo echo "0 */4 * * * /sbin/shutdown -r" >> mycron

# install new cron file
sudo crontab mycron

# remove file
sudo rm mycron
