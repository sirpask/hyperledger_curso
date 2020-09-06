ejemplo1:

0 comandos imprescindibles en Docker

La mayoría de ellos ya han sido tratados en esta web, como en los artículos al respecto en la web de Colaboratorio.net, pero por separado, como patas necesarias de seres más grandes, como Docker Swarm, por poner un ejemplo.

Empecemos:

    docker ps – Muestra los contenedores en ejecución. Algunos parámetros útiles incluyen: -a o -all para todos los contenedores (los valores predeterminados solo se están ejecutando) y —quiet o -q para enumerar solo sus identificadores (útiles para cuando desea obtener todos los contenedores).

    docker pull: la mayoría de las imágenes que utilicemos se crearán sobre una imagen base del registro de Docker Hub. Docker Hub contiene muchas imágenes predefinidas que podemos utilizar sin necesidad de definir y configurar las nuestras; aunque cuando te pones no puedes parar, mola mucho crear nuestro propio Dockerfile Para descargar una imagen en particular, o un conjunto de imágenes (es decir, un repositorio), usaremos docker pull

    docker build: el comando de construcción de docker crea imágenes de Docker desde un Dockerfile y un “contexto”. Este contexto, de una construcción, es el conjunto de archivos ubicados en la ruta de acceso o la URL especificada. Debemos utilizar el parámetro -t para etiquetar la imagen, por ejemplo, compilación de docker -t mi contenedor, con el “.” al final de la señalización para construir utilizando el directorio actual. Si quieres saber más puedes consultar la entrada que escribí sobre Dockerfile.

    docker run: ejecuta un contenedor basado en una imagen, podemos seguir esto con otros parámetros, como -it bash para luego ejecutar bash dentro del contenedor.

    docker logs: usamos este comando para mostrar los registros de un contenedor, debemos especificar un contenedor y podmeos utilizar parámetros, como –follow para seguir la salida en los registros de uso del programa. registros de la ventana acoplable –seguir mi_contenedor. Un ejemplo sería docker logs --follow mi_contenedor

    docker volume ls : Lista los volúmenes, que son el sistema habitual para conservar los datos generados y utilizados por los contenedores.

    docker rm: Elimina uno o más contenedores. Un ejemplo: docker rm mi_contenedor

    docker rmi: Elimina una o más imágenes. Un ejemplo: docker rmi mi_imágen

    docker stop: detiene uno o más contenedores. docker stop mi_contenedor detiene un contenedor, mientras que docker stop $(docker ps -a -q) detiene todos los contenedores en ejecución.

    Podemos utilizar los comandos de manera conjunta, por ejemplo, para limpiar todas sus imágenes y contenedores:

10.1 Eliminar todos los contenedores en ejecución:	

docker kill $(docker ps -q)

10.2 Borrar todos los contenedores parados:

docker rm $(docker ps -a -q)

10.3 Borrar todas las imágenes:

docker rmi $(docker images -q)

Y esto es todo. 

//////////////////////////ejemplo2

Descargar imagen docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker pull ubuntu

Using default tag: latest

latest: Pulling from library/ubuntu

473ede7ed136: Pull complete

c46b5fa4d940: Pull complete

93ae3df89c92: Pull complete

6b1eed27cade: Pull complete

Digest: sha256:29934af957c53004d7fb6340139880d23fb1952505a15d69a03af0d1418878cb

Status: Downloaded newer image for ubuntu:latest

	
MacBook-Pro-de-Raul:~ raulunzue$ docker pull ubuntu
 
Using default tag: latest
 
latest: Pulling from library/ubuntu
 
473ede7ed136: Pull complete
 
c46b5fa4d940: Pull complete
 
93ae3df89c92: Pull complete
 
6b1eed27cade: Pull complete
 
Digest: sha256:29934af957c53004d7fb6340139880d23fb1952505a15d69a03af0d1418878cb
 
Status: Downloaded newer image for ubuntu:latest

Crear docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker run -dP nginx

Unable to find image 'nginx:latest' locally

latest: Pulling from library/nginx

f17d81b4b692: Pull complete

d5c237920c39: Pull complete

a381f92f36de: Pull complete

Digest: sha256:b73f527d86e3461fd652f62cf47e7b375196063bbbd503e853af5be16597cb2e

Status: Downloaded newer image for nginx:latest

c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
	
