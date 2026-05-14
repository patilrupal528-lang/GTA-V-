import type { CapacitorConfig } from "@capacitor/cli";

const config: CapacitorConfig = {
  appId: "com.lossantosstreets.game",
  appName: "Los Santos Streets",
  webDir: "dist",
  server: {
    androidScheme: "https",
    cleartext: false,
  },
  android: {
    allowMixedContent: false,
    webContentsDebuggingEnabled: false,
    backgroundColor: "#000000",
    useLegacyBridge: false,
  },
};

export default config;
