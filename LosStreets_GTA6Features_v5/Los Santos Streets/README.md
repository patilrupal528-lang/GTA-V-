# GTA V Mobile — Enhanced v4

A browser-based 3D open-world game built with React Three Fiber, inspired by GTA V's Los Santos.

## 🆕 What's New in v4

### 1. Building Collision System
- **AABB (Axis-Aligned Bounding Box)** collision detection against all buildings
- Player and NPCs can no longer walk through walls
- Collision response pushes the player out along the shortest axis
- Zero performance overhead — pure JavaScript, no WASM required
- File: `src/utils/buildingCollisions.ts`

### 2. A* Pathfinding AI
- Police cars now use **A* pathfinding** to navigate around buildings
- Grid-based navigation mesh (2-unit cells) covering the entire map
- Police recalculate paths every ~2.5 seconds to track the player
- 8-directional movement with diagonal support
- Falls back to direct pursuit in open areas
- Staggered path updates to spread CPU cost across frames
- Files: `src/utils/pathfinding.ts`, `src/components/game/Police.tsx`

### 3. LOD & Frustum Culling
- Buildings beyond **260 units** are completely hidden (culled)
- Glass/window details only rendered on nearby buildings
- NPCs, traffic cars, and street lamps all have individual distance culling
- Traffic cars slow down near the player to simulate awareness
- File: `src/components/game/World.tsx`

### 4. Advanced Animation System
- **Step-phase based** walk/run animation (replaces simple sine wave)
- Smooth `runBlend` transition between walk and run speeds
- **Head bob** tied to step phase
- **Body lean** on left/right turns
- **Aim blend** — arms smoothly raise when shooting
- NPCs have independent step phases (no synchronized walking)
- Shoe soles, belt, neck, mouth added to character model
- Files: `src/components/game/Player.tsx`, `src/components/game/NPCs.tsx`

### 5. Zustand State Management
- Game state migrated from `useState` to **Zustand** with `subscribeWithSelector`
- Transient per-frame values (vehicleSpeed, timeOfDay) no longer cause full React re-renders
- All game actions (spawnBullet, toggleNoCrash, handleSave) centralized in store
- File: `src/store/gameStore.ts`

### 6. Vehicle Physics Improvements
- **Steering momentum** — steer angle blends smoothly
- **Body roll** on turns (visual tilt)
- Proper friction and braking model
- Traffic cars slow near player for collision avoidance
- Animated wheel rotation on traffic vehicles

## 🎮 Controls

| Action | Keyboard | Mobile |
|--------|----------|--------|
| Move | WASD / Arrow Keys | Left Joystick |
| Run | Shift | Run Button |
| Enter/Exit Vehicle | F | Enter Button |
| Shoot | Space | Shoot Button |
| Pause | P / Escape | PAUSE button |
| Inventory | I | BAG button |
| Wardrobe | C | FIT button |

## 🏙️ Los Santos Map
- **Downtown LS** — Maze Bank Tower, FIB HQ, skyscrapers
- **Vinewood** — Celebrity mansions, Vinewood Sign
- **Rockford Hills** — Beverly Hills equivalent
- **Little Seoul** — Commercial district
- **Del Perro** — Beach pier with Ferris wheel
- **LSIA Airport** — Runways, terminal, control tower
- **Fort Zancudo** — Military base
- **Mount Chiliad** — Snow-capped mountain

## 🚗 55+ Vehicles
Super cars, sports cars, muscle cars, classics, SUVs, and sedans.

## 🛠️ Tech Stack
- React + Vite
- @react-three/fiber + @react-three/drei
- Three.js
- Zustand (state management)
- TypeScript

## 🚀 Running Locally
```bash
npm install
npm run dev
```
