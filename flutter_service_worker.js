'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/logo.png": "6caf91c3e97b50e72ba10c923fb62e3b",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/feather_icons/fonts/feather.ttf": "0d0d92d310cc68e53796bf15c36838c2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "8cbadbfc7bf0e24f19b68887740052a3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "8310fedb9a91820079d90317b6a74725",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "8d1ec8663e2894ff43839dac91396763",
"assets/AssetManifest.bin": "d60280dda4a1edb2deaa6b69cbebc551",
"assets/fonts/MaterialIcons-Regular.otf": "d8c99b936023264b4f50bdcd0089d06f",
"assets/AssetManifest.json": "2a4d13005537554685d3565dd7456271",
"assets/FontManifest.json": "cab905cb3aac16cd8f8b52a8d504c382",
"assets/assets/screenshots/GRATEFUL_REAL_SOL_00.png": "c1250d701a78b1bbb2d1f1c1a3825bfc",
"assets/assets/screenshots/MALARIA_NEODOCS_00.png": "14110c4def1a33fa7b8358d0207c7dfc",
"assets/assets/screenshots/CUSTOMER_WIOM_02.png": "49e587223a6f565376768fee52b13e54",
"assets/assets/screenshots/neodocs_kidney_02.png": "3e97add34de057fe6ccb31dfea570573",
"assets/assets/screenshots/nimbus_2.jpg": "ea5fbe9d1b6bfa0ecc5a065cf732400a",
"assets/assets/screenshots/GRATEFUL_REAL_SOL_02.png": "16dec12fbb7fe3c7cf3c8d1fb98cfa40",
"assets/assets/screenshots/lms_wiom.png": "21440191a80ada2cc2167eff0e12a801",
"assets/assets/screenshots/PROGRAMMING_HUB_REAL_SOL_01.png": "8332207d63dbd9a23b712d2c217fef85",
"assets/assets/screenshots/PROGRAMMING_HUB_REAL_SOL_00.png": "49b4a427bfd146cc44381a4e8ae20265",
"assets/assets/screenshots/PARTNER_WIOM_V2_01.png": "ed4d7547ec1bbb0d336755a28e986d8d",
"assets/assets/screenshots/CUSTOMER_WIOM_01.png": "856fe25532befc9fc5b3a2b1415dba0a",
"assets/assets/screenshots/neodocs_kidney_01.png": "8f9962c6297ce235e905e205bbcae652",
"assets/assets/screenshots/JAMMERZ_PERSONAL_01.png": "b9f9502086a22aa9330cae4481fc3998",
"assets/assets/screenshots/PARTNER_WIOM_V1_01.png": "482d4fd39cc531be13f14be6e76ea615",
"assets/assets/screenshots/CUSTOMER_WIOM_04.png": "4ef91e95e23a6018d3f5463cd2182f57",
"assets/assets/screenshots/MALARIA_NEODOCS_01.png": "28273cd4a3dd2fc13e15a8ec4d9719fc",
"assets/assets/screenshots/JAMMERZ_PERSONAL_00.png": "fc68cd3271067c165516cd05756d2815",
"assets/assets/screenshots/JAMMERZ_PERSONAL_02.png": "23ea79e984ab3e53955ecc02247c8b1e",
"assets/assets/screenshots/EXPERT_WIOM_01.jpg": "66bfa7b57229949145e99e2b105f4173",
"assets/assets/screenshots/GRATEFUL_REAL_SOL_01.png": "70fffe31086d035ff792c821ea85c046",
"assets/assets/screenshots/PREGAFAITH_NEODOCS_00.png": "a3835417c8014357b103c034dbcf0968",
"assets/assets/screenshots/EXPERT_WIOM_00.jpg": "3790ed3f7055615cd5eff14c8bb28290",
"assets/assets/screenshots/CUSTOMER_WIOM_00.jpg": "b9ae9852bec273322f42f34a896ec955",
"assets/assets/screenshots/CUSTOMER_WIOM_03.png": "cf5d34f3b04e48722b5c0cde0d827222",
"assets/assets/screenshots/PARTNER_WIOM_V1_02.png": "511447715223f478aa650ba5611d7c01",
"assets/assets/screenshots/GMAGICA_MOOV_MONEY_CI_00.png": "e69c07959b439ab45db6f0e969fb4743",
"assets/assets/screenshots/GMAGICA_MOOV_MONEY_TOGO_00.png": "c87d5f37135b461021ac739492ee1fe4",
"assets/assets/screenshots/JAMMERZ_PERSONAL_04.png": "dfb93dd3fe50d26f63655146eaab4f08",
"assets/assets/screenshots/PARTNER_WIOM_V2_02.png": "f400b010f791c1fae1d940d2bb5ed4a1",
"assets/assets/screenshots/CUSTOMER_WIOM_05.png": "a3b437bc8bda0326bbfa10f76d0fa17e",
"assets/assets/screenshots/PREGAFAITH_NEODOCS_01.png": "64c48d9c21ee681961b00cdb1bdf8be8",
"assets/assets/screenshots/nimbus.jpg": "831178d39924fd7ec75d5f08db95d821",
"assets/assets/screenshots/JAMMERZ_PERSONAL_05.png": "b63abf0e4c1044ccf46ad20a84a7e8c6",
"assets/assets/screenshots/JAMMERZ_PERSONAL_03.png": "633265fee5af0cd1b45cc43baab4afe9",
"assets/assets/images/box_cover_gold.png": "a58f0270c1fd04d7eae1217c7e5645b9",
"assets/assets/images/dots_globe_grey.png": "bb16bba932c2e98f3dbe3e6b1b6a864b",
"assets/assets/images/dev_aboutme_o.png": "926d5cf3504b4714295216737b617e69",
"assets/assets/images/box_cover_dark.png": "34f90bdba46732221c608605016c40d5",
"assets/assets/images/hi_there.png": "1ac6f5101b6a5511f4ad8f8965a49f89",
"assets/assets/images/dev_award.png": "22c533fa997ad8100290ac25636ee9f4",
"assets/assets/images/blog_02.jpg": "01c4b84663980a0b4f55f4bd196492bd",
"assets/assets/images/dev_header_o.png": "6e4b03020cee4b554c35ef65a45b0a05",
"assets/assets/images/blob_drumstick_black.png": "381f70d9f8dd4fbbb720214fa02939a2",
"assets/assets/images/image-removebg-preview.png": "0a9fa8f5df06abe7fba67375f5d1d5b1",
"assets/assets/images/rohitashwa_singh_logo.png": "a9975701530ffc665421797d44c8eb23",
"assets/assets/images/dev_award_o.png": "9330277f7c4279bb73c0f637f6871af1",
"assets/assets/images/blob_bean_ash.png": "bc902ac538eedf1abc48457bbf064fd1",
"assets/assets/images/logo.png": "6caf91c3e97b50e72ba10c923fb62e3b",
"assets/assets/images/icon_box.jpg": "7a18b9b091db5fe0fc16c76a3ffd5db2",
"assets/assets/images/blog_01.jpg": "cd78990246f63c4d64ca5c26bcf31289",
"assets/assets/images/dots_globe_yellow.png": "d908b032e1a46382b6e6c2baf92e188c",
"assets/assets/images/dev_aboutme.png": "56932a4e279331ce2e4e1bb3882e980c",
"assets/assets/images/blob_ash.png": "f76b87a8dd8bb4ad017b441854541a2b",
"assets/assets/images/blob_black.png": "14198d608b7f0980998d329cd353e290",
"assets/assets/images/dev_header.png": "f28c1af75bbfbd013004e46486ecfc1e",
"assets/assets/images/indian-national-flag.jpg": "0d697db3bd4a732ddec2c97bb5bb8d5b",
"assets/assets/images/k.png": "21ea8f79cfc69b619c767fa9573b5295",
"assets/assets/images/blob_femur_ash.png": "b899f92250a0f7220db5c45bea2080c8",
"assets/assets/images/blog_03.jpg": "5f88a99b651c6dbad988d684c6fc41b3",
"assets/assets/images/image-removebg-preview%2520(1).png": "2ca2c0a801a50c6acf30002d608c9fd5",
"assets/assets/images/dots_globe_yellow2.png": "d1394584431e43b6973ca031de59a284",
"assets/assets/images/blob_small_bean_ash.png": "411605e065607a48e110cedc91bebd82",
"assets/NOTICES": "23e7206c07aa83d532024ef5614bd59b",
"assets/AssetManifest.bin.json": "1d1b652722a3100873ba95c301733a97",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"manifest.json": "1082cca331be1c034ce2f7a2b0acc70e",
"index.html": "c3cb40700c6549603b443b874c76eff1",
"/": "c3cb40700c6549603b443b874c76eff1",
"version.json": "e5c3a2e7c6ad8ca9d4b1da1be392d211",
"flutter_bootstrap.js": "86429d8dc7968e4cfc68eef94204ebf1",
"CNAME": "75514baec80d49dd3474330840d5b698",
"main.dart.js": "5cce653e12d150fdb86c504ea85340b2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