MacBook-Pro-de-Raul:~ raulunzue$ docker run -dP nginx
 
Unable to find image 'nginx:latest' locally
 
latest: Pulling from library/nginx
 
f17d81b4b692: Pull complete
 
d5c237920c39: Pull complete
 
a381f92f36de: Pull complete
 
Digest: sha256:b73f527d86e3461fd652f62cf47e7b375196063bbbd503e853af5be16597cb2e
 
Status: Downloaded newer image for nginx:latest
 
c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16

Listar dockers:
MacBook-Pro-de-Raul:~ raulunzue$ docker ps

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

c00e7f5a2bc3 nginx "nginx -g 'daemon of…" 28 seconds ago Up 26 seconds 0.0.0.0:32768-&gt;80/tcp gifted_brattain
1
2
3
4
5
	
MacBook-Pro-de-Raul:~ raulunzue$ docker ps
 
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
 
c00e7f5a2bc3 nginx "nginx -g 'daemon of…" 28 seconds ago Up 26 seconds 0.0.0.0:32768-&gt;80/tcp gifted_brattain

Listado de puertos donde escucha un docker concreto:
MacBook-Pro-de-Raul:~ raulunzue$ docker port c00e7f5a2bc3

80/tcp -&gt; 0.0.0.0:32768
1
2
3
	
MacBook-Pro-de-Raul:~ raulunzue$ docker port c00e7f5a2bc3
 
80/tcp -&gt; 0.0.0.0:32768

Para un solo puerto:
MacBook-Pro-de-Raul:~ raulunzue$ docker port c00e7f5a2bc3 80

0.0.0.0:32768
1
2
3
	
MacBook-Pro-de-Raul:~ raulunzue$ docker port c00e7f5a2bc3 80
 
0.0.0.0:32768

Listados de procesos que se ejecutan dentro de un docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker top c00e7f5a2bc3

PID USER TIME COMMAND

2782 root 0:00 nginx: master process nginx -g daemon off;

2821 101 0:00 nginx: worker process
1
2
3
4
5
6
7
	
MacBook-Pro-de-Raul:~ raulunzue$ docker top c00e7f5a2bc3
 
PID USER TIME COMMAND
 
2782 root 0:00 nginx: master process nginx -g daemon off;
 
2821 101 0:00 nginx: worker process

Datos completos de un docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker inspect c00e7f5a2bc3

