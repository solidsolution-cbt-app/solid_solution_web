'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "9af5b6b0f18c8a3bf29d6162d392dac2",
"icons/Icon-192.png": "90181c40c1344b1152210dea7fce4ab5",
"icons/Icon-maskable-192.png": "90181c40c1344b1152210dea7fce4ab5",
"icons/Icon-512.png": "4d6465c1a1b499a1671f5f2daab6bf23",
"icons/Icon-maskable-512.png": "4d6465c1a1b499a1671f5f2daab6bf23",
"assets/FontManifest.json": "0d3ae9f81d7395be3b31e38a3d155536",
"assets/AssetManifest.bin": "cd0f2685376200359f286799bf837a2a",
"assets/AssetManifest.bin.json": "2555ef383a392b4e8f96da0722fcdf1e",
"assets/asset/svg/call.svg": "b6140f0516f8142a031fc162d9e44627",
"assets/asset/svg/lock.svg": "1eed1cb5c3673b905d8042c76f86c86d",
"assets/asset/svg/book-square%2520outline.svg": "59a61f1433832260b0aba8159f75d179",
"assets/asset/svg/book-square.svg": "5d2bd98f3770003f9fb15ad5ac750979",
"assets/asset/images/app_logo.png": "71ef28d7009a36ca7bf1b640f29fd9e4",
"assets/asset/images/empty_widget.png": "0e82dc2ac98faf82161c30a0192a689a",
"assets/asset/images/login.png": "d3bc8d314b8a54426ca6071669545545",
"assets/asset/font/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/asset/font/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/asset/font/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/asset/font/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/asset/font/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/asset/font/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/asset/font/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/asset/font/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/asset/font/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/asset/font/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/asset/font/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/asset/font/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/asset/font/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/asset/font/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/asset/font/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/asset/font/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/asset/lottie_animation/error_lottie.json": "863034ec7c7435cfd7e4a2ea00254815",
"assets/asset/lottie_animation/lottie_success.json": "53cc24822d7de2ae478943a9237438d6",
"assets/asset/lottie_animation/animation_loader.json": "0c2b668aa479882eadf547fcab69c818",
"assets/asset/lottie_animation/error_2.json": "813262d171bb3ab5a51fe5ddd461dcdd",
"assets/AssetManifest.json": "b1f53d47d4b0b61477d056f42514a8db",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "093d2cde7075fcffb24ab215668d0da2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5ac99533bd9dc46227434b4853c3e532",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "1e17b1ec3152f29bf783bd42db8b6023",
"assets/fonts/MaterialIcons-Regular.otf": "36cbc1f5dea9a2346af2d83204ee607f",
"assets/NOTICES": "b30a870e0a5e183520b13309a834b9ce",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"index.html": "7d8a41e251adb433c61273e1b2915d56",
"/": "7d8a41e251adb433c61273e1b2915d56",
"main.dart.js": "f238df9a893fbbfa802e185245554f57",
"manifest.json": "e5e448b126d6f6c89b33b7afb09425ef",
"version.json": "ca714610d03eb45fbc1202682b3ee080",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
