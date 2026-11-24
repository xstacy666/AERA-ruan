# AERA Recovery starter tree — Xiaomi POCO Pad 5G / Redmi Pad Pro 5G (`ruan`)

**Status: STARTER / UNTESTED — do not flash to your daily driver yet.**

Device: SM7435 "parrot", 1600x2560, A/B + recovery partition, virtual A/B,
F2FS userdata with FBEv2 wrapped keys + metadata encryption.

## Where this came from

| Part | Source |
|---|---|
| Build system / AERA flags | `AERA-Recovery/android_device_xiaomi_garnet-AERA` (same SoC) |
| Decryption HALs, keymint, boot control, touch firmware | `rd-trees/device_xiaomi_dizi-recovery` (fox_16.0), proven on dizi/ruan |
| `recovery.fstab`, `twrp.flags`, `fstab.postinstall` | extracted from the OrangeFox recovery actually installed on this ruan |
| `prebuilts/dtbo.img` | dumped from `dtbo_a` on this ruan |

## Build (on a real x86_64 Linux machine)

```bash
mkdir aera && cd aera
repo init --depth=1 -u https://github.com/AERA-Recovery/android_manifest -b aera-16.0
mkdir -p .repo/local_manifests
cp /path/to/ruan.xml .repo/local_manifests/ruan.xml
repo sync -c --no-clone-bundle --no-tags

export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_ruan-bp2a-eng
mka recoveryimage
```

Output: `out/target/product/ruan/recovery.img`

## MUST verify before flashing

1. **Boot-test first**: `fastboot boot recovery.img`. Never `fastboot flash` until it boots.
2. **Display height**: `AERA_SCREEN_H := 2560` in `aera_ruan.mk` is a starting guess.
3. **Decryption**: FBEv2 + metadata; the bundled HALs came from HyperOS 3 dizi/ruan.
   Test with your lock-screen PIN/password.
4. **Wi-Fi / modules**: `AERA_LOAD_VENDOR_MODULES` came from dizi; confirm the Wi-Fi
   and touch modules match your installed ROM's `vendor_boot` modules.
5. **dtbo**: confirm the dumped `dtbo_a.img` matches the active slot and firmware.
6. **TW_ flags**: AERA ignores most legacy `TW_*` UI flags; they are kept as a
   reference from the working OrangeFox bring-up and can be removed later.

See `NOTES.md` for the extracted device data.
