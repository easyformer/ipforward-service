# ipforward-service
Script d'installation du service de routage

## Pour l'utiliser sur votre Débian ou Ubuntu tappez simplement:
    
    cd /root
    wget https://raw.githubusercontent.com/easyformer/ipforward-service/main/ipforward-service.sh
    chmod +x ipforward-service.sh
    ./ipforward-service.sh

## Le routage est maintenant actif ainsi qu'au démarrage.
Vous pouvez utiliser les commandes suivantes :
    
    systemctl start ipforward
    systemctl restart ipforward
    systemctl stop ipforward
    systemctl enable ipforward
    systemctl disable ipforward
