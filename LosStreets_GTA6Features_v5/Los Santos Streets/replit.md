# Los Santos Streets — GTA VI Leonida Edition

A mobile-first open-world GTA VI inspired game set in the fictional state of **Leonida** (based on Florida). Built with React Three Fiber + Capacitor (Android).

## Regions

| Region | Inspiration | Coords (x, z) |
|---|---|---|
| Vice City | Miami — neon beaches, skyscrapers, Art Deco | x: 60–280, z: -60 to 160 |
| Ocean Drive | South Beach boardwalk, luxury clubs | x: 238–340, z: -80 to 170 |
| Leonida Keys | Florida Keys island chain | x: 90–160, z: 220–680 |
| Grassrivers | Everglades wetlands, alligators | x: -380 to -70, z: 40–320 |
| Port Gellhorn | Industrial docks, oil refinery | x: -420 to -220, z: -300 to -150 |
| Lake Leonida | Inland lake, fishing village | x: -130 to 130, z: -380 to -200 |
| Mount Caliga | Mountain wilderness, snow peaks, cable car | x: -280 to 280, z: -630 to -380 |

## Graphics Tiers

| Tier | DPR | Resolution | Antialias | Far Clip |
|---|---|---|---|---|
| Low | 1.0 | HD | No | 700 |
| Mid | 2.0 | **2K / QHD** | Yes | 1200 |
| High | 4.0 | 4K–8K | Yes | 1800 |

Override: add `?quality=2k` or `?quality=high` to URL for forced 2K/high mode.

## Stack

- React 18 + TypeScript + Vite (bundler)
- **React Three Fiber** (Three.js renderer)
- **Capacitor** (Android wrapper)
- **Zustand** (game state store)
- Web Audio API (procedural audio — no asset files needed)
- All geometry: Three.js primitives (no external GLTF models)

## World Architecture

- `World.tsx` — full Leonida map (1800×1800 units). Every region is a separate React component wrapped in `CulledGroup` for LOD visibility culling.
- `playerWorldPos` (THREE.Vector3 singleton, exported from `Player.tsx`) — all culling tests use this.
- `CulledGroup` — `useFrame`-based visibility toggle: sets `group.visible` based on distance from player.

## Key Files

| File | Purpose |
|---|---|
| `src/components/game/World.tsx` | Leonida world map |
| `src/components/game/Missions.tsx` | 12 story missions (Lucia / Jason / Cal) |
| `src/components/game/HUD.tsx` | HUD + Leonida minimap |
| `src/components/game/NPCs.tsx` | 20 animated NPCs |
| `src/components/game/Vehicles.tsx` | 50+ vehicle spawn system |
| `src/components/game/Audio.tsx` | Procedural Web Audio API sounds |
| `src/utils/DeviceProfile.ts` | GPU tier detection + DPR caps |
| `src/utils/buildingCollisions.ts` | AABB collision for Leonida buildings |

## Characters

- **Lucia** — Vice City operations, primary protagonist
- **Jason** — Ocean Drive / Port Gellhorn missions
- **Cal** — Grassrivers & wilderness specialist

## Run

```
cd "Los Santos Streets"
npm install
npm run dev
```

Build for Android:
```
npm run build
npx cap copy android
npx cap open android
```

## User Preferences

- GTA VI Leonida map — Florida-inspired, 1800×1800 units world
- 2K graphics on mid-tier (DPR 2.0), ?quality=2k URL override
- All audio is procedural Web Audio API
- No external 3D model files — all Three.js primitives
