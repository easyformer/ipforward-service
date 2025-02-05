#!/bin/bash
#     ____     ######################################
#    /___/`    # ipforward-service.sh  
#    (O,O)     # Utilité: ce script sert à installer un service pour le routage
#   /(   )\    # Usage: ipforward-service.sh -option1 -option2 ... (Voir l'aide -h)
# --==M=M==--  # Auteur: Alex FALZON
#     Easy     # Mise à jour le: 05/02/2024
# F O R M E R  ######################################

#!/bin/bash

#Création d'un service pour activer le routage avec systemctl:


# Création du script d'activation du routage
cat <<EOF > /root/ipforwardstart.sh
#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Le routage est actif"
EOF

# Mise en place des droits d'execusion
chmod +x /root/ipforwardstart.sh

# Création du script de désactivation du routage
cat <<EOF > /root/ipforwardstop.sh
#!/bin/bash
echo 0 > /proc/sys/net/ipv4/ip_forward
echo "Le routage est inactif"
EOF

# Mise en place des droits d'execusion
chmod +x /root/ipforwardstop.sh

# Création du service
cat <<EOF > /etc/systemd/system/ipforward.service
[Unit]
Description=Activation du routage
After=network-online.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/root/ipforwardstart.sh
ExecStop=/root/ipforwardstop.sh
#Restart=on-failure

[Install]
WantedBy=multi-user.target

EOF

# Activation du routage ainsi qu'au démarrage
systemctl start ipforward
systemctl enable ipforward

# Afficahage des informations
echo "Le routage est maintenant actif ainsi qu'au démarrage."
echo "Vous pouvez utiliser les commandes suivantes :"
echo "systemctl start ipforward"
echo "systemctl restart ipforward"
echo "systemctl stop ipforward"
echo "systemctl enable ipforward"
echo "systemctl disable ipforward"
