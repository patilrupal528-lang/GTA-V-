# Play Store Upload Guide — Los Santos Streets

## ⚠️ IMPORTANT: App Name Change
The original app was named "GTA V Mobile" which is a **Rockstar Games trademark**.
This would result in **immediate Play Store rejection**.
This package uses the name **"Los Santos Streets"** to avoid trademark issues.

---

## Step 1: Install Requirements (One-time setup)
On your local machine install:
1. **Node.js 18+** — https://nodejs.org
2. **JDK 17** — https://adoptium.net
3. **Android Studio** — https://developer.android.com/studio
   - During install: add Android SDK, Android Emulator, API level 33+

---

## Step 2: Install Dependencies
```bash
npm install
```

## Step 3: Build the Web App
```bash
npm run build
```
This creates `dist/` folder with the optimized game bundle.

## Step 4: Set Up Capacitor Android
```bash
npx cap add android
npx cap sync
```

## Step 5: Open in Android Studio
```bash
npx cap open android
```
Android Studio will open. Wait for Gradle sync to complete.

## Step 6: Build Release AAB (Android App Bundle)
In Android Studio:
1. Menu: **Build → Generate Signed Bundle / APK**
2. Choose **Android App Bundle**
3. Create a new keystore (save it safely — you'll need it forever!)
   - Key alias: any name
   - Password: strong password
   - Validity: 25 years
   - Fill in name/org fields
4. Select **release** build variant
5. Click **Finish**

The `.aab` file will be in:
`android/app/build/outputs/bundle/release/app-release.aab`

---

## Step 7: Play Store Setup
1. Go to https://play.google.com/console
2. Create new app: **"Los Santos Streets"**
3. Fill in details:
   - **Category**: Games → Action
   - **Content Rating**: Run the questionnaire → Teen (13+) due to simulated violence
   - **Privacy Policy URL**: Host `public/privacy_policy.html` on any free host (GitHub Pages, etc.)
4. Upload your `app-release.aab`
5. Add screenshots (run on Android emulator, take screenshots)
6. Required icons: Already included in `public/icons/` — use `icon-512.png` for Play Store

---

## Quick Build Script
Run `./build_aab.sh` for automated steps 2–5 (requires Android Studio already installed).

---

## Capacitor App Config
- **App ID**: `com.lossantosstreets.game`
- **App Name**: Los Santos Streets
- **Orientation**: Landscape (forced)
- **Fullscreen**: Yes

---

## GameAI System
The autonomous GameAI runs silently in the background:
- Zero internet usage — all local
- Catches crashes and restores game state
- Monitors FPS — auto-reduces quality if below 12 FPS
- Tests state integrity every 8 seconds
- Auto-saves every 90 seconds to localStorage
- Accessible via Chrome DevTools: type `__gameAI.getReport()` in console
