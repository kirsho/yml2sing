# How to make a singularity image from a conda yaml file  

1. You must have singularity/apptainer installed

See https://github.com/kirsho/Singularity and https://apptainer.org/docs/user/main/quick_start.html. 

```
$ singularity --version
```
should output something like 
```
apptainer version 1.1.0
```

2. Get the yml2sing.sh script

- Option one, download from GitHub with wget
```
$ wget https://github.com/kirsho/yml2sing/raw/master/yml2sing.sh
```
should output something like: 
```
--2022-10-31 13:18:41--  https://github.com/kirsho/yml2sing/raw/master/yml2sing.sh
Certificat de l’autorité de certification « /etc/ssl/certs/ca-certificates.crt » chargé
Résolution de github.com (github.com)… 140.82.121.3
Connexion à github.com (github.com)|140.82.121.3|:443… connecté.
requête HTTP transmise, en attente de la réponse… 302 Found
Emplacement : https://raw.githubusercontent.com/kirsho/yml2sing/master/yml2sing.sh [suivant]
--2022-10-31 13:18:41--  https://raw.githubusercontent.com/kirsho/yml2sing/master/yml2sing.sh
Résolution de raw.githubusercontent.com (raw.githubusercontent.com)… 2606:50c0:8003::154, 2606:50c0:8002::154, 2606:50c0:8001::154, ...
Connexion à raw.githubusercontent.com (raw.githubusercontent.com)|2606:50c0:8003::154|:443… connecté.
requête HTTP transmise, en attente de la réponse… 200 OK
Taille : 1220 (1,2K) [text/plain]
Sauvegarde en : « yml2sing.sh »

yml2sing.sh                           100%[=========================================================================>]   1,19K  --.-KB/s    ds 0s      

2022-10-31 13:18:41 (33,1 MB/s) — « yml2sing.sh » sauvegardé [1220/1220]
```

- Option two, clone the whole repository
    
```
$ git clone https://github.com/kirsho/yml2sing
```
should output something like:
```
Clonage dans 'yml2sing'...
remote: Enumerating objects: 100, done.
remote: Counting objects: 100% (21/21), done.
remote: Compressing objects: 100% (21/21), done.
remote: Total 100 (delta 6), reused 0 (delta 0), pack-reused 79
Réception d'objets: 100% (100/100), 24.17 Kio | 2.42 Mio/s, fait.
Résolution des deltas: 100% (39/39), fait.
```

3. Put the yaml file of interest in the same directory (remove any other yaml file)

```
(base) [mag @ BI-platform 13:08]$ Singularity_RASflow_EDC : ll
total 200K
drwxr-xr-x 3 mag mag 4,0K 31 oct.  13:08 ./
drwxr-xr-x 4 mag mag 4,0K 31 oct.  11:12 ../
-rw-r--r-- 1 mag mag 1,1K 31 oct.  13:11 rasflow.yaml
-rw-r--r-- 1 mag mag 150K 31 oct.  13:08 yml2sing.sh
```

4. Make the script executable

```
$ chmod +x yml2sing.sh 
```

5. Run the script 
putting the name you want for the image

```
$ ./yml2sing.sh rasflow
```
Output a lot of things corresponding to what is made in the image: 
- update conda
- install mamba
- install rename
- install packages from the yaml file

You image is ready! Enjoy!

```
(base) [mag @ BI-platform 13:37]$ Singularity_RASflow_EDC : ll
total 1,7G
drwxr-xr-x 3 mag  mag  4,0K 31 oct.  13:34 ./
drwxr-xr-x 4 mag  mag  4,0K 31 oct.  11:12 ../
-rwxr-xr-x 1 root root 1,7G 31 oct.  13:34 rasflow.simg*
-rw-r--r-- 1 mag  mag  1,1K 31 oct.  13:11 rasflow.yaml
-rw-r--r-- 1 mag  mag  2,6K 31 oct.  13:23 Singularity
-rwxr-xr-x 1 mag  mag  1,2K 31 oct.  13:18 yml2sing.sh*
```
