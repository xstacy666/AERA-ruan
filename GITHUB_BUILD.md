# Building AERA for `ruan` with GitHub

## Can free GitHub Actions do it? No.

| Runner | CPU / RAM / Disk | AERA build? |
|---|---|---|
| `ubuntu-latest` (free, public repos) | 2 / 7 GB / 14 GB | ❌ source alone is ~80–120 GB |
| GitHub larger runner (Team/Enterprise, paid) | 8 / 32 GB / 300 GB | ✅ |
| WarpBuild / RunsOn x64 runner (any GitHub account, paid per minute) | 8 / 32 GB / 150 GB | ✅ |

Cost on an 8-core runner: roughly **3–6 hours × $0.016–0.022/min ≈ $3–8** for one build.

## What I prepared

- `build_aera_ruan.yml` — complete workflow. Put it at `.github/workflows/build.yml`
  in a GitHub repo whose root contains the device tree (extract
  `aera_ruan_device_tree.tar.gz` into the repo root).
- It syncs AERA `aera-16.0` with `--depth=1`, adds the common deps via a local
  manifest (the `ruan` tree is supplied by the checkout), builds
  `twrp_ruan-bp2a-eng`, and uploads `recovery.img` as an Actions artifact.

## Before running

1. Change `runs-on:` in the workflow to a real larger-runner label:
   - GitHub larger runner: `ubuntu-24.04-8core`
   - WarpBuild: `warp-ubuntu-latest-x64-8x`
2. Trigger with **Run workflow** (workflow_dispatch) — avoid accidental push-triggered costs.
3. Watch the log; if it fails, paste the last ~100 lines back to me and I'll fix the config.

## Two ways to proceed

**A) You do the GitHub part.** Create an empty GitHub repo, extract the tarball,
push the files, add the workflow, run it, then send me the artifact (or download
it onto this tablet).

**B) I do the GitHub part from here.** Create an **empty** GitHub repo and send me:
- the repo URL, and
- a temporary fine-grained Personal Access Token with **Contents: read/write**
  and **Workflows: read/write** (revoke it afterwards).

I can then push the 466-file tree from this device, add the workflow, trigger the
build, and monitor it. (I won't store the token anywhere.)

## Flashing the result without a laptop

This tablet is rooted (KernelSU), so once you have `recovery.img` on it, no PC is
needed — I can write it to the active slot with root:

```sh
su
SLOT=$(getprop ro.boot.slot_suffix); [ -n "$SLOT" ] || SLOT=_a
dd if=/sdcard/recovery.img of=/dev/block/by-name/recovery${SLOT} bs=4M
sync
```

**Boot-test safely**: you can try `fastboot boot recovery.img` from another Android
device over OTG before permanently writing the partition. Never flash an untested image.