[

{

"Id": "c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16",

"Created": "2018-10-21T20:36:35.893293565Z",

"Path": "nginx",

"Args": [

"-g",

"daemon off;"

],

"State": {

"Status": "running",

"Running": true,

"Paused": false,

"Restarting": false,

"OOMKilled": false,

"Dead": false,

"Pid": 2782,

"ExitCode": 0,

"Error": "",

"StartedAt": "2018-10-21T20:36:36.474874421Z",

"FinishedAt": "0001-01-01T00:00:00Z"

},

"Image": "sha256:dbfc48660aeb7ef0ebd74b4a7e0822520aba5416556ee43acb9a6350372e516f",

"ResolvConfPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/resolv.conf",

"HostnamePath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/hostname",

"HostsPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/hosts",

"LogPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16-json.log",

"Name": "/gifted_brattain",

"RestartCount": 0,

"Driver": "overlay2",

"Platform": "linux",

"MountLabel": "",

"ProcessLabel": "",

"AppArmorProfile": "",

"ExecIDs": null,

"HostConfig": {

"Binds": null,

"ContainerIDFile": "",

"LogConfig": {

"Type": "json-file",

"Config": {}

},

"NetworkMode": "default",

"PortBindings": {},

"RestartPolicy": {

"Name": "no",

"MaximumRetryCount": 0

},

"AutoRemove": false,

"VolumeDriver": "",

"VolumesFrom": null,

"CapAdd": null,

"CapDrop": null,

"Dns": [],

"DnsOptions": [],

"DnsSearch": [],

"ExtraHosts": null,

"GroupAdd": null,

"IpcMode": "shareable",

"Cgroup": "",

"Links": null,

"OomScoreAdj": 0,

"PidMode": "",

"Privileged": false,

"PublishAllPorts": true,

"ReadonlyRootfs": false,

"SecurityOpt": null,

"UTSMode": "",

"UsernsMode": "",

"ShmSize": 67108864,

"Runtime": "runc",

"ConsoleSize": [

0,

0,

"Isolation": "",

"CpuShares": 0,

"Memory": 0,

"NanoCpus": 0,

"CgroupParent": "",

"BlkioWeight": 0,

"BlkioWeightDevice": [],

"BlkioDeviceReadBps": null,

"BlkioDeviceWriteBps": null,

"BlkioDeviceReadIOps": null,

"BlkioDeviceWriteIOps": null,

"CpuPeriod": 0,

"CpuQuota": 0,

"CpuRealtimePeriod": 0,

"CpuRealtimeRuntime": 0,

"CpusetCpus": "",

"CpusetMems": "",

"Devices": [],

"DeviceCgroupRules": null,

"DiskQuota": 0,

"KernelMemory": 0,

"MemoryReservation": 0,

"MemorySwap": 0,

"MemorySwappiness": null,

"OomKillDisable": false,

"PidsLimit": 0,

"Ulimits": null,

"CpuCount": 0,

"CpuPercent": 0,

"IOMaximumIOps": 0,

"IOMaximumBandwidth": 0,

"MaskedPaths": [

"/proc/acpi",

"/proc/kcore",

"/proc/keys",

"/proc/latency_stats",

"/proc/timer_list",

"/proc/timer_stats",

"/proc/sched_debug",

"/proc/scsi",

"/sys/firmware"

],

"ReadonlyPaths": [

"/proc/asound",

"/proc/bus",

"/proc/fs",

"/proc/irq",

"/proc/sys",

"/proc/sysrq-trigger"

]

},

"GraphDriver": {

"Data": {

"LowerDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5-init/diff:/var/lib/docker/overlay2/2074906a5f97124a932718751a2d62a9c2e340c5ce65a10b35958882dd9f774c/diff:/var/lib/docker/overlay2/0c093bc70eaca43e72b7f885fe2e3c5b2fa7a39f717992e82825d6c71372fa83/diff:/var/lib/docker/overlay2/1a6eff41ad6f6e62926f1b90ce8b5fcac2177064e927358c6e4bcc1bad60f842/diff",

"MergedDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/merged",

"UpperDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/diff",

"WorkDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/work"

},

"Name": "overlay2"

},

"Mounts": [],

"Config": {

"Hostname": "c00e7f5a2bc3",

"Domainname": "",

"User": "",

"AttachStdin": false,

"AttachStdout": false,

"AttachStderr": false,

"ExposedPorts": {

"80/tcp": {}

},

"Tty": false,

"OpenStdin": false,

"StdinOnce": false,

"Env": [

"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",

"NGINX_VERSION=1.15.5-1~stretch",

"NJS_VERSION=1.15.5.0.2.4-1~stretch"

],

"Cmd": [

"nginx",

"-g",

"daemon off;"

],

"ArgsEscaped": true,

"Image": "nginx",

"Volumes": null,

"WorkingDir": "",

"Entrypoint": null,

"OnBuild": null,

"Labels": {

"maintainer": "NGINX Docker Maintainers &lt;docker-maint@nginx.com&gt;"

},

"StopSignal": "SIGTERM"

},

"NetworkSettings": {

"Bridge": "",

"SandboxID": "994b602110210fb1275422722d1b95f30b7483a5007d807a878fcfbba552f89c",

"HairpinMode": false,

"LinkLocalIPv6Address": "",

"LinkLocalIPv6PrefixLen": 0,

"Ports": {

"80/tcp": [

{

"HostIp": "0.0.0.0",

"HostPort": "32768"

}

]

},

"SandboxKey": "/var/run/docker/netns/994b60211021",

"SecondaryIPAddresses": null,

"SecondaryIPv6Addresses": null,

"EndpointID": "3fda8911087022b81a4bace0bada0206645923a9d624a7e1b061774c0b79ea58",

"Gateway": "172.17.0.1",

"GlobalIPv6Address": "",

"GlobalIPv6PrefixLen": 0,

"IPAddress": "172.17.0.2",

"IPPrefixLen": 16,

"IPv6Gateway": "",

"MacAddress": "02:42:ac:11:00:02",

"Networks": {

"bridge": {

"IPAMConfig": null,

"Links": null,

"Aliases": null,

"NetworkID": "e2a50c2c60871127e6cb625108f8f76cf7512907f656d4601ba4b869f7ccb722",

"EndpointID": "3fda8911087022b81a4bace0bada0206645923a9d624a7e1b061774c0b79ea58",

"Gateway": "172.17.0.1",

"IPAddress": "172.17.0.2",

"IPPrefixLen": 16,

"IPv6Gateway": "",

"GlobalIPv6Address": "",

"GlobalIPv6PrefixLen": 0,

"MacAddress": "02:42:ac:11:00:02",

"DriverOpts": null

}

    }

  }

}

]
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
293
294
295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
319
320
321
322
323
324
325
326
327
328
329
330
331
332
333
334
335
336
337
338
339
340
341
342
343
344
345
346
347
348
349
350
351
352
353
354
355
356
357
358
359
360
361
362
363
364
365
366
367
368
369
370
371
372
373
374
375
376
377
378
379
380
381
382
383
384
385
386
387
388
389
390
391
392
393
394
395
396
397
398
399
400
401
402
403
404
405
406
407
408
409
410
411
412
413
414
415
416
417
418
419
420
421
422
423
424
425
426
427
428
429
	
MacBook-Pro-de-Raul:~ raulunzue$ docker inspect c00e7f5a2bc3
 
[
 
{
 
"Id": "c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16",
 
"Created": "2018-10-21T20:36:35.893293565Z",
 
"Path": "nginx",
 
"Args": [
 
"-g",
 
"daemon off;"
 
],
 
"State": {
 
"Status": "running",
 
"Running": true,
 
"Paused": false,
 
"Restarting": false,
 
"OOMKilled": false,
 
"Dead": false,
 
"Pid": 2782,
 
"ExitCode": 0,
 
"Error": "",
 
"StartedAt": "2018-10-21T20:36:36.474874421Z",
 
"FinishedAt": "0001-01-01T00:00:00Z"
 
},
 
"Image": "sha256:dbfc48660aeb7ef0ebd74b4a7e0822520aba5416556ee43acb9a6350372e516f",
 
"ResolvConfPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/resolv.conf",
 
"HostnamePath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/hostname",
 
"HostsPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/hosts",
 
"LogPath": "/var/lib/docker/containers/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16/c00e7f5a2bc3d979d2fcd57d7ed8e5baab95224994ddc4fe41ee26fad1683e16-json.log",
 
"Name": "/gifted_brattain",
 
"RestartCount": 0,
 
"Driver": "overlay2",
 
"Platform": "linux",
 
"MountLabel": "",
 
"ProcessLabel": "",
 
"AppArmorProfile": "",
 
"ExecIDs": null,
 
"HostConfig": {
 
"Binds": null,
 
"ContainerIDFile": "",
 
"LogConfig": {
 
"Type": "json-file",
 
"Config": {}
 
},
 
"NetworkMode": "default",
 
"PortBindings": {},
 
"RestartPolicy": {
 
"Name": "no",
 
"MaximumRetryCount": 0
 
},
 
"AutoRemove": false,
 
"VolumeDriver": "",
 
"VolumesFrom": null,
 
"CapAdd": null,
 
"CapDrop": null,
 
"Dns": [],
 
"DnsOptions": [],
 
"DnsSearch": [],
 
"ExtraHosts": null,
 
"GroupAdd": null,
 
"IpcMode": "shareable",
 
"Cgroup": "",
 
"Links": null,
 
"OomScoreAdj": 0,
 
"PidMode": "",
 
"Privileged": false,
 
"PublishAllPorts": true,
 
"ReadonlyRootfs": false,
 
"SecurityOpt": null,
 
"UTSMode": "",
 
"UsernsMode": "",
 
"ShmSize": 67108864,
 
"Runtime": "runc",
 
"ConsoleSize": [
 
0,
 
0,
 
"Isolation": "",
 
"CpuShares": 0,
 
"Memory": 0,
 
"NanoCpus": 0,
 
"CgroupParent": "",
 
"BlkioWeight": 0,
 
"BlkioWeightDevice": [],
 
"BlkioDeviceReadBps": null,
 
"BlkioDeviceWriteBps": null,
 
"BlkioDeviceReadIOps": null,
 
"BlkioDeviceWriteIOps": null,
 
"CpuPeriod": 0,
 
"CpuQuota": 0,
 
"CpuRealtimePeriod": 0,
 
"CpuRealtimeRuntime": 0,
 
"CpusetCpus": "",
 
"CpusetMems": "",
 
"Devices": [],
 
"DeviceCgroupRules": null,
 
"DiskQuota": 0,
 
"KernelMemory": 0,
 
"MemoryReservation": 0,
 
"MemorySwap": 0,
 
"MemorySwappiness": null,
 
"OomKillDisable": false,
 
"PidsLimit": 0,
 
"Ulimits": null,
 
"CpuCount": 0,
 
"CpuPercent": 0,
 
"IOMaximumIOps": 0,
 
"IOMaximumBandwidth": 0,
 
"MaskedPaths": [
 
"/proc/acpi",
 
"/proc/kcore",
 
"/proc/keys",
 
"/proc/latency_stats",
 
"/proc/timer_list",
 
"/proc/timer_stats",
 
"/proc/sched_debug",
 
"/proc/scsi",
 
"/sys/firmware"
 
],
 
"ReadonlyPaths": [
 
"/proc/asound",
 
"/proc/bus",
 
"/proc/fs",
 
"/proc/irq",
 
"/proc/sys",
 
"/proc/sysrq-trigger"
 
]
 
},
 
"GraphDriver": {
 
"Data": {
 
"LowerDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5-init/diff:/var/lib/docker/overlay2/2074906a5f97124a932718751a2d62a9c2e340c5ce65a10b35958882dd9f774c/diff:/var/lib/docker/overlay2/0c093bc70eaca43e72b7f885fe2e3c5b2fa7a39f717992e82825d6c71372fa83/diff:/var/lib/docker/overlay2/1a6eff41ad6f6e62926f1b90ce8b5fcac2177064e927358c6e4bcc1bad60f842/diff",
 
"MergedDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/merged",
 
"UpperDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/diff",
 
"WorkDir": "/var/lib/docker/overlay2/019b13c97d5f2256641ad8d10bcd6f647edac429f6341a0aaef9ec69131d3ab5/work"
 
},
 
"Name": "overlay2"
 
},
 
"Mounts": [],
 
"Config": {
 
"Hostname": "c00e7f5a2bc3",
 
"Domainname": "",
 
"User": "",
 
"AttachStdin": false,
 
"AttachStdout": false,
 
"AttachStderr": false,
 
"ExposedPorts": {
 
"80/tcp": {}
 
},
 
"Tty": false,
 
"OpenStdin": false,
 
"StdinOnce": false,
 
"Env": [
 
"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
 
"NGINX_VERSION=1.15.5-1~stretch",
 
"NJS_VERSION=1.15.5.0.2.4-1~stretch"
 
],
 
"Cmd": [
 
"nginx",
 
"-g",
 
"daemon off;"
 
],
 
"ArgsEscaped": true,
 
"Image": "nginx",
 
"Volumes": null,
 
"WorkingDir": "",
 
"Entrypoint": null,
 
"OnBuild": null,
 
"Labels": {
 
"maintainer": "NGINX Docker Maintainers &lt;docker-maint@nginx.com&gt;"
 
},
 
"StopSignal": "SIGTERM"
 
},
 
"NetworkSettings": {
 
"Bridge": "",
 
"SandboxID": "994b602110210fb1275422722d1b95f30b7483a5007d807a878fcfbba552f89c",
 
"HairpinMode": false,
 
"LinkLocalIPv6Address": "",
 
"LinkLocalIPv6PrefixLen": 0,
 
"Ports": {
 
"80/tcp": [
 
{
 
"HostIp": "0.0.0.0",
 
"HostPort": "32768"
 
}
 
]
 
},
 
"SandboxKey": "/var/run/docker/netns/994b60211021",
 
"SecondaryIPAddresses": null,
 
"SecondaryIPv6Addresses": null,
 
"EndpointID": "3fda8911087022b81a4bace0bada0206645923a9d624a7e1b061774c0b79ea58",
 
"Gateway": "172.17.0.1",
 
"GlobalIPv6Address": "",
 
"GlobalIPv6PrefixLen": 0,
 
"IPAddress": "172.17.0.2",
 
"IPPrefixLen": 16,
 
"IPv6Gateway": "",
 
"MacAddress": "02:42:ac:11:00:02",
 
"Networks": {
 
"bridge": {
 
"IPAMConfig": null,
 
"Links": null,
 
"Aliases": null,
 
"NetworkID": "e2a50c2c60871127e6cb625108f8f76cf7512907f656d4601ba4b869f7ccb722",
 
"EndpointID": "3fda8911087022b81a4bace0bada0206645923a9d624a7e1b061774c0b79ea58",
 
"Gateway": "172.17.0.1",
 
"IPAddress": "172.17.0.2",
 
"IPPrefixLen": 16,
 
"IPv6Gateway": "",
 
"GlobalIPv6Address": "",
 
"GlobalIPv6PrefixLen": 0,
 
"MacAddress": "02:42:ac:11:00:02",
 
"DriverOpts": null
 
}
 
    }
 
  }
 
}
 
]

No hace falta sacar toda la información, sino que podemos filtrar, si por ejemplo nos interesa la IP:
MacBook-Pro-de-Raul:~ raulunzue$ docker inspect -f '{{ .NetworkSettings.IPAddress }}' c00e7f5a2bc3

172.17.0.2
1
2
3
	
MacBook-Pro-de-Raul:~ raulunzue$ docker inspect -f '{{ .NetworkSettings.IPAddress }}' c00e7f5a2bc3
 
172.17.0.2

Arrancar y parar docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker stop c00e7f5a2bc3

c00e7f5a2bc3

MacBook-Pro-de-Raul:~ raulunzue$ docker start c00e7f5a2bc3

c00e7f5a2bc3
1
2
3
4
5
6
7
	
MacBook-Pro-de-Raul:~ raulunzue$ docker stop c00e7f5a2bc3
 
c00e7f5a2bc3
 
MacBook-Pro-de-Raul:~ raulunzue$ docker start c00e7f5a2bc3
 
c00e7f5a2bc3

Listado completo de dockers:

MacBook-Pro-de-Raul:~ raulunzue$ docker ps -a

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

c00e7f5a2bc3 nginx "nginx -g 'daemon of…" 26 minutes ago Up About a minute 0.0.0.0:32769-&gt;80/tcp gifted_brattain

342bfebbb64b ubuntu "ubuntu" 30 minutes ago Created keen_bhabha

bed24109c25c ubuntu "bash" 35 minutes ago Exited (0) 33 minutes ago xenodochial_noyce

6b729b14798b ubuntu "/bin/bash" 36 minutes ago Exited (0) 36 minutes ago happy_kare

ec01727ea48a ubuntu "bash" 36 minutes ago Created eager_tereshkova

6f3065888608 microsoft/powershell:latest "powershell" About an hour ago Created awesome_euler

3987ff6a6ebe microsoft/powershell "powershell" About an hour ago Created priceless_brown

a52475de6369 microsoft/powershell "pwsh" About an hour ago Exited (0) About an hour ago peaceful_dubinsky

f155b9e2745b microsoft/powershell "powershell" About an hour ago Created pensive_stallman

92cb0e7e0e37 microsoft/powershell "powershell" About an hour ago Created quizzical_pare

7d11a5dc4cfc microsoft/powershell "pwsh" About an hour ago Exited (0) About an hour ago vibrant_mccarthy

55312ed17bb9 microsoft/powershell:latest "powershell" About an hour ago Created epic_pike
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
	
Listado completo de dockers:
 
MacBook-Pro-de-Raul:~ raulunzue$ docker ps -a
 
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
 
c00e7f5a2bc3 nginx "nginx -g 'daemon of…" 26 minutes ago Up About a minute 0.0.0.0:32769-&gt;80/tcp gifted_brattain
 
342bfebbb64b ubuntu "ubuntu" 30 minutes ago Created keen_bhabha
 
bed24109c25c ubuntu "bash" 35 minutes ago Exited (0) 33 minutes ago xenodochial_noyce
 
6b729b14798b ubuntu "/bin/bash" 36 minutes ago Exited (0) 36 minutes ago happy_kare
 
ec01727ea48a ubuntu "bash" 36 minutes ago Created eager_tereshkova
 
6f3065888608 microsoft/powershell:latest "powershell" About an hour ago Created awesome_euler
 
3987ff6a6ebe microsoft/powershell "powershell" About an hour ago Created priceless_brown
 
a52475de6369 microsoft/powershell "pwsh" About an hour ago Exited (0) About an hour ago peaceful_dubinsky
 
f155b9e2745b microsoft/powershell "powershell" About an hour ago Created pensive_stallman
 
92cb0e7e0e37 microsoft/powershell "powershell" About an hour ago Created quizzical_pare
 
7d11a5dc4cfc microsoft/powershell "pwsh" About an hour ago Exited (0) About an hour ago vibrant_mccarthy
 
55312ed17bb9 microsoft/powershell:latest "powershell" About an hour ago Created epic_pike

Borrar docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker rm 55312ed17bb9

55312ed17bb9
1
2
3
	
MacBook-Pro-de-Raul:~ raulunzue$ docker rm 55312ed17bb9
 
55312ed17bb9
Conectarnos a un docker:
MacBook-Pro-de-Raul:~ raulunzue$ docker exec -it c00e7f5a2bc3 bash

root@c00e7f5a2bc3:/#
1
2
3
	
MacBook-Pro-de-Raul:~ raulunzue$ docker exec -it c00e7f5a2bc3 bash
 
root@c00e7f5a2bc3:/#
Listar imágenes:
MacBook-Pro-de-Raul:~ raulunzue$ docker images

REPOSITORY TAG IMAGE ID CREATED SIZE

ubuntu latest ea4c82dcd15a 2 days ago 85.8MB

microsoft/powershell latest bcea40fb0698 3 days ago 367MB

nginx latest dbfc48660aeb 5 days ago 109MB
1
2
3
4
5
6
7
8
9
	
MacBook-Pro-de-Raul:~ raulunzue$ docker images
 
REPOSITORY TAG IMAGE ID CREATED SIZE
 
ubuntu latest ea4c82dcd15a 2 days ago 85.8MB
 
microsoft/powershell latest bcea40fb0698 3 days ago 367MB
 
nginx latest dbfc48660aeb 5 days ago 109MB
Borrar imágenes:
MacBook-Pro-de-Raul:~ raulunzue$ docker rmi microsoft/powershell

Untagged: microsoft/powershell:latest

Untagged: microsoft/powershell@sha256:aa40473517065cb766ed856480872d83e699897fb0c1c7cba466354bc691dbcc

Deleted: sha256:bcea40fb06989362354efe5856e5eb01ed671a7795144eacf2971c545b32513f

Deleted: sha256:c5cc0315685a4ecac4230cc813acd94579de89eb59d98774788b82a078db27b7

Deleted: sha256:494d05711714c98ae0037595868fe70b103d883870f67924b2908a3f848386d3

Deleted: sha256:2416e906f135eea2d08b4a8a8ae539328482eacb6cf39100f7c8f99e98a78d84

Deleted: sha256:7f8291c73f3ecc4dc9317076ad01a567dd44510e789242368cd061c709e0e36d

Deleted: sha256:4b3d88bd6e729deea28b2390d1ddfdbfa3db603160a1129f06f85f26e7bcf4a2

Deleted: sha256:f51700a4e396a235cee37249ffc260cdbeb33268225eb8f7345970f5ae309312

Deleted: sha256:a30b835850bfd4c7e9495edf7085cedfad918219227c7157ff71e8afe2661f63
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
	
MacBook-Pro-de-Raul:~ raulunzue$ docker rmi microsoft/powershell
 
Untagged: microsoft/powershell:latest
 
Untagged: microsoft/powershell@sha256:aa40473517065cb766ed856480872d83e699897fb0c1c7cba466354bc691dbcc
 
Deleted: sha256:bcea40fb06989362354efe5856e5eb01ed671a7795144eacf2971c545b32513f
 
Deleted: sha256:c5cc0315685a4ecac4230cc813acd94579de89eb59d98774788b82a078db27b7
 
Deleted: sha256:494d05711714c98ae0037595868fe70b103d883870f67924b2908a3f848386d3
 
Deleted: sha256:2416e906f135eea2d08b4a8a8ae539328482eacb6cf39100f7c8f99e98a78d84
 
Deleted: sha256:7f8291c73f3ecc4dc9317076ad01a567dd44510e789242368cd061c709e0e36d
 
Deleted: sha256:4b3d88bd6e729deea28b2390d1ddfdbfa3db603160a1129f06f85f26e7bcf4a2
 
Deleted: sha256:f51700a4e396a235cee37249ffc260cdbeb33268225eb8f7345970f5ae309312
 
Deleted: sha256:a30b835850bfd4c7e9495edf7085cedfad918219227c7157ff71e8afe2661f63

