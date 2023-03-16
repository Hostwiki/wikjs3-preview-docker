This is a built image for Wiki.js 3 preview. The dockerfile is included incase you want ot build it yourself.  

### Do not use it in production. It is only for demo purposes.

```
docker pull ghcr.io/hostwiki/wikijs3-preview:latest
```

You can quickly try it with the example docker compose file.
```
git clone https://github.com/hostwiki/wikjs3-preview-docker
cd wikjs3-preview-docker
docker-compose up -d
```

Open your browser and access it via http://localhost:3000  
**The default administrator user login:**  
**Email:** admin@example.com  
**Password:** 12345678

The Wiki.js 3 preview branch is cloned from https://github.com/requarks/wiki/tree/vega.  
Please see the readme of that repo to know its current limitations.

### Dashboard

<img width="1653" alt="image" src="https://user-images.githubusercontent.com/16838612/225695890-24401928-ac3e-43ac-a32b-1a44d40c39f4.png">

